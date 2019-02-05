object FRetencionesJudiciales: TFRetencionesJudiciales
  Left = 31
  Top = 8
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Previsi'#243'n Social'
  ClientHeight = 522
  ClientWidth = 716
  Color = 12904163
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
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCabecera: TPanel
    Left = 2
    Top = 1
    Width = 711
    Height = 518
    BevelOuter = bvNone
    BorderWidth = 1
    Color = 10207162
    TabOrder = 0
    object TLabel
      Left = 11
      Top = 11
      Width = 215
      Height = 29
      Caption = 'Retenciones Judiciales'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -20
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 244
      Top = 3
      Width = 463
      Height = 43
      Color = 13165023
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object TLabel
        Left = 4
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
        Left = 272
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
        Left = 359
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
        Top = 20
        Width = 205
        Height = 19
        AutoSize = False
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 13165023
        Enabled = False
        Frame.Enabled = True
        Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dblcCia: TwwDBLookupCombo
        Left = 6
        Top = 20
        Width = 49
        Height = 19
        AutoSize = False
        BorderStyle = bsNone
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CIAID'#9'3'#9'Id'#9'F'
          'CIADES'#9'40'#9'Descripci'#243'n'#9'F')
        DataField = 'CIAID'
        DataSource = DM1.dsMaestRetJud
        LookupTable = DM1.cdsCompania
        LookupField = 'CIAID'
        Options = [loTitles]
        Color = 13165023
        Frame.Enabled = True
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
        Left = 272
        Top = 20
        Width = 83
        Height = 19
        AutoSize = False
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 13165023
        DataField = 'RTJNRO'
        DataSource = DM1.dsMaestRetJud
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
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
        Left = 359
        Top = 20
        Width = 99
        Height = 19
        AutoSize = False
        BorderStyle = bsNone
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Color = 13165023
        DataField = 'RTJFREC'
        DataSource = DM1.dsMaestRetJud
        Epoch = 1950
        Frame.Enabled = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 3
        DisplayFormat = 'dd/mm/yyyy'
      end
    end
    object Panel3: TPanel
      Left = 5
      Top = 47
      Width = 702
      Height = 154
      Color = 13165023
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Bevel3: TBevel
        Left = 3
        Top = 3
        Width = 694
        Height = 115
      end
      object TLabel
        Left = 234
        Top = 80
        Width = 121
        Height = 15
        Caption = 'Estado de la Retenci'#243'n :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object TLabel
        Left = 386
        Top = 6
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
        Left = 493
        Top = 6
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
        Left = 110
        Top = 80
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
        Left = 14
        Top = 80
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
        Top = 42
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
        Top = 42
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
        Left = 441
        Top = 42
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
        Left = 424
        Top = 80
        Width = 108
        Height = 15
        Caption = 'Fecha de Operaci'#243'n :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 11
        Top = 6
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
      object TLabel
        Left = 596
        Top = 6
        Width = 87
        Height = 15
        Caption = 'Nro Expediente :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object dblcEstRetJud: TwwDBLookupCombo
        Left = 234
        Top = 95
        Width = 51
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
        DataField = 'RTJESTAD'
        DataSource = DM1.dsMaestRetJud
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
        OnExit = dblcEstRetJudExit
        OnKeyPress = dblcCiaKeyPress
        OnNotInList = dblcCiaNotInList
      end
      object dbeEstRetJud: TwwDBEdit
        Left = 289
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
        Left = 493
        Top = 22
        Width = 97
        Height = 19
        AutoSize = False
        BorderStyle = bsNone
        Color = 13165023
        DataField = 'RTJCODMOD'
        DataSource = DM1.dsMaestRetJud
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
      object dbeEstAsoc: TwwDBEdit
        Left = 110
        Top = 95
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
        TabOrder = 8
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeDNI: TwwDBEdit
        Left = 13
        Top = 95
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
        TabOrder = 7
        UnboundDataType = wwDefault
        UnboundAlignment = taRightJustify
        WantReturns = False
        WordWrap = False
      end
      object dbeUProceso: TwwDBEdit
        Left = 13
        Top = 58
        Width = 210
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
      object dbeUPago: TwwDBEdit
        Left = 227
        Top = 58
        Width = 210
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
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeUSE: TwwDBEdit
        Left = 443
        Top = 58
        Width = 210
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
        WantReturns = False
        WordWrap = False
      end
      object chkVigente: TCheckBox
        Left = 562
        Top = 91
        Width = 67
        Height = 17
        Caption = 'Vigente'
        TabOrder = 12
        Visible = False
        OnClick = chkVigenteClick
      end
      object dbeCodAsociado: TwwDBEdit
        Left = 386
        Top = 22
        Width = 97
        Height = 19
        AutoSize = False
        BorderStyle = bsNone
        Color = 13165023
        DataField = 'ASOID'
        DataSource = DM1.dsMaestRetJud
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
        OnExit = dbeCodAsociadoExit
        OnKeyPress = dblcCiaKeyPress
      end
      object sbtnCancelar: TfcShapeBtn
        Left = 643
        Top = 120
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
        TabOrder = 14
        TabStop = True
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        OnClick = sbtnCancelarClick
      end
      object dbdtpFecOper: TwwDBDateTimePicker
        Left = 424
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
        DataField = 'RTJFEST'
        DataSource = DM1.dsMaestRetJud
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
        Left = 604
        Top = 120
        Width = 34
        Height = 31
        Hint = 'Graba Retenci'#243'n Judicial'
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
        TabOrder = 13
        TabStop = True
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        OnClick = sbtnAceptarClick
      end
      object dbeApeNom: TwwDBEdit
        Left = 11
        Top = 22
        Width = 369
        Height = 19
        AutoSize = False
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 13165023
        DataField = 'RTJNOMBRT'
        DataSource = DM1.dsMaestRetJud
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
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
      object dbeNroExped: TwwDBEdit
        Left = 596
        Top = 22
        Width = 97
        Height = 19
        AutoSize = False
        BorderStyle = bsNone
        Color = 13165023
        DataField = 'PVSEXPNRO'
        DataSource = DM1.dsMaestRetJud
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
        UnboundAlignment = taRightJustify
        WantReturns = False
        WordWrap = False
      end
    end
    object pnlDetRetJudicial: TPanel
      Left = 6
      Top = 202
      Width = 701
      Height = 312
      Color = 13165023
      TabOrder = 2
      object Bevel1: TBevel
        Left = 4
        Top = 5
        Width = 692
        Height = 303
      end
      object fcLabel1: TfcLabel
        Left = 14
        Top = 7
        Width = 239
        Height = 23
        Caption = 'Detalle de la Retenci'#243'n Judicial '
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -16
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsItalic]
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaTop
      end
      object dbgDetRetJudicial: TwwDBGrid
        Left = 10
        Top = 31
        Width = 680
        Height = 272
        DisableThemesInTitle = False
        IniAttributes.Delimiter = ';;'
        TitleColor = cl3DLight
        FixedCols = 0
        ShowHorzScrollBar = True
        Color = clInfoBk
        DataSource = DM1.dsDetRetJud
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyOptions = [dgAllowInsert]
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
        OnDblClick = dbgDetRetJudicialDblClick
        FooterColor = cl3DLight
        FooterCellColor = clBtnHighlight
        object IbDetalleCarta: TwwIButton
          Left = 0
          Top = 0
          Width = 30
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
          OnClick = IbDetalleCartaClick
        end
      end
      object pnlDetRetJud: TPanel
        Left = 148
        Top = 42
        Width = 426
        Height = 257
        Color = 13165023
        TabOrder = 1
        Visible = False
        object Bevel2: TBevel
          Left = 5
          Top = 4
          Width = 417
          Height = 216
        end
        object TLabel
          Left = 12
          Top = 46
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
          Top = 46
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
          Top = 46
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
          Left = 12
          Top = 84
          Width = 87
          Height = 15
          Caption = 'Dpto. de Origen :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object TLabel
          Left = 179
          Top = 85
          Width = 107
          Height = 15
          Caption = 'Fecha de Recepci'#243'n :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object TLabel
          Left = 307
          Top = 85
          Width = 99
          Height = 15
          Caption = 'N'#250'mero de Oficio :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object TLabel
          Left = 189
          Top = 132
          Width = 33
          Height = 15
          Caption = 'Valor :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object TLabel
          Left = 286
          Top = 132
          Width = 40
          Height = 15
          Caption = 'Estado :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object TLabel
          Left = 12
          Top = 175
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
          Left = 12
          Top = 6
          Width = 136
          Height = 15
          Caption = 'Juzgado al que Pertenece :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          OnClick = bbtnBuscarClick
        end
        object dbeApePatD: TwwDBEdit
          Left = 12
          Top = 64
          Width = 129
          Height = 19
          AutoSize = False
          BorderStyle = bsNone
          CharCase = ecUpperCase
          Color = 13165023
          DataField = 'RTJAPEPAT'
          DataSource = DM1.dsDetRetJud
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
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
        object dbeApeMatD: TwwDBEdit
          Left = 152
          Top = 64
          Width = 129
          Height = 19
          AutoSize = False
          BorderStyle = bsNone
          CharCase = ecUpperCase
          Color = 13165023
          DataField = 'RTJAPEMAT'
          DataSource = DM1.dsDetRetJud
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
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
        object dbeDetNombD: TwwDBEdit
          Left = 289
          Top = 64
          Width = 129
          Height = 19
          AutoSize = False
          BorderStyle = bsNone
          CharCase = ecUpperCase
          Color = 13165023
          DataField = 'RTJNOMBR'
          DataSource = DM1.dsDetRetJud
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
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
        object dblcDpto: TwwDBLookupCombo
          Left = 12
          Top = 106
          Width = 43
          Height = 19
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          BorderStyle = bsNone
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DPTOID'#9'2'#9'Dpto Id'#9'F'
            'DPTODES'#9'15'#9'Descripci'#243'n'#9'F')
          DataField = 'RTJDPTOID'
          DataSource = DM1.dsDetRetJud
          LookupTable = DM1.cdsDpto
          LookupField = 'DPTOID'
          Options = [loColLines, loRowLines, loTitles]
          Color = 13165023
          Frame.Enabled = True
          ParentFont = False
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
          OnExit = dblcDptoExit
          OnKeyPress = dblcCiaKeyPress
          OnNotInList = dblcCiaNotInList
        end
        object dbeDescDpto: TwwDBEdit
          Left = 63
          Top = 106
          Width = 109
          Height = 19
          AutoSize = False
          BorderStyle = bsNone
          Color = 13165023
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
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
        object dbdtpFecRec: TwwDBDateTimePicker
          Left = 179
          Top = 106
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
          DataField = 'RTJFREC'
          DataSource = DM1.dsDetRetJud
          Epoch = 1950
          Frame.Enabled = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
          ShowButton = True
          TabOrder = 6
          DisplayFormat = 'dd/mm/yyyy'
        end
        object sbtnAceptarDetalle: TfcShapeBtn
          Left = 332
          Top = 223
          Width = 34
          Height = 31
          Hint = 'Grabar Detalle'
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
          TabOrder = 12
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
          OnClick = sbtnAceptarDetalleClick
        end
        object sbtnCancelarDetalle: TfcShapeBtn
          Left = 372
          Top = 223
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
          TabOrder = 13
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
          OnClick = sbtnCancelarDetalleClick
        end
        object dbeNroOficio: TwwDBEdit
          Left = 307
          Top = 106
          Width = 89
          Height = 19
          AutoSize = False
          BorderStyle = bsNone
          Color = 13165023
          DataField = 'RTJNOFIC'
          DataSource = DM1.dsDetRetJud
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
        object dbeValor: TwwDBEdit
          Left = 188
          Top = 154
          Width = 89
          Height = 19
          AutoSize = False
          BorderStyle = bsNone
          Color = 13165023
          DataSource = DM1.dsDetRetJud
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
          OnExit = dbeValorExit
          OnKeyPress = dbeValorKeyPress
        end
        object dbeEstado: TwwDBEdit
          Left = 286
          Top = 154
          Width = 129
          Height = 19
          AutoSize = False
          BorderStyle = bsNone
          CharCase = ecUpperCase
          Color = 13165023
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          Frame.Enabled = True
          Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
          ParentFont = False
          TabOrder = 10
          UnboundDataType = wwDefault
          Visible = False
          WantReturns = False
          WordWrap = False
          OnKeyPress = dblcCiaKeyPress
        end
        object rgTipo: TRadioGroup
          Left = 12
          Top = 125
          Width = 167
          Height = 49
          Caption = 'Tipo '
          Columns = 2
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ItemIndex = 0
          Items.Strings = (
            'Porcentaje      '
            'Monto       ')
          ParentFont = False
          TabOrder = 8
          OnClick = rgTipoClick
          OnExit = rgTipoExit
        end
        object dbreObs: TwwDBRichEdit
          Left = 12
          Top = 190
          Width = 401
          Height = 26
          AutoURLDetect = False
          BorderStyle = bsNone
          Color = 13165023
          DataField = 'RTJOBS'
          DataSource = DM1.dsDetRetJud
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          Frame.Enabled = True
          Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
          ParentFont = False
          PrintJobName = 'Delphi 5'
          TabOrder = 11
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
            A60000007B5C727466315C616E73695C616E7369637067313235325C64656666
            305C6465666C616E6731303235307B5C666F6E7474626C7B5C66305C666E696C
            5C66636861727365743020436F6D69632053616E73204D533B7D7D0D0A7B5C63
            6F6C6F7274626C203B5C726564305C677265656E305C626C75653132383B7D0D
            0A5C766965776B696E64345C7563315C706172645C6366315C66305C66733232
            5C7061720D0A7D0D0A00}
        end
        object dbeJuzgado: TwwDBEdit
          Left = 12
          Top = 24
          Width = 402
          Height = 19
          AutoSize = False
          BorderStyle = bsNone
          CharCase = ecUpperCase
          Color = 13165023
          DataField = 'RTJJUZG'
          DataSource = DM1.dsDetRetJud
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
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
      end
    end
  end
end
