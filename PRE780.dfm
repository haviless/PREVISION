object FDatosBenef: TFDatosBenef
  Left = 7
  Top = 77
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Datos Beneficiarios'
  ClientHeight = 424
  ClientWidth = 784
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
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object lblTitulo: TfcLabel
    Left = 256
    Top = 8
    Width = 69
    Height = 19
    Caption = 'Asociado :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    TextOptions.Alignment = taLeftJustify
    TextOptions.VAlignment = vaTop
  end
  object lblCodigo: TfcLabel
    Left = 12
    Top = 8
    Width = 110
    Height = 19
    Caption = 'C'#243'digo Modular :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentFont = False
    TextOptions.Alignment = taLeftJustify
    TextOptions.VAlignment = vaTop
  end
  object dbgDatosFam: TwwDBGrid
    Left = 4
    Top = 31
    Width = 776
    Height = 388
    DisableThemesInTitle = False
    MemoAttributes = [mSizeable, mWordWrap, mGridShow]
    IniAttributes.Delimiter = ';;'
    TitleColor = cl3DLight
    FixedCols = 0
    ShowHorzScrollBar = True
    Color = 13165023
    DataSource = DM1.dsDFam
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -9
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    KeyOptions = [dgEnterToTab, dgAllowDelete]
    MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
    ParentFont = False
    TabOrder = 0
    TitleAlignment = taCenter
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clNavy
    TitleFont.Height = -9
    TitleFont.Name = 'Comic Sans MS'
    TitleFont.Style = [fsBold]
    TitleLines = 2
    TitleButtons = False
    UseTFields = False
    OnDblClick = dbgDatosFamDblClick
    OnKeyDown = dbgDatosFamKeyDown
    object btnDFam: TwwIButton
      Left = 0
      Top = 0
      Width = 28
      Height = 36
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
      OnClick = btnDFamClick
    end
  end
  object pnlFamiliares: TPanel
    Left = 12
    Top = 44
    Width = 760
    Height = 341
    BorderStyle = bsSingle
    Color = 10207162
    TabOrder = 1
    Visible = False
    object stFam: TStaticText
      Left = 1
      Top = 1
      Width = 754
      Height = 18
      Align = alTop
      Alignment = taCenter
      BorderStyle = sbsSunken
      Caption = 'Beneficiarios'
      Color = clActiveCaption
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
    object pnlFam: TPanel
      Left = 4
      Top = 22
      Width = 748
      Height = 312
      Color = 13165023
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object TLabel
        Left = 10
        Top = 4
        Width = 77
        Height = 13
        Caption = 'Tipo de Relaci'#243'n :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object TLabel
        Left = 10
        Top = 42
        Width = 53
        Height = 13
        Caption = 'Fec Nacim. :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object TLabel
        Left = 110
        Top = 42
        Width = 55
        Height = 13
        Caption = 'Estado Civil :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object TLabel
        Left = 318
        Top = 119
        Width = 43
        Height = 13
        Caption = 'Tel'#233'fono :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object TLabel
        Left = 10
        Top = 119
        Width = 48
        Height = 13
        Caption = 'Direcci'#243'n :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object TLabel
        Left = 208
        Top = 4
        Width = 75
        Height = 13
        Caption = 'Apellido Paterno :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object TLabel
        Left = 384
        Top = 4
        Width = 78
        Height = 13
        Caption = 'Apellido Materno :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object TLabel
        Left = 562
        Top = 4
        Width = 42
        Height = 13
        Caption = 'Nombres :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object TLabel
        Left = 295
        Top = 42
        Width = 166
        Height = 13
        Caption = 'Tipo de Documento de Identificaci'#243'n :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object TLabel
        Left = 551
        Top = 42
        Width = 17
        Height = 13
        Caption = 'N'#176' :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object TLabel
        Left = 170
        Top = 79
        Width = 78
        Height = 13
        Caption = 'Nombre Completo :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object TLabel
        Left = 10
        Top = 79
        Width = 27
        Height = 13
        Caption = 'Sexo :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object TLabel
        Left = 537
        Top = 79
        Width = 53
        Height = 13
        Caption = 'Porcentaje :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object TLabel
        Left = 601
        Top = 79
        Width = 110
        Height = 13
        Caption = 'Participa en Liquidaci'#243'n :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        Visible = False
      end
      object lblDepartamento: TLabel
        Left = 9
        Top = 155
        Width = 66
        Height = 13
        Caption = 'Departamento :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object lblProvincia: TLabel
        Left = 248
        Top = 155
        Width = 45
        Height = 13
        Caption = 'Provincia :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object lblDistrito: TLabel
        Left = 502
        Top = 155
        Width = 40
        Height = 13
        Caption = 'Distrito :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
      end
      object dblcDFTRel: TwwDBLookupCombo
        Left = 10
        Top = 20
        Width = 46
        Height = 19
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
        DataField = 'FAMRELID'
        DataSource = DM1.dsDFam
        LookupTable = DM1.cdsTRelacion
        LookupField = 'PARENID'
        Options = [loColLines, loRowLines, loTitles]
        Color = 13165023
        Frame.Enabled = True
        Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcDFTRelExit
        OnKeyPress = dblcDFTRelKeyPress
      end
      object dbdtpDFFecNac: TwwDBDateTimePicker
        Left = 10
        Top = 58
        Width = 88
        Height = 19
        AutoSize = False
        BorderStyle = bsNone
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Color = 13165023
        DataField = 'FAMFECNAC'
        DataSource = DM1.dsDFam
        Epoch = 1950
        Frame.Enabled = True
        Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        ShowButton = True
        TabOrder = 5
        DisplayFormat = 'dd/mm/yyyy'
        OnExit = dbdtpDFFecNacExit
      end
      object dblcDFEstCiv: TwwDBLookupCombo
        Left = 110
        Top = 58
        Width = 46
        Height = 19
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        BorderStyle = bsNone
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'ESTCIVID'#9'2'#9'Id'#9'F'
          'ESTCIVDES'#9'15'#9'Descripci'#243'n'#9'F')
        DataField = 'ESTCIVID'
        DataSource = DM1.dsDFam
        LookupTable = DM1.cdsEstCivil
        LookupField = 'ESTCIVID'
        Options = [loColLines, loRowLines, loTitles]
        Color = 13165023
        Frame.Enabled = True
        Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
        ParentFont = False
        TabOrder = 6
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        PreciseEditRegion = False
        AllowClearKey = False
        OnExit = dblcDFEstCivExit
        OnKeyPress = dblcDFTRelKeyPress
      end
      object dbeDFTelf: TwwDBEdit
        Left = 318
        Top = 133
        Width = 118
        Height = 19
        BorderStyle = bsNone
        Color = 13165023
        DataField = 'FAMTELF'
        DataSource = DM1.dsDFam
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
      object dbeDFDir: TwwDBEdit
        Left = 10
        Top = 133
        Width = 304
        Height = 19
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 13165023
        DataField = 'FAMDIRECC'
        DataSource = DM1.dsDFam
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        Frame.Enabled = True
        Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
        ParentFont = False
        TabOrder = 16
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeDFApePat: TwwDBEdit
        Left = 208
        Top = 20
        Width = 170
        Height = 19
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 13165023
        DataField = 'FAMAPEPAT'
        DataSource = DM1.dsDFam
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
        OnExit = dbeDFNombresExit
      end
      object dbeDFApeMat: TwwDBEdit
        Left = 384
        Top = 20
        Width = 170
        Height = 19
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 13165023
        DataField = 'FAMAPEMAT'
        DataSource = DM1.dsDFam
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
        OnExit = dbeDFNombresExit
      end
      object dbeDFNombres: TwwDBEdit
        Left = 562
        Top = 20
        Width = 170
        Height = 19
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Color = 13165023
        DataField = 'FAMNOMBRE'
        DataSource = DM1.dsDFam
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
        OnExit = dbeDFNombresExit
      end
      object dblcDFTDoc: TwwDBLookupCombo
        Left = 295
        Top = 58
        Width = 43
        Height = 19
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        BorderStyle = bsNone
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TIPDOCCOD'#9'2'#9'ID'#9'F'
          'TIPDOCDES'#9'35'#9'DESCRIPCION'#9'F')
        DataField = 'TIPDOCCOD'
        DataSource = DM1.dsDFam
        LookupTable = DM1.cdsTDoc
        LookupField = 'TIPDOCCOD'
        Options = [loColLines, loRowLines, loTitles]
        Color = 13165023
        Frame.Enabled = True
        Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
        ParentFont = False
        TabOrder = 8
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        PreciseEditRegion = False
        AllowClearKey = True
        OnExit = dblcDFTDocExit
        OnKeyPress = dblcDFTRelKeyPress
      end
      object dbeDFNum: TwwDBEdit
        Left = 552
        Top = 58
        Width = 114
        Height = 19
        BorderStyle = bsNone
        Color = 13165023
        DataField = 'FAMNUMDOC'
        DataSource = DM1.dsDFam
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
      object dbeDFApeNom: TwwDBEdit
        Left = 170
        Top = 95
        Width = 359
        Height = 19
        AutoSize = False
        BorderStyle = bsNone
        Color = 13165023
        DataField = 'FAMAPENOM'
        DataSource = DM1.dsDFam
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
        WantReturns = False
        WordWrap = False
      end
      object dblcSexo: TwwDBLookupCombo
        Left = 10
        Top = 95
        Width = 36
        Height = 19
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
        DataField = 'FAMSEXO'
        DataSource = DM1.dsDFam
        LookupTable = DM1.cdsSexo
        LookupField = 'SEXO'
        Options = [loColLines, loRowLines, loTitles]
        Color = 13165023
        Frame.Enabled = True
        Frame.FocusBorders = [efRightBorder, efBottomBorder]
        Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
        ParentFont = False
        TabOrder = 11
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        PreciseEditRegion = False
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcSexoExit
        OnKeyPress = dblcSexoKeyPress
      end
      object dbeDFTRel: TwwDBEdit
        Left = 61
        Top = 20
        Width = 142
        Height = 19
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
      object dbeDFEstCiv: TwwDBEdit
        Left = 162
        Top = 58
        Width = 127
        Height = 19
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
        TabOrder = 7
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeDFDoc: TwwDBEdit
        Left = 342
        Top = 58
        Width = 201
        Height = 19
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
        TabOrder = 9
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeSexo: TwwDBEdit
        Left = 54
        Top = 95
        Width = 111
        Height = 19
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
        TabOrder = 12
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbePorc: TwwDBEdit
        Left = 537
        Top = 95
        Width = 56
        Height = 19
        AutoSize = False
        BorderStyle = bsNone
        Color = 13165023
        DataField = 'FAMPORC'
        DataSource = DM1.dsDFam
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        Frame.Enabled = True
        Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
        ParentFont = False
        TabOrder = 14
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbePorcExit
        OnKeyPress = dbePorcKeyPress
      end
      object chkLiquid: TCheckBox
        Left = 601
        Top = 98
        Width = 97
        Height = 17
        Caption = 'Participa'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        State = cbChecked
        TabOrder = 15
        Visible = False
      end
      object GroupBox1: TGroupBox
        Left = 4
        Top = 190
        Width = 740
        Height = 56
        Caption = 'Datos Adicionales '
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 24
        object Label15: TLabel
          Left = 165
          Top = 13
          Width = 32
          Height = 13
          Caption = 'Banco :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label24: TLabel
          Left = 6
          Top = 13
          Width = 67
          Height = 13
          Caption = 'Forma de Pago :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 520
          Top = 13
          Width = 65
          Height = 13
          Caption = 'Lugar de Giro :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 346
          Top = 13
          Width = 66
          Height = 13
          Caption = 'Departamento :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object dblcBanco: TwwDBLookupCombo
          Left = 165
          Top = 28
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
          DataSource = DM1.dsDFam
          LookupTable = DM1.cdsBanco
          LookupField = 'BANCOID'
          Options = [loColLines, loRowLines, loTitles]
          Color = 13165023
          Frame.Enabled = True
          Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
          ParentFont = False
          TabOrder = 2
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
          Left = 207
          Top = 28
          Width = 134
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
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dblcFPago: TwwDBLookupCombo
          Left = 6
          Top = 28
          Width = 38
          Height = 19
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          BorderStyle = bsNone
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'TIPDESEID'#9'2'#9'Id'#9'F'
            'TIPDESEABR'#9'15'#9'Descripci'#243'n'#9'F')
          DataField = 'FORPAGOID'
          DataSource = DM1.dsDFam
          LookupTable = DM1.cdsTipDesemb
          LookupField = 'TIPDESEID'
          Options = [loColLines, loRowLines, loTitles]
          Color = 13165023
          Frame.Enabled = True
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          PreciseEditRegion = False
          AllowClearKey = False
          OnExit = dblcFPagoExit
          OnNotInList = dblcFPagoNotInList
        end
        object dbeFPago: TwwDBEdit
          Left = 47
          Top = 28
          Width = 113
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
          TabOrder = 1
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dblcdLugGiro: TwwDBLookupComboDlg
          Left = 520
          Top = 28
          Width = 71
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
          DataField = 'CCBCOID'
          DataSource = DM1.dsDFam
          LookupTable = DM1.cdsAgBco
          LookupField = 'AGENBCOID'
          Color = 13165023
          Frame.Enabled = True
          ParentFont = False
          TabOrder = 6
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          OnExit = dblcdLugGiroExit
        end
        object dbeLugGiro: TwwDBEdit
          Left = 594
          Top = 28
          Width = 137
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
        object dblcdDptoBco: TwwDBLookupComboDlg
          Left = 346
          Top = 28
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
          DataSource = DM1.dsDFam
          LookupTable = DM1.cdsDpto1
          LookupField = 'DPTOID'
          Color = 13165023
          Frame.Enabled = True
          ParentFont = False
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnDropDown = dblcdDptoBcoDropDown
          OnExit = dblcdDptoBcoExit
        end
        object dbeDptoBco: TwwDBEdit
          Left = 394
          Top = 28
          Width = 121
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
      end
      object sbtnDFAceptar: TfcShapeBtn
        Left = 645
        Top = 270
        Width = 34
        Height = 31
        Hint = 'Grabar Datos Familiares'
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
        TabOrder = 26
        TabStop = True
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        OnClick = sbtnDFAceptarClick
      end
      object sbtnDFCancelar: TfcShapeBtn
        Left = 685
        Top = 270
        Width = 34
        Height = 31
        Hint = 'Cancelar'
        Color = 10207162
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
        TabOrder = 27
        TabStop = True
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        OnClick = sbtnDFCancelarClick
      end
      object gbDatosTutor: TGroupBox
        Left = 4
        Top = 245
        Width = 544
        Height = 64
        Caption = 'Datos del Tutor '
        Enabled = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        TabOrder = 25
        object TLabel
          Left = 8
          Top = 20
          Width = 90
          Height = 13
          Caption = 'Apellidos y Nombres :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object TLabel
          Left = 256
          Top = 20
          Width = 166
          Height = 13
          Caption = 'Tipo de Documento de Identificaci'#243'n :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object TLabel
          Left = 433
          Top = 20
          Width = 17
          Height = 13
          Caption = 'N'#176' :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          ParentFont = False
        end
        object dbeApeNomT: TwwDBEdit
          Left = 8
          Top = 36
          Width = 240
          Height = 19
          BorderStyle = bsNone
          CharCase = ecUpperCase
          Color = 13165023
          DataField = 'TUTAPENOM'
          DataSource = DM1.dsDFam
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
          OnExit = dbeDFNombresExit
        end
        object dblcTipDocT: TwwDBLookupCombo
          Left = 256
          Top = 36
          Width = 39
          Height = 19
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Comic Sans MS'
          Font.Style = []
          BorderStyle = bsNone
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'TIPDOCCOD'#9'2'#9'ID'#9'F'
            'TIPDOCDES'#9'35'#9'DESCRIPCION'#9'F')
          DataField = 'TUTTIPDOC'
          DataSource = DM1.dsDFam
          LookupTable = DM1.cdsTDoc
          LookupField = 'TIPDOCCOD'
          Options = [loColLines, loRowLines, loTitles]
          Color = 13165023
          Frame.Enabled = True
          Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
          ParentFont = False
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          UseTFields = False
          PreciseEditRegion = False
          AllowClearKey = True
          OnExit = dblcTipDocTExit
          OnKeyPress = dblcDFTRelKeyPress
        end
        object dbeDescTipDocT: TwwDBEdit
          Left = 299
          Top = 36
          Width = 127
          Height = 19
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
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbeNumDocT: TwwDBEdit
          Left = 434
          Top = 36
          Width = 98
          Height = 19
          BorderStyle = bsNone
          Color = 13165023
          DataField = 'TUTNUMDOC'
          DataSource = DM1.dsDFam
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
      end
      object dblcdDepto: TwwDBLookupComboDlg
        Left = 9
        Top = 169
        Width = 46
        Height = 19
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        CharCase = ecUpperCase
        BorderStyle = bsNone
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Departamentos'
        MaxWidth = 0
        MaxHeight = 209
        Selected.Strings = (
          'DPTOID'#9'3'#9'ID'#9'F'
          'DPTODES'#9'30'#9'Descripci'#243'n'#9'F')
        DataField = 'DPTOID'
        DataSource = DM1.dsDFam
        LookupTable = DM1.cdsDpto3
        LookupField = 'DPTOID'
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        Color = 13165023
        Frame.Enabled = True
        Frame.FocusBorders = [efRightBorder, efBottomBorder]
        Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
        ParentFont = False
        TabOrder = 18
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = dblcdDeptoChange
        OnDropDown = dblcdDeptoDropDown
        OnExit = dblcdDeptoExit
        OnKeyPress = dblcdDeptoKeyPress
      end
      object dbeDepto: TwwDBEdit
        Left = 60
        Top = 169
        Width = 181
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
      object dblcdCiudad: TwwDBLookupComboDlg
        Left = 248
        Top = 169
        Width = 62
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
        Caption = 'Provincias'
        MaxWidth = 0
        MaxHeight = 209
        Selected.Strings = (
          'CIUDID'#9'6'#9'ID'#9'F'
          'CIUDDES'#9'30'#9'Descripci'#243'n'#9'F'
          'DPTOID'#9'3'#9'Dpto'#9'F')
        DataField = 'CIUDID'
        DataSource = DM1.dsDFam
        LookupTable = DM1.cdsProvincia3
        LookupField = 'CIUDID'
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        Color = 13165023
        Frame.Enabled = True
        Frame.FocusBorders = [efRightBorder, efBottomBorder]
        Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
        ParentFont = False
        TabOrder = 20
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = dblcdCiudadChange
        OnDropDown = dblcdCiudadDropDown
        OnExit = dblcdCiudadExit
        OnKeyPress = dblcdCiudadKeyPress
      end
      object dbeProvincia: TwwDBEdit
        Left = 315
        Top = 169
        Width = 183
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
      object dblcdDistrito: TwwDBLookupComboDlg
        Left = 502
        Top = 169
        Width = 58
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
        Caption = 'Distritos'
        MaxWidth = 0
        MaxHeight = 209
        Selected.Strings = (
          'ZIPID'#9'7'#9'Id'#9'F'
          'ZIPDES'#9'38'#9'Descripci'#243'n'#9'F'
          'CIUDID'#9'5'#9'Prov'#9'F'
          'DPTOID'#9'3'#9'Dpto'#9'F')
        DataField = 'ZIPID'
        DataSource = DM1.dsDFam
        LookupTable = DM1.cdsDist3
        LookupField = 'ZIPID'
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        Color = 13165023
        Frame.Enabled = True
        Frame.FocusBorders = [efRightBorder, efBottomBorder]
        Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
        ParentFont = False
        TabOrder = 22
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnExit = dblcdDistritoExit
        OnKeyPress = dblcdDistritoKeyPress
      end
      object dbeDistrito: TwwDBEdit
        Left = 566
        Top = 169
        Width = 171
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
        TabOrder = 23
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
  end
end
