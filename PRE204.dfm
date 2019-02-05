object FCartaDesignacion: TFCartaDesignacion
  Left = 19
  Top = 36
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Previsi'#243'n Social'
  ClientHeight = 532
  ClientWidth = 712
  Color = 13165023
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCabecera: TPanel
    Left = 2
    Top = 1
    Width = 709
    Height = 529
    BevelOuter = bvNone
    BorderWidth = 1
    Color = 10207162
    TabOrder = 0
    object TLabel
      Left = 7
      Top = 10
      Width = 236
      Height = 31
      AutoSize = False
      Caption = 'Carta de Beneficiarios'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -21
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 242
      Top = 4
      Width = 463
      Height = 42
      Color = 13165023
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object TLabel
        Left = 6
        Top = 2
        Width = 55
        Height = 15
        Caption = 'Compa'#241#237'a :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object TLabel
        Left = 263
        Top = 2
        Width = 46
        Height = 15
        Caption = 'N'#250'mero :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object TLabel
        Left = 351
        Top = 2
        Width = 92
        Height = 15
        Caption = 'Fecha Recepci'#243'n :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object dbeDescripCia: TwwDBEdit
        Left = 60
        Top = 18
        Width = 197
        Height = 19
        AutoSize = False
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 13165023
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        Frame.Enabled = True
        Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
        ParentFont = False
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dblcCia: TwwDBLookupCombo
        Left = 6
        Top = 18
        Width = 49
        Height = 19
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        BorderStyle = bsNone
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CIAID'#9'3'#9'Id'#9'F'
          'CIADES'#9'40'#9'Descripci'#243'n'#9'F')
        DataField = 'CIAID'
        DataSource = DM1.dsMaestCartas
        LookupTable = DM1.cdsCompania
        LookupField = 'CIAID'
        Options = [loTitles]
        Color = 13165023
        Frame.Enabled = True
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcCiaExit
        OnKeyPress = dblcCiaKeyPress
        OnNotInList = dblcCiaNotInList
      end
      object dbeNroCarta: TwwDBEdit
        Left = 263
        Top = 18
        Width = 83
        Height = 19
        AutoSize = False
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 13165023
        DataField = 'DSGNRO'
        DataSource = DM1.dsMaestCartas
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        Frame.Enabled = True
        Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
        ParentFont = False
        TabOrder = 2
        UnboundDataType = wwDefault
        UnboundAlignment = taRightJustify
        WantReturns = False
        WordWrap = False
      end
      object dbdtpFecRecepcion: TwwDBDateTimePicker
        Left = 349
        Top = 18
        Width = 109
        Height = 19
        AutoSize = False
        BorderStyle = bsNone
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Color = 13165023
        DataField = 'DSGFREC'
        DataSource = DM1.dsMaestCartas
        Epoch = 1950
        Frame.Enabled = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 3
      end
    end
    object Panel1: TPanel
      Left = 4
      Top = 47
      Width = 701
      Height = 207
      Color = 13165023
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Bevel3: TBevel
        Left = 4
        Top = 3
        Width = 692
        Height = 168
      end
      object TLabel
        Left = 280
        Top = 77
        Width = 98
        Height = 15
        Caption = 'Estado de la Carta :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object TLabel
        Left = 393
        Top = 4
        Width = 41
        Height = 15
        Caption = 'C'#243'digo :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object TLabel
        Left = 508
        Top = 4
        Width = 86
        Height = 15
        Caption = 'C'#243'digo Modular :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object TLabel
        Left = 99
        Top = 77
        Width = 108
        Height = 15
        Caption = 'Estado del Asociado :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object TLabel
        Left = 11
        Top = 115
        Width = 82
        Height = 15
        Caption = 'Observaciones :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object TLabel
        Left = 11
        Top = 77
        Width = 54
        Height = 15
        Caption = 'D.N.I/L.E.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object TLabel
        Left = 11
        Top = 40
        Width = 100
        Height = 15
        Caption = 'Unidad de Proceso :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object TLabel
        Left = 227
        Top = 40
        Width = 84
        Height = 15
        Caption = 'Unidad de Pago :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object TLabel
        Left = 463
        Top = 40
        Width = 35
        Height = 15
        Caption = 'U.S.E :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object TLabel
        Left = 462
        Top = 77
        Width = 97
        Height = 15
        Caption = 'Fecha de Registro :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object TLabel
        Left = 579
        Top = 77
        Width = 100
        Height = 15
        Caption = 'Fecha de Apertura :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object lblFecAnul: TLabel
        Left = 463
        Top = 115
        Width = 105
        Height = 15
        Caption = 'Fecha de Anulaci'#243'n :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 11
        Top = 4
        Width = 110
        Height = 15
        Caption = 'Apellidos y Nombres :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object dblcEstCarta: TwwDBLookupCombo
        Left = 280
        Top = 95
        Width = 46
        Height = 19
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        BorderStyle = bsNone
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PVSESTDSG'#9'2'#9'Estado Id'#9'F'
          'PVSESTDES'#9'15'#9'Descripci'#243'n'#9'F')
        DataField = 'DSGESTAD'
        DataSource = DM1.dsMaestCartas
        LookupTable = DM1.cdsEstCarta
        LookupField = 'PVSESTDSG'
        Options = [loColLines, loRowLines, loTitles]
        Color = 13165023
        Enabled = False
        Frame.Enabled = True
        Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
        ParentFont = False
        TabOrder = 9
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        UseTFields = False
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcEstCartaExit
        OnKeyPress = dblcCiaKeyPress
        OnNotInList = dblcCiaNotInList
      end
      object dbeEstCarta: TwwDBEdit
        Left = 331
        Top = 95
        Width = 126
        Height = 19
        AutoSize = False
        BorderStyle = bsNone
        Color = 13165023
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        Frame.Enabled = True
        Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
        ParentFont = False
        TabOrder = 10
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeCodModular: TwwDBEdit
        Left = 506
        Top = 19
        Width = 97
        Height = 19
        AutoSize = False
        BorderStyle = bsNone
        Color = 13165023
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        Frame.Enabled = True
        Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
        ParentFont = False
        TabOrder = 2
        UnboundDataType = wwDefault
        UnboundAlignment = taRightJustify
        WantReturns = False
        WordWrap = False
      end
      object dblcEstAsociado: TwwDBLookupCombo
        Left = 99
        Top = 95
        Width = 47
        Height = 19
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        BorderStyle = bsNone
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'ASOSITID'#9'2'#9'Estado Id'#9'F')
        LookupTable = DM1.cdsSituacAsoc
        LookupField = 'ASOSITID'
        Options = [loColLines, loTitles]
        Color = 13165023
        Enabled = False
        Frame.Enabled = True
        Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
        ParentFont = False
        TabOrder = 7
        AutoDropDown = False
        ShowButton = True
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcEstAsociadoExit
        OnKeyPress = dblcCiaKeyPress
      end
      object dbeEstAsoc: TwwDBEdit
        Left = 152
        Top = 95
        Width = 123
        Height = 19
        AutoSize = False
        BorderStyle = bsNone
        Color = 13165023
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        Frame.Enabled = True
        Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
        ParentFont = False
        TabOrder = 8
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbreObs: TwwDBRichEdit
        Left = 11
        Top = 132
        Width = 438
        Height = 35
        AutoURLDetect = False
        BorderStyle = bsNone
        Color = 13165023
        DataField = 'DSGOBS'
        DataSource = DM1.dsMaestCartas
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        Frame.Enabled = True
        Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
        ParentFont = False
        PrintJobName = 'Delphi 5'
        TabOrder = 13
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
          A40000007B5C727466315C616E73695C616E7369637067313235325C64656666
          305C6465666C616E6731303235307B5C666F6E7474626C7B5C66305C666E696C
          5C66636861727365743020436F6D69632053616E73204D533B7D7D0D0A7B5C63
          6F6C6F7274626C203B5C726564305C677265656E305C626C7565303B7D0D0A5C
          766965776B696E64345C7563315C706172645C6366315C66305C667331345C70
          61720D0A7D0D0A00}
      end
      object dbeDNI: TwwDBEdit
        Left = 11
        Top = 95
        Width = 84
        Height = 19
        AutoSize = False
        BorderStyle = bsNone
        Color = 13165023
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        Frame.Enabled = True
        Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
        ParentFont = False
        TabOrder = 6
        UnboundDataType = wwDefault
        UnboundAlignment = taRightJustify
        WantReturns = False
        WordWrap = False
      end
      object dbeUProceso: TwwDBEdit
        Left = 11
        Top = 55
        Width = 210
        Height = 19
        BorderStyle = bsNone
        Color = 13165023
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        Frame.Enabled = True
        Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
        ParentFont = False
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeUPago: TwwDBEdit
        Left = 227
        Top = 55
        Width = 225
        Height = 19
        BorderStyle = bsNone
        Color = 13165023
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        Frame.Enabled = True
        Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
        ParentFont = False
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeUSE: TwwDBEdit
        Left = 463
        Top = 55
        Width = 225
        Height = 19
        BorderStyle = bsNone
        Color = 13165023
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        Frame.Enabled = True
        Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
        ParentFont = False
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbdtpFecOper: TwwDBDateTimePicker
        Left = 462
        Top = 95
        Width = 109
        Height = 19
        AutoSize = False
        BorderStyle = bsNone
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Color = 13165023
        DataField = 'DSGFAPER'
        DataSource = DM1.dsMaestCartas
        Epoch = 1950
        Frame.Enabled = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 11
        DisplayFormat = 'dd/mm/yyyy'
      end
      object sbtnAceptar: TfcShapeBtn
        Left = 563
        Top = 174
        Width = 34
        Height = 31
        Hint = 'Grabar Carta'
        Color = 13165023
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
        TabOrder = 14
        TabStop = True
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        OnClick = sbtnAceptarClick
      end
      object sbtnCancelar: TfcShapeBtn
        Left = 637
        Top = 174
        Width = 34
        Height = 31
        Hint = 'Cancelar'
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
        Shape = bsEllipse
        ShowHint = True
        TabOrder = 15
        TabStop = True
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        OnClick = sbtnCancelarClick
      end
      object dbeCodAsociado: TwwDBEdit
        Left = 393
        Top = 19
        Width = 104
        Height = 19
        AutoSize = False
        BorderStyle = bsNone
        Color = 13165023
        DataField = 'ASOID'
        DataSource = DM1.dsMaestCartas
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        Frame.Enabled = True
        Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
        ParentFont = False
        TabOrder = 1
        UnboundDataType = wwDefault
        UnboundAlignment = taRightJustify
        WantReturns = False
        WordWrap = False
        OnKeyPress = dblcCiaKeyPress
      end
      object dbdtpFecApertura: TwwDBDateTimePicker
        Left = 579
        Top = 95
        Width = 109
        Height = 19
        AutoSize = False
        BorderStyle = bsNone
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Color = 13165023
        DataField = 'FECAPER'
        DataSource = DM1.dsMaestCartas
        Epoch = 1950
        Frame.Enabled = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 12
        DisplayFormat = 'dd/mm/yyyy'
        OnExit = dbdtpFecAperturaExit
      end
      object sbtnAnular: TfcShapeBtn
        Left = 523
        Top = 174
        Width = 34
        Height = 31
        Hint = 'Anular Carta'
        Color = 13165023
        DitherColor = clWhite
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
          33333337777FF377FF3333993370739993333377FF373F377FF3399993000339
          993337777F777F3377F3393999707333993337F77737333337FF993399933333
          399377F3777FF333377F993339903333399377F33737FF33377F993333707333
          399377F333377FF3377F993333101933399377F333777FFF377F993333000993
          399377FF3377737FF7733993330009993933373FF3777377F7F3399933000399
          99333773FF777F777733339993707339933333773FF7FFF77333333999999999
          3333333777333777333333333999993333333333377777333333}
        NumGlyphs = 2
        Options = [boFocusable]
        ParentClipping = True
        ParentShowHint = False
        RoundRectBias = 25
        ShadeStyle = fbsHighlight
        Shape = bsEllipse
        ShowHint = True
        TabOrder = 16
        TabStop = True
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        OnClick = sbtnAnularClick
      end
      object dbdtpFecAnul: TwwDBDateTimePicker
        Left = 463
        Top = 132
        Width = 109
        Height = 19
        AutoSize = False
        BorderStyle = bsNone
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Color = 13165023
        DataField = 'PVSFANUL'
        DataSource = DM1.dsMaestCartas
        Epoch = 1950
        Frame.Enabled = True
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 17
        DisplayFormat = 'dd/mm/yyyy'
      end
      object dbeApeNom: TwwDBEdit
        Left = 11
        Top = 19
        Width = 369
        Height = 19
        AutoSize = False
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 13165023
        DataField = 'DSGNOMBRT'
        DataSource = DM1.dsMaestCartas
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        Frame.Enabled = True
        Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbeApeNomExit
      end
      object bbtnAdicionar: TfcShapeBtn
        Left = 601
        Top = 174
        Width = 34
        Height = 31
        Hint = 'Adicionar Beneficiarios'
        Color = 13165023
        DitherColor = clWhite
        Glyph.Data = {
          F2010000424DF201000000000000760000002800000024000000130000000100
          0400000000007C01000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
          3333333333388F3333333333000033334224333333333333338338F333333333
          0000333422224333333333333833338F33333333000033422222243333333333
          83333338F3333333000034222A22224333333338F33F33338F33333300003222
          A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
          38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
          2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
          0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
          333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
          33333A2224A2233333333338F338F83300003333333333A2224A333333333333
          8F338F33000033333333333A222433333333333338F338F30000333333333333
          A224333333333333338F38F300003333333333333A223333333333333338F8F3
          000033333333333333A3333333333333333383330000}
        NumGlyphs = 2
        Options = [boFocusable]
        ParentClipping = True
        ParentShowHint = False
        RoundRectBias = 25
        ShadeStyle = fbsHighlight
        Shape = bsEllipse
        ShowHint = True
        TabOrder = 18
        TabStop = True
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        OnClick = bbtnAdicionarClick
      end
    end
    object pnlDatosBenef: TPanel
      Left = 4
      Top = 256
      Width = 701
      Height = 269
      Color = 13165023
      TabOrder = 2
      object Bevel1: TBevel
        Left = 4
        Top = 3
        Width = 692
        Height = 260
      end
      object fcLabel1: TfcLabel
        Left = 14
        Top = 7
        Width = 145
        Height = 23
        Caption = 'Detalle de la Carta '
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsItalic]
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaTop
      end
      object dbgDetalleCarta: TwwDBGrid
        Left = 10
        Top = 31
        Width = 680
        Height = 228
        DisableThemesInTitle = False
        Selected.Strings = (
          'USERID'#9'20'#9'USERID'#9'F'
          'USERNOM'#9'30'#9'USERNOM'#9'F'
          'GRUPOID'#9'20'#9'GRUPOID'#9'F'
          'PASSWORD'#9'20'#9'PASSWORD'#9'F'
          'FLAGCONTROL'#9'25'#9'FLAGCONTROL'#9'F'
          'MODULOID'#9'20'#9'MODULOID'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = cl3DLight
        FixedCols = 0
        ShowHorzScrollBar = True
        Color = clInfoBk
        DataSource = DM1.dsDetCartas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyOptions = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clNavy
        TitleFont.Height = -11
        TitleFont.Name = 'Comic Sans MS'
        TitleFont.Style = []
        TitleLines = 2
        TitleButtons = False
        OnDblClick = dbgDetalleCartaDblClick
        OnKeyDown = dbgDetalleCartaKeyDown
        FooterColor = cl3DLight
        FooterCellColor = clHighlightText
        object dbgIbDetalleCartaIButton: TwwIButton
          Left = 0
          Top = 0
          Width = 31
          Height = 34
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
          OnClick = dbgIbDetalleCartaIButtonClick
        end
      end
      object pnlDetCarta: TPanel
        Left = 44
        Top = 38
        Width = 645
        Height = 209
        BevelInner = bvLowered
        BevelWidth = 2
        Color = 13165023
        TabOrder = 1
        Visible = False
        object Bevel2: TBevel
          Left = 7
          Top = 7
          Width = 631
          Height = 163
        end
        object TLabel
          Left = 16
          Top = 9
          Width = 90
          Height = 15
          Caption = 'Apellido Paterno :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object TLabel
          Left = 152
          Top = 9
          Width = 94
          Height = 15
          Caption = 'Apellido Materno :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object TLabel
          Left = 289
          Top = 9
          Width = 51
          Height = 15
          Caption = 'Nombres :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object TLabel
          Left = 424
          Top = 9
          Width = 91
          Height = 15
          Caption = 'Tipo de Relaci'#243'n :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object TLabel
          Left = 16
          Top = 48
          Width = 113
          Height = 15
          Caption = 'Fecha de Nacimiento :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object TLabel
          Left = 143
          Top = 48
          Width = 33
          Height = 15
          Caption = 'Sexo :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object TLabel
          Left = 295
          Top = 48
          Width = 54
          Height = 15
          Caption = 'D.N.I/L.E.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object TLabel
          Left = 392
          Top = 48
          Width = 61
          Height = 15
          Caption = 'Porcentaje :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object TLabel
          Left = 16
          Top = 88
          Width = 121
          Height = 15
          Caption = 'Apellido Paterno Tutor :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object TLabel
          Left = 152
          Top = 88
          Width = 125
          Height = 15
          Caption = 'Apellido Materno Tutor :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object TLabel
          Left = 289
          Top = 88
          Width = 82
          Height = 15
          Caption = 'Nombres Tutor :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object TLabel
          Left = 428
          Top = 88
          Width = 91
          Height = 15
          Caption = 'D.N.I/L.E. Tutor :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label24: TLabel
          Left = 15
          Top = 130
          Width = 79
          Height = 15
          Caption = 'Forma de Pago :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 153
          Top = 130
          Width = 37
          Height = 15
          Caption = 'Banco :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 464
          Top = 130
          Width = 76
          Height = 15
          Caption = 'Lugar de Giro :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 317
          Top = 130
          Width = 77
          Height = 15
          Caption = 'Departamento :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object dbeApePatBenef: TwwDBEdit
          Left = 16
          Top = 26
          Width = 129
          Height = 19
          AutoSize = False
          BorderStyle = bsNone
          CharCase = ecUpperCase
          Color = 13165023
          DataField = 'DSGAPEPAT'
          DataSource = DM1.dsDetCartas
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          Frame.Enabled = True
          Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
          ParentFont = False
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeApeMatBenef: TwwDBEdit
          Left = 152
          Top = 26
          Width = 129
          Height = 19
          AutoSize = False
          BorderStyle = bsNone
          CharCase = ecUpperCase
          Color = 13165023
          DataField = 'DSGAPEMAT'
          DataSource = DM1.dsDetCartas
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          Frame.Enabled = True
          Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
          ParentFont = False
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeDetNombBenef: TwwDBEdit
          Left = 289
          Top = 26
          Width = 129
          Height = 19
          AutoSize = False
          BorderStyle = bsNone
          CharCase = ecUpperCase
          Color = 13165023
          DataField = 'DSGNOMBR'
          DataSource = DM1.dsDetCartas
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          Frame.Enabled = True
          Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
          ParentFont = False
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dblcTipoRelacBenef: TwwDBLookupCombo
          Left = 424
          Top = 26
          Width = 43
          Height = 19
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          BorderStyle = bsNone
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'PARENID'#9'2'#9'Id'#9'F'
            'PARENDES'#9'15'#9'Descripci'#243'n'#9'F')
          DataField = 'DSGTREL'
          DataSource = DM1.dsDetCartas
          LookupTable = DM1.cdsTRelacion
          LookupField = 'PARENID'
          Options = [loColLines, loRowLines, loTitles]
          Color = 13165023
          Frame.Enabled = True
          ParentFont = False
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
          OnExit = dblcTipoRelacBenefExit
          OnKeyPress = dblcCiaKeyPress
          OnNotInList = dblcCiaNotInList
        end
        object dbeDescTipoRelacBenef: TwwDBEdit
          Left = 471
          Top = 26
          Width = 89
          Height = 19
          AutoSize = False
          BorderStyle = bsNone
          Color = 13165023
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          Frame.Enabled = True
          Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
          ParentFont = False
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbdtpFecNacBenef: TwwDBDateTimePicker
          Left = 14
          Top = 65
          Width = 115
          Height = 19
          AutoSize = False
          BorderStyle = bsNone
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Color = 13165023
          DataField = 'DSGFNAC'
          DataSource = DM1.dsDetCartas
          Epoch = 1950
          Frame.Enabled = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          ShowButton = True
          TabOrder = 5
          UnboundDataType = wwDTEdtDate
          DisplayFormat = 'dd/mm/yyyy'
          OnExit = dbdtpFecNacBenefExit
        end
        object sbtnAceptarDetalle: TfcShapeBtn
          Left = 551
          Top = 174
          Width = 34
          Height = 31
          Hint = 'Grabar Beneficiario'
          Color = 13165023
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
          TabOrder = 22
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
          OnClick = sbtnAceptarDetalleClick
        end
        object sbtnCancelarDetalle: TfcShapeBtn
          Left = 591
          Top = 174
          Width = 34
          Height = 31
          Hint = 'Cancelar'
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
          Shape = bsEllipse
          ShowHint = True
          TabOrder = 23
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
          OnClick = sbtnCancelarDetalleClick
        end
        object dblcSexoBenef: TwwDBLookupCombo
          Left = 143
          Top = 65
          Width = 41
          Height = 19
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          CharCase = ecUpperCase
          BorderStyle = bsNone
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'SEXO'#9'2'#9'Id'#9'F'
            'DESCRIP'#9'15'#9'Descripci'#243'n'#9'F')
          DataField = 'DSGSEX'
          DataSource = DM1.dsDetCartas
          LookupTable = DM1.cdsSexo
          LookupField = 'SEXO'
          Color = 13165023
          Frame.Enabled = True
          ParentFont = False
          TabOrder = 6
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
          OnExit = dblcSexoBenefExit
          OnKeyPress = dblcSexoBenefKeyPress
          OnNotInList = dblcCiaNotInList
        end
        object dbeDescSexoBenef: TwwDBEdit
          Left = 191
          Top = 65
          Width = 94
          Height = 19
          AutoSize = False
          BorderStyle = bsNone
          Color = 13165023
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          Frame.Enabled = True
          Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
          ParentFont = False
          TabOrder = 7
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeDNIBenef: TwwDBEdit
          Left = 294
          Top = 65
          Width = 89
          Height = 19
          AutoSize = False
          BorderStyle = bsNone
          Color = 13165023
          DataField = 'DSGDNI'
          DataSource = DM1.dsDetCartas
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          Frame.Enabled = True
          Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
          ParentFont = False
          TabOrder = 8
          UnboundDataType = wwDefault
          UnboundAlignment = taRightJustify
          WantReturns = False
          WordWrap = False
          OnKeyPress = dblcCiaKeyPress
        end
        object dbePorcBenef: TwwDBEdit
          Left = 391
          Top = 65
          Width = 69
          Height = 19
          AutoSize = False
          BorderStyle = bsNone
          Color = 13165023
          DataField = 'DSGPORC'
          DataSource = DM1.dsDetCartas
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          Frame.Enabled = True
          Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
          ParentFont = False
          TabOrder = 9
          UnboundDataType = wwDefault
          UnboundAlignment = taRightJustify
          WantReturns = False
          WordWrap = False
          OnExit = dbePorcBenefExit
          OnKeyPress = dblcCiaKeyPress
        end
        object dbeDNITutor: TwwDBEdit
          Left = 427
          Top = 108
          Width = 80
          Height = 19
          AutoSize = False
          BorderStyle = bsNone
          Color = 13165023
          DataField = 'DSGTDNI'
          DataSource = DM1.dsDetCartas
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          Frame.Enabled = True
          Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
          ParentFont = False
          TabOrder = 13
          UnboundDataType = wwDefault
          UnboundAlignment = taRightJustify
          WantReturns = False
          WordWrap = False
          OnKeyPress = dblcCiaKeyPress
        end
        object dbeNombT: TwwDBEdit
          Left = 289
          Top = 108
          Width = 129
          Height = 19
          AutoSize = False
          BorderStyle = bsNone
          CharCase = ecUpperCase
          Color = 13165023
          DataField = 'DSGTNOMB'
          DataSource = DM1.dsDetCartas
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          Frame.Enabled = True
          Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
          ParentFont = False
          TabOrder = 12
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeApeMatT: TwwDBEdit
          Left = 152
          Top = 108
          Width = 129
          Height = 19
          AutoSize = False
          BorderStyle = bsNone
          CharCase = ecUpperCase
          Color = 13165023
          DataField = 'DSGTAPEM'
          DataSource = DM1.dsDetCartas
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          Frame.Enabled = True
          Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
          ParentFont = False
          TabOrder = 11
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeApePatT: TwwDBEdit
          Left = 16
          Top = 108
          Width = 129
          Height = 19
          AutoSize = False
          BorderStyle = bsNone
          CharCase = ecUpperCase
          Color = 13165023
          DataField = 'DSGTAPEP'
          DataSource = DM1.dsDetCartas
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          Frame.Enabled = True
          Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
          ParentFont = False
          TabOrder = 10
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dblcFPago: TwwDBLookupCombo
          Left = 15
          Top = 145
          Width = 38
          Height = 19
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          CharCase = ecUpperCase
          BorderStyle = bsNone
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'TIPDESEID'#9'2'#9'Id'#9'F'
            'TIPDESEDES'#9'35'#9'Descripci'#243'n'#9'F')
          DataField = 'FORPAGOID'
          DataSource = DM1.dsDetCartas
          LookupTable = DM1.cdsTipDesemb
          LookupField = 'TIPDESEID'
          Options = [loColLines, loRowLines, loTitles]
          Color = 13165023
          Frame.Enabled = True
          ParentFont = False
          TabOrder = 14
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
          OnExit = dblcFPagoExit
          OnNotInList = dblcFPagoNotInList
        end
        object dbeFPago: TwwDBEdit
          Left = 56
          Top = 145
          Width = 93
          Height = 19
          AutoSize = False
          BorderStyle = bsNone
          Color = 13165023
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          Frame.Enabled = True
          Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
          ParentFont = False
          TabOrder = 15
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dblcBanco: TwwDBLookupCombo
          Left = 153
          Top = 145
          Width = 38
          Height = 19
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          CharCase = ecUpperCase
          BorderStyle = bsNone
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'BANCOID'#9'2'#9'Id'#9'F'
            'BANCONOM'#9'30'#9'Nombre'#9'F')
          DataField = 'BANCOID'
          DataSource = DM1.dsDetCartas
          LookupTable = DM1.cdsBanco
          LookupField = 'BANCOID'
          Options = [loColLines, loRowLines, loTitles]
          Color = 13165023
          Frame.Enabled = True
          Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
          ParentFont = False
          TabOrder = 16
          AutoDropDown = True
          ShowButton = True
          UseTFields = False
          PreciseEditRegion = False
          AllowClearKey = False
          ShowMatchText = True
          OnExit = dblcBancoExit
          OnNotInList = dblcBancoNotInList
        end
        object dbeBanco: TwwDBEdit
          Left = 193
          Top = 145
          Width = 118
          Height = 19
          AutoSize = False
          BorderStyle = bsNone
          Color = 13165023
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          Frame.Enabled = True
          Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
          ParentFont = False
          TabOrder = 17
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dblcdLugGiro: TwwDBLookupComboDlg
          Left = 464
          Top = 145
          Width = 69
          Height = 19
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          CharCase = ecUpperCase
          BorderStyle = bsNone
          GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
          GridColor = clWhite
          GridTitleAlignment = taLeftJustify
          Caption = 'Lookup'
          MaxWidth = 0
          MaxHeight = 209
          Selected.Strings = (
            'AGENBCOID'#9'8'#9'Id'#9'F'
            'AGENBCODES'#9'30'#9'Descripci'#243'n'#9'F')
          DataField = 'AGENBCOID'
          DataSource = DM1.dsDetCartas
          LookupTable = DM1.cdsAgBco
          LookupField = 'AGENBCOID'
          Color = 13165023
          Frame.Enabled = True
          ParentFont = False
          TabOrder = 20
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          OnExit = dblcdLugGiroExit
        end
        object dbeLugGiro: TwwDBEdit
          Left = 537
          Top = 145
          Width = 95
          Height = 19
          AutoSize = False
          BorderStyle = bsNone
          Color = 13165023
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          Frame.Enabled = True
          Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
          ParentFont = False
          TabOrder = 21
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dblcdDptoBco: TwwDBLookupComboDlg
          Left = 317
          Top = 145
          Width = 42
          Height = 19
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          CharCase = ecUpperCase
          BorderStyle = bsNone
          GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
          GridColor = clWhite
          GridTitleAlignment = taLeftJustify
          Caption = 'Lookup'
          MaxWidth = 0
          MaxHeight = 209
          Selected.Strings = (
            'DPTOID'#9'3'#9'Id'#9'F'
            'DPTODES'#9'25'#9'Descripci'#243'n'#9'F')
          DataField = 'BCODPTOID'
          DataSource = DM1.dsDetCartas
          LookupTable = DM1.cdsDpto1
          LookupField = 'DPTOID'
          Color = 13165023
          Frame.Enabled = True
          ParentFont = False
          TabOrder = 18
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnExit = dblcdDptoBcoExit
        end
        object dbeDptoBco: TwwDBEdit
          Left = 363
          Top = 145
          Width = 96
          Height = 19
          AutoSize = False
          BorderStyle = bsNone
          Color = 13165023
          Enabled = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          Frame.Enabled = True
          Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
          ParentFont = False
          TabOrder = 19
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
    end
  end
end
