object FNueSegExp: TFNueSegExp
  Left = 389
  Top = 193
  BorderStyle = bsDialog
  Caption = 'Seguimiento de Expedientes'
  ClientHeight = 383
  ClientWidth = 819
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
  PixelsPerInch = 96
  TextHeight = 13
  object dbgSegExp: TwwDBGrid
    Left = 8
    Top = 102
    Width = 801
    Height = 236
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = DM1.dsFonSolDet
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    TabOrder = 0
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    TitleButtons = False
    OnDblClick = dbgSegExpDblClick
    object dbgExpBenIButton: TwwIButton
      Left = 0
      Top = 0
      Width = 30
      Height = 30
      AllowAllUp = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
        0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
        33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      OnClick = dbgExpBenIButtonClick
    end
  end
  object btncerrar: TBitBtn
    Left = 733
    Top = 345
    Width = 76
    Height = 30
    Caption = 'Cerrar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Century Gothic'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
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
  object GroupBox1: TGroupBox
    Left = 6
    Top = 4
    Width = 803
    Height = 93
    Caption = ' Datos del expediente '
    TabOrder = 2
    object Label1: TLabel
      Left = 11
      Top = 26
      Width = 113
      Height = 13
      Caption = 'N'#250'mero de expediente :'
    end
    object Label2: TLabel
      Left = 11
      Top = 47
      Width = 90
      Height = 13
      Caption = 'Fecha de Registro:'
    end
    object Label3: TLabel
      Left = 11
      Top = 67
      Width = 97
      Height = 13
      Caption = 'Usuario que registra:'
    end
    object Label4: TLabel
      Left = 283
      Top = 26
      Width = 171
      Height = 13
      Caption = 'Apellidos y nombre(s) del  asociado :'
    end
    object stNumExp: TStaticText
      Left = 132
      Top = 24
      Width = 137
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Color = clWhite
      ParentColor = False
      TabOrder = 0
    end
    object stFecreg: TStaticText
      Left = 132
      Top = 44
      Width = 137
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Color = clWhite
      ParentColor = False
      TabOrder = 1
    end
    object stUsuReg: TStaticText
      Left = 132
      Top = 64
      Width = 137
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Color = clWhite
      ParentColor = False
      TabOrder = 2
    end
    object stasoapenom: TStaticText
      Left = 459
      Top = 24
      Width = 336
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Color = clWhite
      ParentColor = False
      TabOrder = 3
    end
  end
  object pnlmostrar: TPanel
    Left = 184
    Top = 106
    Width = 481
    Height = 229
    BorderStyle = bsSingle
    Color = 10207162
    TabOrder = 3
    Visible = False
    object gbmostrar: TGroupBox
      Left = 4
      Top = 4
      Width = 469
      Height = 182
      Caption = ' Informaci'#243'n registrada '
      Color = clMoneyGreen
      ParentColor = False
      TabOrder = 0
      object Label5: TLabel
        Left = 7
        Top = 15
        Width = 85
        Height = 13
        Caption = 'Fecha de registro:'
      end
      object Label6: TLabel
        Left = 7
        Top = 38
        Width = 97
        Height = 13
        Caption = 'Usuario que registra:'
      end
      object Label7: TLabel
        Left = 7
        Top = 112
        Width = 63
        Height = 13
        Caption = 'Observaci'#243'n:'
      end
      object Label8: TLabel
        Left = 7
        Top = 63
        Width = 111
        Height = 13
        Caption = 'Estado del expediente :'
      end
      object Label9: TLabel
        Left = 7
        Top = 87
        Width = 99
        Height = 13
        Caption = 'Situaci'#243'n del estado:'
      end
      object mefecreg: TMaskEdit
        Left = 128
        Top = 11
        Width = 116
        Height = 21
        TabOrder = 0
      end
      object meusureg: TMaskEdit
        Left = 128
        Top = 35
        Width = 334
        Height = 21
        TabOrder = 1
      end
      object meespexp: TMaskEdit
        Left = 128
        Top = 59
        Width = 334
        Height = 21
        TabOrder = 2
      end
      object mesitexp: TMaskEdit
        Left = 128
        Top = 83
        Width = 334
        Height = 21
        TabOrder = 3
      end
      object memoobservacion: TMemo
        Left = 128
        Top = 109
        Width = 334
        Height = 65
        TabOrder = 4
      end
    end
    object btncerrarpanel: TBitBtn
      Left = 397
      Top = 190
      Width = 76
      Height = 30
      Caption = 'Cerrar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Century Gothic'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btncerrarpanelClick
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
