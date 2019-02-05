object Fnueseg: TFnueseg
  Left = 378
  Top = 204
  BorderStyle = bsDialog
  Caption = 'Nuevo seguimiento'
  ClientHeight = 199
  ClientWidth = 499
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
  object btngraba: TBitBtn
    Left = 308
    Top = 163
    Width = 89
    Height = 30
    Hint = 'Grabar expediente modificado'
    Caption = 'Grabar'
    TabOrder = 0
    OnClick = btngrabaClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
      FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
      FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
      007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
      7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
      99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
      99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
      99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
      93337FFFF7737777733300000033333333337777773333333333}
    NumGlyphs = 2
  end
  object GroupBox1: TGroupBox
    Left = 5
    Top = 10
    Width = 490
    Height = 148
    Caption = ' Nuevo seguimiento '
    TabOrder = 1
    object Label1: TLabel
      Left = 13
      Top = 23
      Width = 111
      Height = 13
      Caption = 'Estado del expediente :'
    end
    object Label2: TLabel
      Left = 13
      Top = 55
      Width = 99
      Height = 13
      Caption = 'Situaci'#243'n del estado:'
    end
    object lbltitobs: TLabel
      Left = 13
      Top = 81
      Width = 132
      Height = 13
      Caption = 'Comentario de observaci'#243'n:'
    end
    object dblgEstExp: TwwDBLookupComboDlg
      Left = 127
      Top = 19
      Width = 51
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      LookupTable = DM1.cdsSegEstExp
      LookupField = 'CODESTEXP'
      MaxLength = 2
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnExit = dblgEstExpExit
    end
    object dbgSitEst: TwwDBLookupComboDlg
      Left = 127
      Top = 51
      Width = 51
      Height = 21
      GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
      GridColor = clWhite
      GridTitleAlignment = taLeftJustify
      Caption = 'Lookup'
      MaxWidth = 0
      MaxHeight = 209
      LookupTable = DM1.cdsSegSitExp
      LookupField = 'CODSITEXP'
      MaxLength = 2
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnChange = dbgSitEstChange
      OnExit = dbgSitEstExit
    end
    object stDesSegExp: TStaticText
      Left = 185
      Top = 19
      Width = 232
      Height = 22
      AutoSize = False
      BorderStyle = sbsSingle
      Color = clWhite
      ParentColor = False
      TabOrder = 2
    end
    object stDesSitExp: TStaticText
      Left = 185
      Top = 51
      Width = 300
      Height = 22
      AutoSize = False
      BorderStyle = sbsSingle
      Color = clWhite
      ParentColor = False
      TabOrder = 3
    end
    object mecomobs: TMemo
      Left = 185
      Top = 80
      Width = 299
      Height = 61
      MaxLength = 200
      TabOrder = 4
    end
  end
  object btncerrar: TBitBtn
    Left = 406
    Top = 163
    Width = 89
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
