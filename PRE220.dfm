object Fextornodesembolso: TFextornodesembolso
  Left = 519
  Top = 198
  BorderStyle = bsDialog
  Caption = 'Extorno de desembolso'
  ClientHeight = 338
  ClientWidth = 494
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnlExtorno: TPanel
    Left = 1
    Top = 2
    Width = 491
    Height = 335
    BorderStyle = bsSingle
    Color = 10207162
    TabOrder = 0
    object gbextdesben: TGroupBox
      Left = 5
      Top = 6
      Width = 475
      Height = 169
      Caption = ' Datos del desembolso '
      Color = 13165023
      ParentColor = False
      TabOrder = 0
      object Label9: TLabel
        Left = 8
        Top = 17
        Width = 55
        Height = 13
        Caption = 'Beneficiario'
      end
      object Label10: TLabel
        Left = 8
        Top = 41
        Width = 101
        Height = 13
        Caption = 'Monto desembolsado'
      end
      object Label11: TLabel
        Left = 8
        Top = 117
        Width = 82
        Height = 13
        Caption = 'Numero del oficio'
      end
      object Label12: TLabel
        Left = 8
        Top = 141
        Width = 75
        Height = 13
        Caption = 'Fecha del oficio'
      end
      object Label13: TLabel
        Left = 8
        Top = 67
        Width = 105
        Height = 13
        Caption = 'Banco de desembolso'
      end
      object Label14: TLabel
        Left = 8
        Top = 91
        Width = 95
        Height = 13
        Caption = 'Tipo de desembolso'
      end
      object Label15: TLabel
        Left = 128
        Top = 17
        Width = 3
        Height = 13
        Caption = ':'
      end
      object Label16: TLabel
        Left = 128
        Top = 41
        Width = 3
        Height = 13
        Caption = ':'
      end
      object Label17: TLabel
        Left = 128
        Top = 67
        Width = 3
        Height = 13
        Caption = ':'
      end
      object Label18: TLabel
        Left = 128
        Top = 91
        Width = 3
        Height = 13
        Caption = ':'
      end
      object Label19: TLabel
        Left = 128
        Top = 117
        Width = 3
        Height = 13
        Caption = ':'
      end
      object Label20: TLabel
        Left = 128
        Top = 141
        Width = 3
        Height = 13
        Caption = ':'
      end
      object Panel6: TPanel
        Left = 135
        Top = 14
        Width = 334
        Height = 23
        Caption = 'Panel1'
        Enabled = False
        TabOrder = 0
        object edtApeNomBen: TEdit
          Left = 1
          Top = 1
          Width = 332
          Height = 21
          TabOrder = 0
        end
      end
      object Panel7: TPanel
        Left = 135
        Top = 38
        Width = 94
        Height = 23
        Caption = 'Panel1'
        Enabled = False
        TabOrder = 1
        object edtMonDes: TEdit
          Left = 1
          Top = 1
          Width = 92
          Height = 21
          TabOrder = 0
        end
      end
      object Panel8: TPanel
        Left = 135
        Top = 63
        Width = 258
        Height = 23
        Caption = 'Panel1'
        Enabled = False
        TabOrder = 2
        object edtbanDes: TEdit
          Left = 1
          Top = 1
          Width = 257
          Height = 21
          TabOrder = 0
        end
      end
      object Panel9: TPanel
        Left = 135
        Top = 88
        Width = 258
        Height = 23
        Caption = 'Panel1'
        Enabled = False
        TabOrder = 3
        object edtTipDes: TEdit
          Left = 1
          Top = 1
          Width = 256
          Height = 21
          TabOrder = 0
        end
      end
      object Panel10: TPanel
        Left = 135
        Top = 113
        Width = 90
        Height = 23
        Caption = 'Panel1'
        Enabled = False
        TabOrder = 4
        object edtNumOfi: TEdit
          Left = 1
          Top = 1
          Width = 88
          Height = 21
          TabOrder = 0
        end
      end
      object Panel11: TPanel
        Left = 135
        Top = 138
        Width = 90
        Height = 23
        Caption = 'Panel1'
        Enabled = False
        TabOrder = 5
        object edtFecOfi: TEdit
          Left = 1
          Top = 1
          Width = 88
          Height = 21
          TabOrder = 0
        end
      end
    end
    object btnextornar: TBitBtn
      Left = 317
      Top = 297
      Width = 80
      Height = 28
      Caption = '&Extornar'
      TabOrder = 1
      OnClick = btnextornarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        300033FFFFFF3333377739999993333333333777777F3333333F399999933333
        3300377777733333337733333333333333003333333333333377333333333333
        3333333333333333333F333333333333330033333F33333333773333C3333333
        330033337F3333333377333CC3333333333333F77FFFFFFF3FF33CCCCCCCCCC3
        993337777777777F77F33CCCCCCCCCC399333777777777737733333CC3333333
        333333377F33333333FF3333C333333330003333733333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
    end
    object btncancelar: TBitBtn
      Left = 401
      Top = 298
      Width = 80
      Height = 28
      Caption = '&Cancelar'
      TabOrder = 2
      OnClick = btncancelarClick
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
    end
    object gbingdatext: TGroupBox
      Left = 5
      Top = 176
      Width = 475
      Height = 116
      Caption = 'Datos del extorno '
      TabOrder = 3
      object Label21: TLabel
        Left = 7
        Top = 18
        Width = 32
        Height = 13
        Caption = 'M'#243'tivo'
      end
      object Label22: TLabel
        Left = 97
        Top = 18
        Width = 3
        Height = 13
        Caption = ':'
      end
      object Label23: TLabel
        Left = 5
        Top = 69
        Width = 95
        Height = 13
        Caption = 'Fecha de operaci'#243'n'
      end
      object Label24: TLabel
        Left = 20
        Top = 92
        Width = 102
        Height = 13
        Caption = 'N'#250'mero de operaci'#243'n'
      end
      object dblcdmotextdes: TwwDBLookupComboDlg
        Left = 126
        Top = 16
        Width = 44
        Height = 21
        GridOptions = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgPerfectRowFit]
        GridColor = clWhite
        GridTitleAlignment = taLeftJustify
        Caption = 'Lookup'
        MaxWidth = 0
        MaxHeight = 209
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnExit = dblcdmotextdesExit
      end
      object pnldesmotextdes: TPanel
        Left = 178
        Top = 16
        Width = 282
        Height = 23
        Caption = 'Panel1'
        Enabled = False
        TabOrder = 4
        object edtdesmotextdes: TEdit
          Left = 1
          Top = 1
          Width = 279
          Height = 21
          TabOrder = 0
        end
      end
      object edtdesotrmotdes: TEdit
        Left = 126
        Top = 40
        Width = 332
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 45
        TabOrder = 1
      end
      object edtnumopeextdes: TEdit
        Left = 126
        Top = 90
        Width = 110
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 15
        TabOrder = 3
      end
      object dtpfecoprextdes: TwwDBDateTimePicker
        Left = 126
        Top = 64
        Width = 88
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        ShowButton = True
        TabOrder = 2
      end
    end
  end
end
