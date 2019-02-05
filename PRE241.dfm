object FLiquidacionBeneficio: TFLiquidacionBeneficio
  Left = 306
  Top = 1
  BorderStyle = bsDialog
  Caption = 'Liquidaci'#243'n de beneficios'
  ClientHeight = 673
  ClientWidth = 652
  Color = 10207162
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 343
    Height = 87
    Color = 13165023
    TabOrder = 0
    object TLabel
      Left = 7
      Top = 1
      Width = 137
      Height = 13
      Caption = 'IDENTIFICACION PERSONAL'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object TLabel
      Left = 7
      Top = 15
      Width = 65
      Height = 13
      Caption = 'PROFESOR (A)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object TLabel
      Left = 7
      Top = 43
      Width = 35
      Height = 13
      Caption = 'D.N.I. '
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblAsoApeNomDNI: TLabel
      Left = 7
      Top = 29
      Width = 88
      Height = 13
      Caption = 'lblAsoApeNomDNI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblAsoDNI: TLabel
      Left = 49
      Top = 43
      Width = 47
      Height = 13
      Caption = 'lblAsoDNI'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblAsoDir: TLabel
      Left = 7
      Top = 57
      Width = 41
      Height = 13
      Caption = 'lblAsoDir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblUbigeoDir: TLabel
      Left = 7
      Top = 71
      Width = 57
      Height = 13
      Caption = 'lblUbigeoDir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object pnlmenanu: TPanel
      Left = 212
      Top = 60
      Width = 129
      Height = 25
      Caption = 'ANULADO'
      Color = clCaptionText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 343
    Top = 0
    Width = 307
    Height = 87
    Color = 13165023
    TabOrder = 1
    object TLabel
      Left = 8
      Top = 1
      Width = 131
      Height = 13
      Caption = 'IDENTIFICACION LABORAL'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object TLabel
      Left = 8
      Top = 14
      Width = 97
      Height = 13
      Caption = 'CODIGO MODULAR :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object TLabel
      Left = 8
      Top = 27
      Width = 28
      Height = 13
      Caption = 'C.E. :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object TLabel
      Left = 8
      Top = 41
      Width = 27
      Height = 13
      Caption = 'USE.:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblAsoCodMod: TLabel
      Left = 113
      Top = 13
      Width = 68
      Height = 13
      Caption = 'lblAsoCodMod'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblCe: TLabel
      Left = 56
      Top = 27
      Width = 23
      Height = 13
      Caption = 'lblCe'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblUse: TLabel
      Left = 56
      Top = 40
      Width = 29
      Height = 13
      Caption = 'lblUse'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lblUbigeoCe: TLabel
      Left = 8
      Top = 53
      Width = 57
      Height = 13
      Caption = 'lblUbigeoCe'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 87
    Width = 650
    Height = 74
    Color = 13165023
    TabOrder = 2
    object TLabel
      Left = 7
      Top = 1
      Width = 262
      Height = 13
      Caption = 'DATOS GENERALES PARA EL CALCULO DEL BENEFICIO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object TLabel
      Left = 7
      Top = 14
      Width = 132
      Height = 13
      Caption = 'FECHA DE NOMBRAMIENTO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object TLabel
      Left = 7
      Top = 29
      Width = 76
      Height = 13
      Caption = 'FECHA DE CESE'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object TLabel
      Left = 7
      Top = 43
      Width = 105
      Height = 13
      Caption = 'ULTIMA APORTACION'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object TLabel
      Left = 7
      Top = 57
      Width = 124
      Height = 13
      Caption = 'TOTAL A'#209'OS APORTADOS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object TLabel
      Left = 350
      Top = 14
      Width = 62
      Height = 13
      Caption = 'RESOLUCION'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object TLabel
      Left = 350
      Top = 29
      Width = 62
      Height = 13
      Caption = 'RESOLUCION'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblFecNom: TLabel
      Left = 169
      Top = 13
      Width = 50
      Height = 13
      Caption = 'lblFecNom'
    end
    object lblFecCes: TLabel
      Left = 169
      Top = 27
      Width = 46
      Height = 13
      Caption = 'lblFecCes'
    end
    object lblUltApo: TLabel
      Left = 169
      Top = 41
      Width = 42
      Height = 13
      Caption = 'lblUltApo'
    end
    object lblTotAnoApo: TLabel
      Left = 169
      Top = 55
      Width = 64
      Height = 13
      Caption = 'lblTotAnoApo'
    end
    object lblNumResNom: TLabel
      Left = 429
      Top = 13
      Width = 73
      Height = 13
      Caption = 'lblNumResNom'
    end
    object lblNumResCes: TLabel
      Left = 428
      Top = 27
      Width = 69
      Height = 13
      Caption = 'lblNumResCes'
    end
    object Bevel1: TBevel
      Left = 509
      Top = 1
      Width = 2
      Height = 72
    end
    object TLabel
      Left = 518
      Top = 1
      Width = 69
      Height = 13
      Caption = 'LIQUIDACION'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object TLabel
      Left = 519
      Top = 14
      Width = 41
      Height = 13
      Caption = 'NUMERO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object TLabel
      Left = 518
      Top = 29
      Width = 31
      Height = 13
      Caption = 'FECHA'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDif: TLabel
      Left = 518
      Top = 57
      Width = 48
      Height = 13
      Caption = 'DIFERIDO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNumLiq: TLabel
      Left = 582
      Top = 13
      Width = 46
      Height = 13
      Caption = 'lblNumLiq'
    end
    object lblFecLiq: TLabel
      Left = 582
      Top = 27
      Width = 42
      Height = 13
      Caption = 'lblFecLiq'
    end
    object lblFecDif: TLabel
      Left = 582
      Top = 55
      Width = 41
      Height = 13
      Caption = 'lblFecDif'
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 161
    Width = 650
    Height = 116
    Color = 13165023
    TabOrder = 3
    object TLabel
      Left = 7
      Top = 1
      Width = 190
      Height = 13
      Caption = 'DETALLE DEL CALCULO DEL BENEFICIO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbgDetCalBen: TwwDBGrid
      Left = 7
      Top = 14
      Width = 639
      Height = 97
      DisableThemesInTitle = False
      Selected.Strings = (
        'DESC'#9'60'#9'Descripci'#243'n'
        'MONTO'#9'10'#9'Monto')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = DM1.dsDetCalLiq
      Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect, dgShowFooter]
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 277
    Width = 650
    Height = 98
    Color = 13165023
    TabOrder = 4
    object TLabel
      Left = 7
      Top = 1
      Width = 75
      Height = 13
      Caption = 'DEVOLUCIONES'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbgDetDev: TwwDBGrid
      Left = 7
      Top = 14
      Width = 639
      Height = 80
      DisableThemesInTitle = False
      Selected.Strings = (
        'DESC'#9'89'#9'Descripci'#243'n'
        'MONTO'#9'10'#9'Monto')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = DM1.dsDetDev
      Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect, dgShowFooter]
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
      OnDblClick = dbgDetDevDblClick
    end
  end
  object Panel6: TPanel
    Left = 0
    Top = 375
    Width = 650
    Height = 105
    Color = 13165023
    TabOrder = 5
    object TLabel
      Left = 7
      Top = 1
      Width = 64
      Height = 13
      Caption = 'DESCUENTOS'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbgDetDes: TwwDBGrid
      Left = 7
      Top = 14
      Width = 639
      Height = 87
      DisableThemesInTitle = False
      Selected.Strings = (
        'DESC'#9'89'#9'Descripci'#243'n'
        'MONTO'#9'10'#9'Monto')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = DM1.dsDetDes
      Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect, dgShowFooter]
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
      OnDblClick = dbgDetDesDblClick
    end
  end
  object Panel7: TPanel
    Left = 0
    Top = 480
    Width = 650
    Height = 23
    Color = 13165023
    TabOrder = 6
    object TLabel
      Left = 370
      Top = 8
      Width = 174
      Height = 13
      Caption = 'SALDO DISPONIBLE DEL BENEFICIO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object fcSalBen: TfcLabel
      Left = 557
      Top = 5
      Width = 66
      Height = 16
      AutoSize = False
      TextOptions.Alignment = taRightJustify
      TextOptions.Shadow.Color = clGradientActiveCaption
      TextOptions.VAlignment = vaTop
    end
  end
  object Panel8: TPanel
    Left = 0
    Top = 503
    Width = 650
    Height = 104
    Color = 13165023
    TabOrder = 7
    object TLabel
      Left = 7
      Top = 1
      Width = 85
      Height = 13
      Caption = 'FORMAS DE PAGO'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbgForPag: TwwDBGrid
      Left = 7
      Top = 14
      Width = 639
      Height = 86
      DisableThemesInTitle = False
      Selected.Strings = (
        'DESC'#9'89'#9'Descripci'#243'n'
        'MONTO'#9'10'#9'Monto')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = DM1.dsForPag
      Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect, dgShowFooter]
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
    end
  end
  object pnlanula: TPanel
    Left = 25
    Top = 146
    Width = 600
    Height = 220
    Caption = 'pnlanula'
    Color = 10207162
    TabOrder = 8
    object gbanula: TGroupBox
      Left = 9
      Top = 6
      Width = 582
      Height = 202
      Color = 10207162
      ParentColor = False
      TabOrder = 0
      object Label1: TLabel
        Left = 10
        Top = 26
        Width = 52
        Height = 13
        Caption = 'USUARIO:'
      end
      object Label2: TLabel
        Left = 10
        Top = 53
        Width = 41
        Height = 13
        Caption = 'FECHA :'
      end
      object Label3: TLabel
        Left = 10
        Top = 79
        Width = 48
        Height = 13
        Caption = 'MOTIVO :'
      end
      object lblFec: TLabel
        Left = 10
        Top = 135
        Width = 104
        Height = 13
        Caption = 'FECHA OPERACION:'
      end
      object lblOpe: TLabel
        Left = 10
        Top = 107
        Width = 96
        Height = 13
        Caption = 'NRO. OPERACION:'
      end
      object Label7: TLabel
        Left = 468
        Top = 59
        Width = 95
        Height = 13
        Caption = 'Max.100 Caracteres'
      end
      object btnconfirmaanula: TBitBtn
        Left = 365
        Top = 164
        Width = 100
        Height = 29
        Caption = 'Actualizar'
        TabOrder = 0
        OnClick = btnconfirmaanulaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
          7700333333337777777733333333008088003333333377F73377333333330088
          88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
          000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
          FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
          99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
      end
      object btncerraranulacion: TBitBtn
        Left = 478
        Top = 164
        Width = 80
        Height = 29
        Caption = 'Cerrar'
        TabOrder = 1
        OnClick = btncerraranulacionClick
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
      object Panel9: TPanel
        Left = 119
        Top = 20
        Width = 124
        Height = 23
        Caption = '|'
        TabOrder = 2
        object meusuanu: TEdit
          Left = 1
          Top = 1
          Width = 121
          Height = 21
          Enabled = False
          TabOrder = 0
        end
      end
      object Panel10: TPanel
        Left = 119
        Top = 47
        Width = 89
        Height = 23
        Caption = '|'
        TabOrder = 3
        object mefecanu: TEdit
          Left = 1
          Top = 1
          Width = 86
          Height = 21
          Enabled = False
          TabOrder = 0
        end
      end
      object Panel11: TPanel
        Left = 119
        Top = 74
        Width = 449
        Height = 23
        Caption = '|'
        TabOrder = 4
        object meobs: TEdit
          Left = 1
          Top = 1
          Width = 446
          Height = 21
          MaxLength = 100
          TabOrder = 0
        end
      end
      object Panel12: TPanel
        Left = 119
        Top = 130
        Width = 96
        Height = 23
        Caption = '|'
        TabOrder = 6
        object meFecOpe: TwwDBDateTimePicker
          Left = 1
          Top = 1
          Width = 93
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
      end
      object Panel13: TPanel
        Left = 119
        Top = 102
        Width = 124
        Height = 23
        Caption = '|'
        TabOrder = 5
        object meNumOpe: TEdit
          Left = 1
          Top = 1
          Width = 121
          Height = 21
          MaxLength = 15
          TabOrder = 0
        end
      end
      object bbtnNueva: TBitBtn
        Left = 200
        Top = 164
        Width = 193
        Height = 29
        Caption = 'Actualizar y Generar Nueva Liq.'
        TabOrder = 7
        OnClick = bbtnNuevaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
          7700333333337777777733333333008088003333333377F73377333333330088
          88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
          000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
          FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
          99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
      end
    end
  end
  object btnImprimePrevio: TBitBtn
    Left = 90
    Top = 610
    Width = 83
    Height = 29
    Hint = 'Impresi'#243'n de la liquidaci'#243'n'
    Caption = 'Liquidaci'#243'n'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnClick = btnImprimePrevioClick
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
  object btndesdev: TBitBtn
    Left = 90
    Top = 642
    Width = 83
    Height = 29
    Hint = 'Impresi'#243'n de las abonos y cargos'
    Caption = 'Carg./Abon.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnClick = btndesdevClick
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
    Spacing = 1
  end
  object btnanula: TBitBtn
    Left = 3
    Top = 610
    Width = 83
    Height = 29
    Hint = 'Anulaci'#243'n de la liquidaci'#243'n de beneficios'
    Caption = 'Anular'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    OnClick = btnanulaClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
      555557777F777555F55500000000555055557777777755F75555005500055055
      555577F5777F57555555005550055555555577FF577F5FF55555500550050055
      5555577FF77577FF555555005050110555555577F757777FF555555505099910
      555555FF75777777FF555005550999910555577F5F77777775F5500505509990
      3055577F75F77777575F55005055090B030555775755777575755555555550B0
      B03055555F555757575755550555550B0B335555755555757555555555555550
      BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
      50BB555555555555575F555555555555550B5555555555555575}
    NumGlyphs = 2
  end
  object btncerrar: TBitBtn
    Left = 560
    Top = 610
    Width = 83
    Height = 29
    Hint = 'Cerrar'
    Caption = 'Cerrar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
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
  object btnmodresnom: TBitBtn
    Left = 354
    Top = 610
    Width = 83
    Height = 29
    Hint = 'Modificaci'#243'n de la resoluci'#243'n de Cese'
    Caption = 'Resoluci'#243'n'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    Visible = False
    OnClick = btnmodresnomClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
      F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
      F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
      F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
      F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
      F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
      F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
      333337FFFFFFFF77333330000000000333333777777777733333}
    NumGlyphs = 2
  end
  object btnmodforpag: TBitBtn
    Left = 178
    Top = 610
    Width = 83
    Height = 29
    Hint = 'Procesa Forma de Pago'
    Caption = 'Forma Pago'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 14
    OnClick = btnmodforpagClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
      000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
      00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
      F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
      0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
      FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
      FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
      0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
      00333377737FFFFF773333303300000003333337337777777333}
    NumGlyphs = 2
    Spacing = 2
  end
  object pnldetalles: TPanel
    Left = 136
    Top = 360
    Width = 433
    Height = 177
    Color = 13165023
    TabOrder = 15
    object btncerrargrid: TBitBtn
      Left = 352
      Top = 143
      Width = 73
      Height = 29
      Caption = 'Cerrar'
      TabOrder = 0
      OnClick = btncerrargridClick
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
    object stmensaje: TStaticText
      Left = 1
      Top = 1
      Width = 431
      Height = 19
      Align = alTop
      Alignment = taCenter
      BorderStyle = sbsSunken
      Caption = 'MENSAJE NUMERO UNO'
      Color = clActiveCaption
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 1
    end
    object dbgDetalles: TwwDBGrid
      Left = 6
      Top = 24
      Width = 420
      Height = 114
      DisableThemesInTitle = False
      Selected.Strings = (
        'TRANSANO'#9'10'#9'A'#241'o del Aporte'#9#9
        'TRANSMES'#9'16'#9'Mes del Aporte'#9#9
        'MONTO'#9'19'#9'Monto '#9#9)
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
      TabOrder = 2
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
    end
  end
  object bbtnCopiar: TBitBtn
    Left = 178
    Top = 642
    Width = 83
    Height = 29
    Hint = 'Extorna Pago y Genera nueva Liquidaci'#243'n'
    Caption = 'Copia Liq.'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 16
    OnClick = bbtnCopiarClick
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
  object bbtnActFP: TBitBtn
    Left = 265
    Top = 610
    Width = 83
    Height = 29
    Hint = 'Actualiza Forma de Pago'
    Caption = 'Refr.FP'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 17
    OnClick = bbtnActFPClick
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
    Margin = 2
    NumGlyphs = 2
  end
  object bbtnFecDif: TBitBtn
    Left = 265
    Top = 642
    Width = 83
    Height = 29
    Hint = 'Editar Fecha Diferida'
    Caption = 'Fec.Dif'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 18
    OnClick = bbtnFecDifClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      003337777777777777F330FFFFFFFFFFF03337F3333FFF3337F330FFFF000FFF
      F03337F33377733337F330FFFFF0FFFFF03337F33337F33337F330FFFF00FFFF
      F03337F33377F33337F330FFFFF0FFFFF03337F33337333337F330FFFFFFFFFF
      F03337FFF3F3F3F3F7F33000F0F0F0F0F0333777F7F7F7F7F7F330F0F000F070
      F03337F7F777F777F7F330F0F0F0F070F03337F7F7373777F7F330F0FF0FF0F0
      F03337F733733737F7F330FFFFFFFF00003337F33333337777F330FFFFFFFF0F
      F03337FFFFFFFF7F373330999999990F033337777777777F733330FFFFFFFF00
      333337FFFFFFFF77333330000000000333333777777777733333}
    Margin = 2
    NumGlyphs = 2
    Spacing = 2
  end
  object pnlDiferido: TPanel
    Left = 149
    Top = 467
    Width = 425
    Height = 140
    Color = 10207162
    TabOrder = 19
    Visible = False
    object GroupBox1: TGroupBox
      Left = 12
      Top = 6
      Width = 402
      Height = 122
      TabOrder = 0
      object Label6: TLabel
        Left = 50
        Top = 39
        Width = 179
        Height = 16
        Caption = 'Fecha de Liquidaci'#243'n Diferida'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object bbtnCerrarDif: TBitBtn
        Left = 306
        Top = 83
        Width = 80
        Height = 29
        Caption = 'Cerrar'
        TabOrder = 0
        OnClick = bbtnCerrarDifClick
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
      object bbtnConfirmaDif: TBitBtn
        Left = 198
        Top = 83
        Width = 100
        Height = 29
        Caption = 'Actualizar'
        TabOrder = 1
        OnClick = bbtnConfirmaDifClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
          7700333333337777777733333333008088003333333377F73377333333330088
          88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
          000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
          FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
          99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
      end
      object Panel15: TPanel
        Left = 248
        Top = 36
        Width = 96
        Height = 23
        Caption = '|'
        TabOrder = 2
        object dbdtpFecDif: TwwDBDateTimePicker
          Left = 1
          Top = 1
          Width = 93
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
      end
    end
  end
  object btncheger: TBitBtn
    Left = 465
    Top = 610
    Width = 83
    Height = 29
    Hint = 'Carta de recojo de cheque de gerencia'
    Caption = 'Che.Ger.'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 20
    OnClick = btnchegerClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
      55555575555555775F55509999999901055557F55555557F75F5001111111101
      105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
      01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
      8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
      0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
      0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
      05555555575FF777755555555500055555555555557775555555}
    NumGlyphs = 2
  end
  object pprImprimePrevio: TppReport
    AutoStop = False
    DataPipeline = BDEPDetCalLiq
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'ARCH B'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279401
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 134
    Template.FileName = 
      'C:\Documents and Settings\irevilla\Escritorio\liquidacionbenefic' +
      'io.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = False
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 314
    Top = 2
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'BDEPDetCalLiq'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 88636
      mmPrintPosition = 0
      object pplblLiqBen: TppLabel
        UserName = 'lblLiqBen'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4995
        mmLeft = 105304
        mmTop = 8996
        mmWidth = 85387
        BandType = 0
      end
      object ppldesben: TppLabel
        UserName = 'ldesben'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3683
        mmLeft = 105304
        mmTop = 14288
        mmWidth = 19304
        BandType = 0
      end
      object pplfecliq: TppLabel
        UserName = 'lfecliq'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2911
        mmLeft = 105304
        mmTop = 22225
        mmWidth = 26204
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 12965
        mmTop = 29369
        mmWidth = 180975
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'IDENTIFICACION PERSONAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        mmHeight = 4191
        mmLeft = 12965
        mmTop = 29898
        mmWidth = 48810
        BandType = 0
      end
      object pplAsoApeNomDni: TppLabel
        UserName = 'lAsoApeNomDni'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 12965
        mmTop = 34660
        mmWidth = 111920
        BandType = 0
      end
      object pplAsoDni: TppLabel
        UserName = 'lAsoApeNomDni1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 26988
        mmTop = 38100
        mmWidth = 21696
        BandType = 0
      end
      object pplZipDes: TppLabel
        UserName = 'lAsoApeNomDni2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 12965
        mmTop = 45244
        mmWidth = 111920
        BandType = 0
      end
      object pplAsoDir: TppLabel
        UserName = 'lAsoDir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 12965
        mmTop = 41804
        mmWidth = 111920
        BandType = 0
      end
      object pplAsoCodMod: TppLabel
        UserName = 'lAsoCodMod'
        Caption = '8888888888'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 42598
        mmTop = 53711
        mmWidth = 17198
        BandType = 0
      end
      object pplCentroEducativo: TppLabel
        UserName = 'lAsoApeNomDni3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 21431
        mmTop = 57679
        mmWidth = 102923
        BandType = 0
      end
      object pplUse: TppLabel
        UserName = 'lUse'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 12965
        mmTop = 61383
        mmWidth = 111920
        BandType = 0
      end
      object pplUseZip: TppLabel
        UserName = 'lAsoDir1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 12965
        mmTop = 64823
        mmWidth = 111920
        BandType = 0
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        mmHeight = 13758
        mmLeft = 12700
        mmTop = 70115
        mmWidth = 181240
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = ' DATOS GENERALES PARA EL CALCULO DE BENEFICIO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3387
        mmLeft = 16669
        mmTop = 68792
        mmWidth = 75936
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'FECHA DE NOMBRAMIENTO :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 16669
        mmTop = 72496
        mmWidth = 38365
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'FECHA DE CESE :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 16669
        mmTop = 75936
        mmWidth = 24606
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'TOTAL A'#209'OS APORTADOS :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 16669
        mmTop = 79375
        mmWidth = 38100
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'ULTIMA APORTACION :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 115888
        mmTop = 79375
        mmWidth = 31485
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'RESOLUCION DE NOMBRAMIENTO :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 115888
        mmTop = 72496
        mmWidth = 46302
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'RESOLUCION DE CESE :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 115888
        mmTop = 75936
        mmWidth = 31750
        BandType = 0
      end
      object pplFecNom: TppLabel
        UserName = 'lFecNom'
        Caption = 'pplFecNom'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 58208
        mmTop = 72496
        mmWidth = 15610
        BandType = 0
      end
      object pplFecCes: TppLabel
        UserName = 'lFecCes'
        Caption = 'pplFecCes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 58208
        mmTop = 75936
        mmWidth = 15346
        BandType = 0
      end
      object pplAnoApo: TppLabel
        UserName = 'lAnoApo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 58208
        mmTop = 79375
        mmWidth = 53711
        BandType = 0
      end
      object pplNumResNoM: TppLabel
        UserName = 'lFecNom1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 166423
        mmTop = 72496
        mmWidth = 14552
        BandType = 0
      end
      object pplNumResCes: TppLabel
        UserName = 'lNumResCes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 166423
        mmTop = 75936
        mmWidth = 14552
        BandType = 0
      end
      object pplUltApo: TppLabel
        UserName = 'lUltApo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 166423
        mmTop = 79375
        mmWidth = 14552
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 12700
        mmTop = 86254
        mmWidth = 181240
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label101'
        Caption = ' DETALLE DEL CALCULO DE BENEFICIO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3387
        mmLeft = 16933
        mmTop = 84931
        mmWidth = 55033
        BandType = 0
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        Pen.Style = psInsideFrame
        mmHeight = 2381
        mmLeft = 12700
        mmTop = 86254
        mmWidth = 265
        BandType = 0
      end
      object ppShape7: TppShape
        UserName = 'Shape7'
        Pen.Style = psInsideFrame
        mmHeight = 2381
        mmLeft = 193675
        mmTop = 86254
        mmWidth = 265
        BandType = 0
      end
      object pplasotelef: TppLabel
        UserName = 'lasotelef'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 75406
        mmTop = 38100
        mmWidth = 21696
        BandType = 0
      end
      object ImagAso: TppImage
        UserName = 'ImagAso'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 33073
        mmLeft = 152929
        mmTop = 33338
        mmWidth = 32015
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'IDENTIFICACION LABORAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        mmHeight = 4233
        mmLeft = 12965
        mmTop = 49213
        mmWidth = 46302
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'D.N.I. :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 12965
        mmTop = 38100
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        Caption = 'TELEFONO :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 50271
        mmTop = 38100
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = 'C.E. :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 12965
        mmTop = 57679
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Caption = 'CODIGO MODULAR :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 12965
        mmTop = 53711
        mmWidth = 28310
        BandType = 0
      end
      object ppLabel90: TppLabel
        UserName = 'Label90'
        Caption = 'REGIMEN DE PENSION :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 60590
        mmTop = 53711
        mmWidth = 31750
        BandType = 0
      end
      object pplregpen: TppLabel
        UserName = 'lAsoCodMod1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 93134
        mmTop = 53711
        mmWidth = 56642
        BandType = 0
      end
      object pploriexp: TppLabel
        UserName = 'lfecbe1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2911
        mmLeft = 105304
        mmTop = 18521
        mmWidth = 46313
        BandType = 0
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Picture.Data = {
          0A544A504547496D61676543290000FFD8FFE1001845786966000049492A0008
          0000000000000000000000FFEC00114475636B7900010004000000640000FFE1
          036F687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F003C
          3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043
          656869487A7265537A4E54637A6B633964223F3E203C783A786D706D65746120
          786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B
          3D2241646F626520584D5020436F726520352E332D633031312036362E313435
          3636312C20323031322F30322F30362D31343A35363A32372020202020202020
          223E203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F7777
          772E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E
          7323223E203C7264663A4465736372697074696F6E207264663A61626F75743D
          222220786D6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E
          636F6D2F7861702F312E302F6D6D2F2220786D6C6E733A73745265663D226874
          74703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F
          5265736F75726365526566232220786D6C6E733A786D703D22687474703A2F2F
          6E732E61646F62652E636F6D2F7861702F312E302F2220786D704D4D3A4F7269
          67696E616C446F63756D656E7449443D22786D702E6469643A38384242323139
          413845363945333131393530364335414333303344354330382220786D704D4D
          3A446F63756D656E7449443D22786D702E6469643A3442453033434441363939
          3831314533383235463846314639373642313741362220786D704D4D3A496E73
          74616E636549443D22786D702E6969643A344245303343443936393938313145
          33383235463846314639373642313741362220786D703A43726561746F72546F
          6F6C3D2241646F62652050686F746F73686F7020435336202857696E646F7773
          29223E203C786D704D4D3A4465726976656446726F6D2073745265663A696E73
          74616E636549443D22786D702E6969643A384642423231394138453639453331
          3139353036433541433330334435433038222073745265663A646F63756D656E
          7449443D22786D702E6469643A38384242323139413845363945333131393530
          36433541433330334435433038222F3E203C2F7264663A446573637269707469
          6F6E3E203C2F7264663A5244463E203C2F783A786D706D6574613E203C3F7870
          61636B657420656E643D2272223F3EFFEE000E41646F62650064C000000001FF
          DB00840001010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010202020202020202020202030303030303
          0303030301010101010101020101020202010202030303030303030303030303
          0303030303030303030303030303030303030303030303030303030303030303
          0303030303FFC00011080040010403011100021101031101FFC4009C00000102
          070101000000000000000000000007080103040506090A0B0201010101010000
          0000000000000000000000010203100000060200040207030808030901000002
          03040506070108001112091314215394D415161731180A516191222393193941
          D192242556B778A133957181D336274768C81A8A110100030002000602030000
          0000000000000111213141516171810212B1D1F0A132FFDA000C030100021103
          11003F00D6A7E21FEE59B05B49BCB7D6B9993691C5B5B75BAC97FA8E255233BB
          2D6E8DBFC9600B4D8FCAAC49B22467109659227893A35996E1AC01806B6AC924
          A7000625672AC7CA76BA573BD938DFE830CE5F9CC167FE3E8E203C537973F14C
          FC9FF305CFF473E7C047C51FAE3BF4E7FF001389A1CE6A76E3EC5E91DB91DBAF
          5BACC9157F30625E894AD4685C570A2D336A4AA4B52A6293F8C96AD3B74BE26E
          982BA54A25411079F234B116704A3408B891EC67AC774A5D8FD70A1360D1340E
          3C96F0A6EB4B64A8F9AA32B06C3F5061ACF2A1B30966494DE732D237411193BC
          3060DE8EAC631CF971D50BA70070070070070070070070070070070070070070
          070070070070073E5F6F006338CFD9C01C01C01C019CE31F6F010E78FCB8FD38
          E0239CE31F6F00701E379DD8FF0099E7703C7FF30F617FD5092FF5F1CE79564C
          D5D9E7B9BBD51A1D8D6AD30B9555526C7C32C4AE38696B2E5CBE28680B3CA933
          65567BA956B3B47D421330A8A5A9990E4C721CF9A00B24733787D64380DA2EDC
          D3FB7F6E6ADA1740F5C2452D7179D22D3BB9A4D18871CB0E6C6D76B0F5F6BF95
          CEA7B2E94CCDE4A6486373E4BA42664C39C57A240158A42495D22180AE131738
          1B3C7BB4D771C945FD26D5F66D44B6CCBB218CC9E49288C383735B332B2C5D71
          AB486A942BB15EDD9B6B60C59FD537A925B5CC0EF940E67A730A4A69C60041E1
          5F2B4B34DBCE83B97596CC91D377E56D2BA9ECE8A8C803E43E62D8636B9A6256
          1385081C1319FB448EACEE89861391AE4661C89610209849A60058CE64DF6AF5
          F3ED63FCB47403FD9BEB7FFA4713E3AA15CD91DC8D57D4065677FD9DBF6AEA49
          048CF3D3470B9F4A9BD9DD64A6A31A62D7E238C19198FD202DB32B89CAB1A34C
          781284D088DC8022C6780E6E7B8B7766D848C774DED5F59E98ECE449EB4E76BC
          DA2332C360CC356D8D12B18A95ECD3FD6B3B0229DAD8FC81E111E18EA029B8F2
          9BD7A339B14807D41028EAE52E6E23A1D19EC86F0EA169FE1903B37B1B52D28B
          24850D4C7D9E75306D6C913E2228FF002C738B5468261EFEBDAD3A9FD99CA8A4
          C24E519E818F19E28CC59368F5BE4B492FD948EDED53BFEBFB4B4B9BF3ADCACF
          3C8E39D6ED6D2CBCC2F2B1CA5C8DC0E666F0B38B190AB01A680C4E6632033011
          6338E013A6FDFDD27776DA7DE1A369E8E776BBFE4B248852CE0D161C7DCD2597
          228764E2E5C82247205AA0B732E307938257A80E7CB235261449A600D3C900C2
          CE4771DD0B575D116DA0DBCD7F74AD1559CD34BA39B345971A76605F6C3EA546
          E2D75E372D6D5CA42E12A52D2B8B5B9484E0C38A41D4A8CC05380668428AD8EE
          65DBDE8D992CAEEDBDD0D6C824EDB1C4E697A883DDB90E2E431E744E6E0950DD
          26694EE8A164656A737D0616BC29C60F4F3FB33C2E02CB2BDABD6783D3683626
          5B7F53EC5423AFC33E15732EB0E2C1AC9D7E34B3E1CD196B9A96E638F38FC457
          872493E0A81F5998C871CF38CF2045275DCDFB7BD66E155B5CF37275EA28AEEC
          8DB24D2B0CBC5971E4E92530B9264F047A665AFC2B13735441F4C4C6811BA2E3
          52A152324C096688458B1860BCDD3DC5744F5CACA69A76F5DB2A22ACB39E7084
          C221732B0D81A9E9B53B9929D5362C93146AAC950E40E8955166A550EC344428
          273D650840C67385C0576E3D9BD74D798AB5CE6F6BDAA3A7E22F981E58243645
          83168735C8BA1312AC408E297C74440901D84AA0B33A11F8C3F0CCC67972CE39
          8615AF5BC1A7FB60ADDDB75AF65A97BADE581265C9EE3F5F5811F90491A1AF0A
          4A47F17728DA559F1D46CE258A0B282AC69829C468F01C0F22CE31C0393757A6
          763253287A756C674EB5CDB19519EE8B933792ADE1ED7A76B666A4C6AB34A01E
          E6ECE4A8A4C9480E7269E79812CBC6442C632090C4F67B5B27B66C9293836C25
          2133B961C27404BAA58A5AD0490D99171B12B290BD824304687E572765133AD3
          824ABC294A5E539A2C00CE916718E0257DE9759BEB07DDEBEF1345FD7DF13C2F
          A21F56A05F56FC6F85FC77C0FA6FF1FF009BFCC7C17FBEF4793EBF2BFB6FF97F
          ADC065D695CB50D1D191CD6EBB52B7A7E185282519B2CB46731880468B58A39F
          974837D9639B4B60551DD39E8064DEA172CF2C7A380ABAD2D6ABEE788A29F53B
          6440AD782399AA486D9A56B308F4EA26BCF446E49584229145DC5D1A151C90EC
          640680B3B392C58E42C633C02713FDB9D53AA27ED754DA5B35AF95B5A0F7F0DC
          B356F3EB9ABA87CF1DB0F4779766136C4243236E7F5B876521C969725A717981
          E3917D59F47011BF5DA54F9584FD8E97BEEB5A4AD1607B81B71F614D98D92C36
          180295F2588BC2B639642D64A230501C6750B5F942DE050B529A131D932A2B06
          67C3098178B8B6575D35DCB6036FFBF295A34A961EAD34587705A507AD012552
          8029B2B93B00A66FACD8783908561393829FAF2560C07572C0B1CDC721A36F07
          710AEF519669C165CD693588F66B66AB3AB9ED5CCECC636029828F98C7A6CE72
          2BB580D03984A5EC51C72626D4D95E6FF84604E2009A703232F3C27390F322D7
          DD173A823F5A508BA2A798D611513C065163C5AC587C86071B1479116E2FC17E
          97B4BC2C8F34098DBCE09EB3CC282FCB102C0CCE90E719E028A9CD8CD7DD8940
          F0EDAFF7AD3B79354755A640FEE5505990BB29031AE5648D42346F0AE1CF4F49
          DB152A20191940384011810E738C6718CF017B925D14F43A3C8E5D2EB5EB58B4
          4DC6505C1DBA51239D461963ABE686BDA88C950F44F4E4E899B55CA4C91A435B
          F0DE59B95795A5893E0BF14390E0304AB9F64505AEA7724BEAFAACE789186C5B
          71D0EB19B5B186B788C12048666F6264834A148A44E6D25BC556CC461A5DDC94
          A84E61CA51983505966E079C85EA9ED95D73D882DF0EA06FDA56F12A306A6224
          86D3F69C1ECC0478F59E2F9325EC70B7D7AC3518AF040F2584FF000F23C005CB
          9F2CF2723493F7E5DA7F9E3E0FF53D3FC3FF00FD0E7DC73CBFC990CE5F75AFA0
          9F39FD31F17E0FD5E3FCC3FDE3E33CFE33D5FB3F31D3FA9C66FF002AE49ABB8A
          54F38FC5053E8C5D28232F10D71EE19B2C63630CC4CC971591DA0DEF567B951F
          197E2C61196B50492EA471F4262234224EBBCC796342228D163333EDA34E33EB
          CF73D56E2C86E19ACFAEB6DDD9496DAF29D5FF000B648CF71305B089F8C65322
          6D881064878605ECAE85E5A53322524A4E8C90010129C050024E33737E63A4BE
          F756258276AB6D54B5CDDDBA3767DBDBF1A574DED486BD7A270D52495D37DAFE
          B9944CE997C5CC0E2A50BC452A5BC642E8689A4C11C991BFF50841F1D28041DC
          F1EE9DB55B71EC0DDEF9D8AB506B277B5664E55FFDF7B66A1A289AA785236F3E
          235CD67414A60316579CE7CCAC8E4364964BEAD6F4261B94898E71C6405F3208
          C932E7EB4AB4EF33B39CDFB54F66AB0A62B5649E78595BE353E66AFC70DD2527
          D61565BD5CE2B3811EFCACC35CD744EBD2654E44332238D114D49D5984A60964
          F2070F97108F4B3ED65FCB4BB7F7FB38D6FF00F48A29C6C71F554D055D7774FC
          48FBBB03DEC74779657FAF38B85A6B9A754C99E638DD268D5253D8ED57078337
          9ADAE8DAF6D51B21BA42AE5AB9334284A6B839E4F54663251EB303C73F2D5255
          BD3A0BAD7A19F883FB66567ACA4AB8B571675CDA9168AEAA8E91BBC952D71207
          2D8DC4517A38FB83F383B3EA6649395152D7929D6293CC214987E0B1052F9624
          A4C57CA2836FD7A9AB5EDDF707EE13B15B63DB6769BB9FCD49B25C18982B2AB1
          C24C38B514D2AE5B35606B699CB74690AA7DCFCBD1589A4648C1423F089214DE
          B44612729C90A533B9B80BB6B9D2DB49AEB56F7BF89675276E3547B7E5C5A2D7
          85935B41B63A36FE04B12B3236E90D4B01650CBDE9A1B1B5548871C91BDA1F0C
          A18DC96B6A44BE74C586A009F8B1DF852161EC25DAB20D61E9EBDF744B7E7D3D
          7F9BD1C9EF42F562B442FE14D5EC353D7516952B707D942434A39C1C82ED61BE
          B8292DA129EDC80224E250ABCE79E30B25F18EE4379FC397DA72AEDF262B1F63
          F65ACEB09AE9CD5CB59914D775AC2A5638B369D6990DB1F9BCAE712774392AA1
          3333A08F32B3261E1B7095C1767908C5840111403DF18B0BE3995A15DC9EF5DC
          3B4751BB116C46E5C49FECC993F595B4ECFB672DA31CC12B95962717C9455D59
          2F20E830E48E6E869B2142C4A0D5AEAA3CE80C5A8892D47920327881ABCD7E97
          CB55762AEEB74EBC2F7CC426A7DA9D3392C2A2B200E32BA29229ECE65D1F9AE0
          E2F00F0D02C7043016E0AA28BF08B0A94E316318C9A2EA91FE654F97623B476A
          0407F0E9555DC01A1A2666ED5AD8DD2D623D58ABA66FEB913EA1B3AC563829F5
          F2A87A970510F6F8A45E3D242F0DE6244699CB0A5BCAC9AA46030D2449F8C447
          9A24583DA7F5213FE1BE67EE306B6CE5CF6F14A18858ABED1709BC855A67142F
          97FB7D359AF15C416AE5116C445AA20BC034E781281DF2E290B37CDF96C891E5
          51F5B9E57B2BCB766F4E65DDB0BB2F6B1ED0E9DDABDC736C9E22D60BF5194A43
          EC496560E08602A6DDB3E978832BF587174EE331358DF1140D1266E666D4E615
          92E2851AACC4A993100536E2AA790D74EAF1FF004CFBD276C87EAD341EDAED78
          ED60DD550C5A4355492F73360215316699D9AD35DCED6C02C3C80F5CA9AA4105
          981ADEF4D872C5004A79A1C00B27AB1812AA611DA877A189027FA8509800A432
          487FCFBB9BA310CC4C616E8730CD622193ED4D5AD0A2450D90251056B04A1B12
          2B306897119C9A94FE430E3D19E353C0493BA16976B0D37DB6AEE9BD174EC128
          5B1B542B270B875DAD3A7630C705B32ACB0AB74E43C333E304E5A1127921A6BE
          650E52BDF985270DE922A3C2A846986789874156BC3B7169AC4BB7F5AF5A4729
          383B19D0EA3671358D5B0963CCE3BBD92DA8EC35CA52D17B916C9A9899B1D742
          198A229EC4FE6AEC2D3DC03911A664B1081C2434F8F6C1C5F682BFD2B465E834
          1BB916F3B568C6BADD36D496C32EA286D6F41336C3D78C4FE15533B52C68E4A1
          3C5665713F30AD5CDF1C8F3139399ADE8CE527012A1C1461D2EE3CCECD7E773F
          BE34FF00622EDB5E0FA391AEDF1389876B0DF6B15643AB9B3AAFB5E87BF2DBD5
          56DAF26F4CCDDA20F59B142D3FD54ABBE747125C1C5F18122A756277C202B278
          53E3207E86DFB50340B4753EAA55C23296A7360C57056B13B1ACBBBADA84C4EE
          19E6C74A2C98F249649AD6B1E7F356F90BD4E1CA7AE2FA7B875A8546A44E4A90
          A7480252964940540D06DDB4ED7146EB5F7EBA76AE7A769556F01DB5EDB2C314
          1CA256E13E5F13694CE5A98E096A1264AF2A97BA2A8CD2C62BF979911A95071E
          CED6853B78CCC89264594F1EFF00A1B54BDA939A515B9BB2DB4169E8187B8FD2
          37DC72B61314B610DB5C599B0FABF1AACA008E24EF45B051375485A1B26155CB
          E5197095A61C10E4EECA1D5E9C00EADEBC6044A30F30D7F64229DBE2DDA9FB53
          BD6ACD275423AB3F8C0D795BC86BA72A81244DEAB190BE365F2F778D2136ACA6
          4C091EAB1569A748CB54F1133D2236FF001C84EA0A4E34F94868A4D4D7A9050F
          73D35511DDFBD7CD2945A6330B4754607AED3ADE0956AE6A756951A48A5C578A
          9B722B52C22457A575207BAD227308055E992A972291E559E05F235EDE7AF4C7
          94DE4745EEBA1779B237496EC6EA3DC7A8BDB3B6AB542F1825F159C46CCB257D
          45425555CCEF50A70FE8A33B055B5D47C06F45A54A6311A891C549E3C156D2F0
          B1AE4AC2886D6024472918931DF62FDDA9B47EA99F47671B297AB430DE8BE29B
          81BB51FD418D4FD81A1FA17AC558B16E25AEA1C1657713716CCB337DB93BB39A
          DC1E9E260328D90284816C401525266F015956DC84AAABB268866D67514B595A
          B09B76EDBBBFBA0F71C7CD79D603D8A04E044CE6355ECF5C92091D92FEF16AAC
          455E4361D5B3439872E6F6E061DE586E24904A75279E12B2C18BDECCB74D636C
          697DD62ED5B5CE8F4C229BA5AC75B636335B6FBA3658CA3AAEF9B6E3F51D9D55
          5D3148B55F59CC65D059FB2CC7CB224A4A25C5B7C8468DC42A52E538C2A4132F
          FDC9FF00FACAFF00EAEF13F6BD7B3895EEB0A0F45DD0F7F55A434E4AAD36E4EC
          2284CA539A610A139E45AB2334A3C838192CC24D2860EB00C3E9E7CB38E333C8
          5BD277BFDEE4CD891C8E74A19DEF36E654B1A6BDC27ED6EA65E770DB98914771
          144C98BBF1C2207CA95BB96C18C9187C5383E442E79332BFC6CF5F0FB4FB8634
          FF00B6175CAB5DD7EB149A484C86B777D8F78DAF795EF8930E93B7ABAA45082E
          BF7C92BCCDD79C7BE3A16EAC24F59E51E60B272B165408591E79F12F28634F77
          FD86FDAF903D635EA5A05575736958570C69281A8A29F0B995991D83C5A4E6AC
          7AC0B2A16379AD75EB77809FA71828CF133CF3D58C05782BE79B296859342D03
          ADF275ACC755FAD2E5703B55A89131A342F08965E0FCC1249F09E9E4BC655BEE
          153A4692E5378B91652978C8439E9E58C3781EBA9DAC7F968E807FB37D6FFF00
          48E27C7546AA7B93FE1F449B6BB52DFBCFA95B472FD2BDA23BE1C6CCE4D176B7
          A5AD9267A69662632DF3561758ACBA172880CC0C8C17842E4626395A37720A2F
          232083C6B142B931737D86E711FC30F2763DAAD5ADC296F707B12DCBA2A4B36B
          8B86F6975AF03719A3FDCF33AEEC16D94B6258E3DBAD946BA4218088A3221642
          42B8D7F3CBC939521100BC948899F5DB0B9EDE7E1F6964AB6D26DBB1DBB375EC
          1D09B9ADA39DD6DBED3186F7C5D1796BCC95612E72A796E708D4B62CECD29E52
          F69C0E4E4D4B0B766F52EBCD493E544108316B6C2A543F648B56BAD3ADEAA0ED
          EEE0773EC25BDBDF1871679AD916323757DAEA0CF6A9A0D6804B2395B3ECD1DD
          E9CA5CE080C2923AB99AFA9C4B903737272C84C0420C8D101D976FAEDA2E1A39
          DBB1FB44155D24D8CB1ED1DD494168A481662A5377D5D29D40030B889F2B91E5
          665806E7E2721B863CCE71CBF678E5CAC64504FF00B3D7691FE169415D744C96
          E76FD836CB92C23266B96975D1D5EA540DAAA16D10D5EC0A1BCD99CC86E21584
          3708623707138E91F2E9FB73C48C81AEAA43F0ECECFEAA4D2CE836A97764BA68
          3D3AB7E5637A985590E81220DAA9D80C30297E171DB1954A543446E7D88E124B
          77CE0DAD88169A020919E8CD012023844570319AC7F0C038D6BA65BA7A869773
          D3B991B5D636BE4CDA66CAA8E3427419B284934BDFC86F766705A81F9ADC64E4
          4AC25187814A02D29A9BC4C16678990855514365D6FF0069176B53B3AC3FB55E
          2FD4AC8E31783D470F36EF156827146BFE974F23F37F1C35F066880F4A4BA858
          B09318F8C08C2702C1B91199C64194C5C50A594F685739276626FED318D814A9
          5C5144A2F1ACDED9ACF26243B31CBB1BAE2F17E9D026A518020F021C36631F19
          C998C67CC6739CF32F85650D7DCF3F0D34A0751E8AAAA4F77DF6A5DBCD1D88BD
          C1983601AAB7529DA2671B576DCFED88B1208B249DFC5226E5075D63B8212D46
          17B994E680CC92A53F40B1802BCF4642BFF0F0DF7626DAEA3EEAEC3F7359FDFD
          7650762D713E9E9B39A7DAC11A90A1AC2C96B9F4760952B0B1CD199BEA68B9C4
          A4509D607C1710295EACE70C12508D191956C48DF96DBEB8A8DA0AF60D054F32
          0C1870DD82D77BCB2EA362C487E200A1EE1885AC28CE11E5D1A7CA8A4DF2B791
          F37E20FCAF8DE2F846F4F40A8AFDC8D7C3B6C355AFED6B4F2D0C0CEBBAAF94D7
          209989971230C685246F310FC544C427167F8AE12E0CCE72479A23ABECEB0FDB
          C029B65400760D453FAB30EF968366D5BCAABFC3F811855E5AC5258C2E8EE1E0
          0DA23C90A9CA3CADF1F04E4D0E07D3D1D78E7CF80D5840BB726C76AA0AB49BE9
          7EC6D60D76421D56D6ED62D858A5FB4F482594D5F8A358A189E0D5A5CED24422
          C58B5875158AD51E50E0DE71299D5E1A1C5B54272D425F3288B58395E033EAF3
          47F611B36AE09BD5B25B479BA6CB83D2973552EB4A56F531709A39AA273D3E02
          FCD4C149C41E66F2992B34802F90B506BDBD3F3C3DB9CA047214DD4D889BC94D
          C581AC788583DB6E2512B0239587761DA4EDA75AAF54F0E73FD0B9A4A6BDA3EC
          6A09F5D917C624F01A52B9D81A764F775325FC756AB51F0C812E706513929370
          C022C9F0318990142D6FEDD8D9B2FAAFBF8CD5AB34AF52E89DCED87D7F986BA2
          39FC2A40EB612AA9F598749AA1DDD398CCDDF9A2C25524DA39AD6EF6F9955283
          8A931E9DDC97571C9C7A8E9139C1B41B2A99EE22C1674EE63AD7B7B4DB857D3F
          7148E69A9EDADD7D79B05254AB8A6D2D02FF00A596053B6853724511A723CA02
          ACB44813BBE493C02C10B4A09A3C714226F1DAD1D57EBF25602F6157AADB749B
          92C9DC2F3B26F3014CAA22E5B5AC68D247083D6D288E4E8884F4CE2B34818827
          8E92F785691A0051F85E6AE2F2A061994CB4D76AAE68FD5D6D593B2155D6DBDB
          424DE64ED4A5DBAFD4CCB1BAA143584F5BE30D538A2ADCA76C9B7662BADE80D8
          A4C6CB54E66E1E58D7A0704EDCADA8D46A9B8472C0CBEBFA3FB844CACAAFA5FB
          45B655430C02B279CC88AA874F2A29656A8EDE7D293F9441F59A7D6C58D69C8D
          4405016238FF009658D3B5815283C3956BD4812961182F7A81AE86EABD2D8A8D
          44C713C37EAADFD65E6421610C6F19C5DF7B58B74059F0D20747700331B0CF7E
          1FE360EC614F96F1B0593E27840062C776C09EC4D92BD9CD31B229E19B4147EC
          86E25EF5258D20AD8E9155EE110DCAB3DEAC2B3686B66AC4B3567512985BAA55
          0DC984EA81D9B1D5138B592E2872467034A30F99FE87EE86D43D52D2CDB8DBAA
          E19F1AFBB1D436C157950EAFD32F710A91EDEE9BB11B258E4AADC72B2AC09D58
          53F7290C6D3AA6F694C8D7313447D6A80389C95D8F20809705D7F85BABF99FE6
          3FAE41FE6E1FC517CB7D3F2BAFCA7D2CFA69F43FC7F9ABA79F2FEF3F30747574
          FECBC8F3FDAF0A2DC1B7E21AEDD57E6AB6FA5FD7ABAC3248FDAF7B2B67C86DE8
          1DBADCD0B15C512BED8ABD5C96475DC8DD12967A38F4B23D213D7149922B34B3
          17B6145AB2422C64D093998DB573F5E09BEA8CFEC0BFAB880F04DF5467F605FD
          5C01E09BEA8CFEC0BFAB8070DAC9AA57FEE2DB719A4B5DAB4935913E93B82342
          048CCDAACC6B6144AD5149CE92CC5F7C2C35C5228D7E2F8AADC57984A54E5079
          885F663323C207B236ADD2C5EB76B56BFEBE14F19910690A5EB2A98520C94626
          F8E9B5FC319E2C7BC0131861C6242DCCF6B11C127231F8201E03CF3CB9F1D50B
          CF007007007007007007007010E78E7CB9FA78039E3D3F9BEDE023C01C01CF1F
          6F3F47E5E00E021CF1E8CFA3F3678039E33F6671C04780B32C6162725CDEE6E2
          CCD2E0E4D23198D4E0B5BD1AA5CD860F1C8C31BD59E418A118861F467258C39C
          E3EDE02F18CE33E9C7FDF9FF00B3F2F0073C63F37FC38039E3F2E3F4E3808F00
          7010E78FCB8FD38E00E78FCB8FD38E00E78FCB8FD38E023C0483882541432541
          452824D0E4269271603493039F4F2194308806633F9F80B4FCAD19FF002E317A
          3ECFF086FF0077E00F95E33FE5D62FFA437FBBF007CAF19FF2EB17FD21BFDDF8
          0AE46D8DEDD8185BD022420333D46051244E97060B1CB964CC12006062E5FD39
          E02BF803803803803803803803806A3BAB6ACEA95D739C58B5BC8AAA89CAD955
          C54848FD73BEA48CC1D1A07495B3363D832F8EAB9A230DD2A5ACCA8F21846F8B
          DB5872F6624C38AB4E8F271980D5CC1FB8E6CBD9578D13128D06AC87C2A6708D
          5392461A76023E5D2F3FDB263B88996E2F19856B1E74B09C1FA2721AAD4C54B4
          ACCC4CA8E5C854293BCE2E72C33B835ADE084F1A3BA6ED1331E49D292600E6BC
          9A0E617C5DF5DB96B5DED0191EAAB8D75B35ADF5A5A95F3B3939C9958ED266AA
          2A5B5244BDD5D1B508CD129610BC031F0854427C94E3A09BD9B05B0BB028E154
          AA8A7566BA7D54DB0CACB5C503B45D575814BEB8C2B574E6947523D96FCC9177
          67B9C59572BFB51928C094320D035E4E6A2959A4F59CF40D49CF742EA9842A80
          AB7167C728A75766AED6618E6BF278BDEAED7DDE712BB9F684975A364D7D71BA
          CA472922230B3CD7C893818AD24970980C6E7F35AB00DD527868919A19DD36F4
          717FBDC88A3B57E2AF123143A5EDB61CCAAE78CBEE9CC75E36C7341D82B364EB
          F88CFD500D056D5B182941CD4E8E71D91203DBD51CF0991B5E0E3108F5391D50
          D80B79EF58FB8ADBA8EE8ABAD09440761EF82E9CB927E82D2866B6393241290A
          97E55907975E075746AA6913F27526BC2D8A28718F2A561725CD4A8E20EC0F87
          21A93F7744D8322ABAE64245974DD759328EBC2C268B3AD0A85D2511EDACD8BA
          82CC570E2B532976EAA2D2768C3D94B5A028D4259244DEA46B27253C27531A6F
          CFC39E1190BF00A04E77B2F297B4EECB4CD9F2B1A767D5AD2B7C8619DBD5F639
          3951B18FCCF14D7D69B0582E5597656D68C71E011D7E90BCA80015455A8684B6
          F2C2853399520214E490C17603B81DD53498EC5D215CAD93B6445D284DD36442
          CADF0C90C2B63A84B075A2AC873DC6275E6D82412597A5895BEFCF8B7E5F58FE
          D6C4E0F284E6D5ECD937193BC57907C7BFDB892DD73B4E8CAE51DE548EB4422C
          BA7B656C590DCD7557B26B252A0945203A6D443E1CD0D0C5348721201292276E
          425C154689638929028DAB2072389CE41AEB47739D87739A51E078AFD04064B2
          18A415A6F2D5C974294A7B42212C99EAE58F7EAAB0A17E4E62A67E7D72C3248D
          B3350D73C30236FC0D63835283487B4232CB781AB149FB93ED141A0BA82E9255
          B5A2FB96C6AF3576EFB56AB4153BDC4E2F634436CADC8A404359D0A091D9CF36
          EBE4EA848D2F705EF8AD1B53B14947F0F54EC4A14EB3CB168F3E4397DD9DCED8
          FA6F6B6B2A16A66CA922CCD25AAE3D62C524D79BB1313876C0D94E773B7D72FB
          AECC33A72746FF0096DFA39075817917C09049E4662F786A330D796E25778EEE
          859E2B7B5F95876F8B42CD852D324D7213BBB73D6513537737D83602065659DF
          72C90526800E0D6D2AD9E62F71D80C124B9C33109141294099BD30402C230F2E
          1FCFEC2647EEE6E952F207074BACF855955C466C3DBCA3DF08A975C2D14B632C
          2F5D68F7EBAA0D7C31B4AA982F657F7898099C6CAEB1821427683C632D436B90
          324AB24208BB87740DAD470BCB5065DAE0535A6D83B32B8FBE5B894C04D085B3
          C7B576BEBFEA98CC85C4CB45055E6BED913A992B8DAC766A93188B0DCC8AC86F
          24D7C116103F0335D94DEBDA56F6DDACAB489EC1ABEB61B7481D6E8ACD16BBC5
          0EBDD55353588D5B57CFEC2576CBDA9589A53165987292BB62307AF89931A934
          7CF6E1A071F8E275ADA638F50A74F77776C18CEBD65B1894D16F7AE755834EA0
          11EBF1155B377F40B526C744EAD9959FBA92F31B67E9232B687A9E392A3CE42C
          D1F355832352254F0EC81B1B8F52308FF101BD7EEB1F3F7CDB527CBDF7D1FBAF
          FDFF007E9ECCBEEE9F427E17E77EF7FF004F3E29FF0097FE77FF00D37F3FF1FF
          00913E71FF001BF8A7CBBFB3E16378DC01C01C01C01C01C01C01C01C01C01C01
          C01C048388215146A752494790780651E41E580D24F28C0E4232CD2478100C28
          C0E738CE058CE33C07C0D2A530D4EA069881A849834294E112588D4A13C2101C
          14E3C872611834000E07D3CB9E3973E011CAEB5CA8CA9251299B57157C4E272E
          9A0069A45236D6FEA7656DA6B9AA7B1B1245AACC506B3C644F6B8F5BF0B4794E
          DD85A78CFC13E28C43C82D05145905964905809289000A28A28012CB28B2C380
          0005803C8002C00C63A438C72C6380F911040CF2D408A2B2A092CD24A3F25832
          71651E328679459BCBC401678C806461C6790B20C73FB31C07C052A50E140429
          8808558C662A08492C21546180C1660D407A3183CC30A06022C8B9F3C6397013
          0A20924A2C828A2CB20A2C24964960080A2CA007A00500B0F2000B0031D380E3
          1CB18E02461020C14953851A409084448D11384C56094834E1C8091A42BA3C34
          E32422E40C83974E3ECE0277974F83FCDE0827CD785E5FCCF860F31E5FAFC5F0
          3C5E9F13C2C0FF005BA39F2E7E9E000A720B34E3CB20901EA3C3F30700B004E3
          FC10F413E31B80E0667860CF20F5673D3FD1C0634BA0B0C749732CF5CA2CC4BA
          6B1C617F8B304A55B62550FACD1C94B9471DE46C8DCE269425291B1EDD21ED4A
          14921160069ADE40858E65879064BE027F1FCD7805799C93E5FC7F0C3E3797EB
          F13C0F17A7AFC3EBFD6E8E7CB9FA780049C819A51E324A19E9F0660838658447
          1383B0109D824C107232F07746302E9E5D5CBD3C07C1C95328C902509C83C494
          FC294C238A2CCCA652001A585427C8C23C94A0251A30F58790B96738FB339E02
          AB80380A2CB720CA5020CA2499425F8382D1E5313E50BF00C01A47869FA3C007
          8269781079071D22C6338E5C04EC2720078D4849282A0D2CB28C3F0583071851
          4230451433718EB196588D16421FB319CE7F2E78002412124298049414C12B04
          848096109212301E8F070560382F05747EAF4F2E5CB8097E451F93F87F944DE4
          3CB792F23E017E4FC9785E0793F2BD1E0795F0BF53A3A7A3A3D1CB97012BA9D7
          D537FEFD4FBB704D1D4EBEA9BFF7EA7DDB81A3A9D7D537FEFD4FBB7034753AFA
          A6FF00DFA9F76E068EA75F54DFFBF53EEDC0D1D4EBEA9BFF007EA7DDB81A39B9
          FAA43ED4ABDDB81A8F53A7A941ED2A3DD781A87373F5487DA957BB70347373F5
          487DA957BB70351EA74F5283DA547BAF034753A7A941ED2A3DD781A87373F548
          7DA957BB70347373F5487DA957BB70347373F5487DA957BB70347373F5487DA9
          57BB70347373F5487DA957BB70347373F5487DA957BB70347373F5487DA957BB
          70347373F5487DA957BB7034753AFAA6FF00DFA9F76E068E6E7EA90FB52AF76E
          068E6E7EA90FB52AF76E068E6E7EA90FB52AF76E068E6E7EA90FB52AF76E068E
          6E7EA90FB52AF76E068E6E7EA90FB52AF76E068E6E7EA90FB52AF76E068E6E7E
          A90FB52AF76E068EA75F54DFFBF53EEDC0D1CDCFD521F6A55EEDC0D1CDCFD521
          F6A55EEDC0D439B9FAA41ED4A7DDB81AFFD9}
        mmHeight = 16934
        mmLeft = 10848
        mmTop = 9260
        mmWidth = 72230
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DESC'
        DataPipeline = BDEPDetCalLiq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'BDEPDetCalLiq'
        mmHeight = 3175
        mmLeft = 16669
        mmTop = 529
        mmWidth = 100542
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'MONTO'
        DataPipeline = BDEPDetCalLiq
        DisplayFormat = '#,###0.#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEPDetCalLiq'
        mmHeight = 3175
        mmLeft = 163777
        mmTop = 529
        mmWidth = 15611
        BandType = 4
      end
      object ppShape6: TppShape
        UserName = 'Shape6'
        Pen.Style = psInsideFrame
        mmHeight = 3969
        mmLeft = 12700
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppShape5: TppShape
        UserName = 'Shape5'
        Pen.Style = psInsideFrame
        mmHeight = 3969
        mmLeft = 193675
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object ppLine36: TppLine
        OnPrint = ppLine36Print
        UserName = 'Line36'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 160338
        mmTop = 0
        mmWidth = 19050
        BandType = 4
      end
    end
    object ppSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 29104
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 12700
        mmTop = 3704
        mmWidth = 181240
        BandType = 7
      end
      object ppLabel18: TppLabel
        UserName = 'Label17'
        Caption = 'TOTAL BENEFICIO ASIGNADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 117475
        mmTop = 0
        mmWidth = 43391
        BandType = 7
      end
      object ppShape9: TppShape
        UserName = 'Shape9'
        Pen.Style = psInsideFrame
        mmHeight = 3704
        mmLeft = 12700
        mmTop = 0
        mmWidth = 265
        BandType = 7
      end
      object ppShape8: TppShape
        UserName = 'Shape8'
        Pen.Style = psInsideFrame
        mmHeight = 3704
        mmLeft = 193675
        mmTop = 0
        mmWidth = 265
        BandType = 7
      end
      object ppSRDevoluciones: TppSubReport
        UserName = 'SRDevoluciones'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'BDEPDetDev'
        mmHeight = 4763
        mmLeft = 0
        mmTop = 4763
        mmWidth = 203200
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildRDevolucion: TppChildReport
          AutoStop = False
          DataPipeline = BDEPDetDev
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'ARCH B'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 279401
          PrinterSetup.mmPaperWidth = 215900
          PrinterSetup.PaperSize = 134
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'BDEPDetDev'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 5821
            mmPrintPosition = 0
            object ppLine4: TppLine
              UserName = 'Line4'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 12700
              mmTop = 3175
              mmWidth = 181240
              BandType = 1
            end
            object ppLabel19: TppLabel
              UserName = 'Label19'
              Caption = ' DETALLE DE DEVOLUCIONES '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              mmHeight = 3387
              mmLeft = 16404
              mmTop = 1852
              mmWidth = 41275
              BandType = 1
            end
            object ppShape10: TppShape
              UserName = 'Shape10'
              Pen.Style = psInsideFrame
              mmHeight = 2380
              mmLeft = 12700
              mmTop = 3440
              mmWidth = 265
              BandType = 1
            end
            object ppShape11: TppShape
              UserName = 'Shape11'
              Pen.Style = psInsideFrame
              mmHeight = 2380
              mmLeft = 193675
              mmTop = 3440
              mmWidth = 265
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3440
            mmPrintPosition = 0
            object ppDBText5: TppDBText
              UserName = 'DBText5'
              DataField = 'DESC'
              DataPipeline = BDEPDetDev
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'BDEPDetDev'
              mmHeight = 3175
              mmLeft = 16404
              mmTop = 0
              mmWidth = 100542
              BandType = 4
            end
            object ppDBText6: TppDBText
              UserName = 'DBText6'
              DataField = 'MONTO'
              DataPipeline = BDEPDetDev
              DisplayFormat = '#,###0.#0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEPDetDev'
              mmHeight = 3175
              mmLeft = 163777
              mmTop = 0
              mmWidth = 15611
              BandType = 4
            end
            object ppShape14: TppShape
              UserName = 'Shape14'
              Pen.Style = psInsideFrame
              mmHeight = 3439
              mmLeft = 12700
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppShape15: TppShape
              UserName = 'Shape15'
              Pen.Style = psInsideFrame
              mmHeight = 3439
              mmLeft = 193675
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 8731
            mmPrintPosition = 0
            object ppLine5: TppLine
              UserName = 'Line5'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 12700
              mmTop = 3704
              mmWidth = 181240
              BandType = 7
            end
            object ppLabel20: TppLabel
              UserName = 'Label20'
              Caption = 'TOTAL DEVOLUCIONES'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 117475
              mmTop = 0
              mmWidth = 43391
              BandType = 7
            end
            object ppDBCalc2: TppDBCalc
              UserName = 'DBCalc2'
              DataField = 'MONTO'
              DataPipeline = BDEPDetDev
              DisplayFormat = '#,###0.#0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold, fsItalic]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEPDetDev'
              mmHeight = 3175
              mmLeft = 180182
              mmTop = 0
              mmWidth = 12436
              BandType = 7
            end
            object ppShape12: TppShape
              UserName = 'Shape12'
              Pen.Style = psInsideFrame
              mmHeight = 3704
              mmLeft = 12700
              mmTop = 0
              mmWidth = 265
              BandType = 7
            end
            object ppShape13: TppShape
              UserName = 'Shape13'
              Pen.Style = psInsideFrame
              mmHeight = 3969
              mmLeft = 193675
              mmTop = 0
              mmWidth = 265
              BandType = 7
            end
            object ppLabel5: TppLabel
              UserName = 'Label5'
              Caption = 'S/.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 169334
              mmTop = 0
              mmWidth = 3440
              BandType = 7
            end
          end
        end
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'S/.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 169334
        mmTop = 0
        mmWidth = 3514
        BandType = 7
      end
      object SRObs: TppSubReport
        UserName = 'SRObs'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppSRRetJud
        TraverseAllData = False
        DataPipelineName = 'BDEPObs'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 24077
        mmWidth = 203200
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport4: TppChildReport
          AutoStop = False
          DataPipeline = BDEPObs
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'ARCH B'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 279401
          PrinterSetup.mmPaperWidth = 215900
          PrinterSetup.PaperSize = 134
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'BDEPObs'
          object ppTitleBand5: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 5292
            mmPrintPosition = 0
            object ppLine10: TppLine
              UserName = 'Line10'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 12700
              mmTop = 3440
              mmWidth = 181240
              BandType = 1
            end
            object ppLabel27: TppLabel
              UserName = 'Label27'
              Caption = ' OBSERVACIONES '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              mmHeight = 3387
              mmLeft = 16404
              mmTop = 2032
              mmWidth = 25665
              BandType = 1
            end
            object ppShape35: TppShape
              UserName = 'Shape35'
              Pen.Style = psInsideFrame
              mmHeight = 1852
              mmLeft = 12700
              mmTop = 3440
              mmWidth = 265
              BandType = 1
            end
            object ppShape36: TppShape
              UserName = 'Shape36'
              Pen.Style = psInsideFrame
              mmHeight = 1852
              mmLeft = 193675
              mmTop = 3440
              mmWidth = 265
              BandType = 1
            end
          end
          object ppDetailBand6: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3440
            mmPrintPosition = 0
            object ppShape37: TppShape
              UserName = 'Shape37'
              Pen.Style = psInsideFrame
              mmHeight = 3440
              mmLeft = 12700
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppDBText11: TppDBText
              UserName = 'DBText11'
              DataField = 'DESC'
              DataPipeline = BDEPObs
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'BDEPObs'
              mmHeight = 3175
              mmLeft = 16404
              mmTop = 0
              mmWidth = 152665
              BandType = 4
            end
            object ppDBText12: TppDBText
              OnPrint = ppDBText12Print
              UserName = 'DBText12'
              DataField = 'MONTO'
              DataPipeline = BDEPObs
              DisplayFormat = '#,###0.#0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEPObs'
              mmHeight = 3175
              mmLeft = 173832
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
            object ppShape38: TppShape
              UserName = 'Shape38'
              Pen.Style = psInsideFrame
              mmHeight = 3440
              mmLeft = 193675
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
          end
          object ppSummaryBand6: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 60325
            mmPrintPosition = 0
            object pprregotros: TppRegion
              UserName = 'rregotros'
              mmHeight = 41539
              mmLeft = 12700
              mmTop = 5822
              mmWidth = 181240
              BandType = 7
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              object pplotraforpag06: TppImage
                UserName = 'lotraforpag06'
                MaintainAspectRatio = False
                Stretch = True
                Picture.Data = {
                  0A544A504547496D61676543640000FFD8FFE000104A46494600010101012C01
                  2C0000FFE110784578696600004D4D002A000000080003876900040000000100
                  00083E9C9E0001000000120000105EEA1C00070000080C00000032000000001C
                  EA00000008000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000001EA1C00070000080C00000850000000001CEA00
                  0000080000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000530065006C006C006F002000560042000000FFE10C
                  70687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F003C3F
                  787061636B657420626567696E3D27EFBBBF272069643D2757354D304D704365
                  6869487A7265537A4E54637A6B633964273F3E0D0A3C783A786D706D65746120
                  786D6C6E733A783D2261646F62653A6E733A6D6574612F223E3C7264663A5244
                  4620786D6C6E733A7264663D22687474703A2F2F7777772E77332E6F72672F31
                  3939392F30322F32322D7264662D73796E7461782D6E7323223E3C7264663A44
                  65736372697074696F6E207264663A61626F75743D22757569643A6661663562
                  6464352D626133642D313164612D616433312D64333364373531383266316222
                  20786D6C6E733A64633D22687474703A2F2F7075726C2E6F72672F64632F656C
                  656D656E74732F312E312F222F3E3C7264663A4465736372697074696F6E2072
                  64663A61626F75743D22757569643A66616635626464352D626133642D313164
                  612D616433312D6433336437353138326631622220786D6C6E733A4D6963726F
                  736F667450686F746F3D22687474703A2F2F6E732E6D6963726F736F66742E63
                  6F6D2F70686F746F2F312E302F222F3E3C7264663A4465736372697074696F6E
                  207264663A61626F75743D22757569643A66616635626464352D626133642D31
                  3164612D616433312D6433336437353138326631622220786D6C6E733A4D6963
                  726F736F667450686F746F3D22687474703A2F2F6E732E6D6963726F736F6674
                  2E636F6D2F70686F746F2F312E302F223E3C4D6963726F736F667450686F746F
                  3A4461746541637175697265643E323031352D30382D31345431343A32313A31
                  312E3236373C2F4D6963726F736F667450686F746F3A44617465416371756972
                  65643E3C4D6963726F736F667450686F746F3A4C6173744B6579776F7264584D
                  503E3C7264663A42616720786D6C6E733A7264663D22687474703A2F2F777777
                  2E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E73
                  23223E3C7264663A6C693E53656C6C6F2056423C2F7264663A6C693E3C2F7264
                  663A4261673E0D0A0909093C2F4D6963726F736F667450686F746F3A4C617374
                  4B6579776F7264584D503E3C2F7264663A4465736372697074696F6E3E3C7264
                  663A4465736372697074696F6E207264663A61626F75743D22757569643A6661
                  6635626464352D626133642D313164612D616433312D64333364373531383266
                  31622220786D6C6E733A64633D22687474703A2F2F7075726C2E6F72672F6463
                  2F656C656D656E74732F312E312F223E3C64633A7375626A6563743E3C726466
                  3A42616720786D6C6E733A7264663D22687474703A2F2F7777772E77332E6F72
                  672F313939392F30322F32322D7264662D73796E7461782D6E7323223E3C7264
                  663A6C693E53656C6C6F2056423C2F7264663A6C693E3C2F7264663A4261673E
                  0D0A0909093C2F64633A7375626A6563743E3C2F7264663A4465736372697074
                  696F6E3E3C2F7264663A5244463E3C2F783A786D706D6574613E0D0A20202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  0A20202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  20202020200A2020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  202020202020202020200A202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020200A20202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  20202020202020202020202020202020202020200A2020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  202020202020202020202020202020202020202020202020200A202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020200A20
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020200A20202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  20202020202020200A2020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  202020202020202020202020200A202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020200A20202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  20202020202020202020202020202020202020202020200A2020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  202020202020202020202020202020202020202020202020202020200A202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  200A202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020200A20202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  20202020202020202020200A2020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  202020202020202020202020202020200A202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020200A20202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  20202020202020202020202020202020202020202020202020200A2020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  202020202020202020202020202020202020202020202020202020202020200A
                  202020202020202020202020202020202020202020202020202020203C3F7870
                  61636B657420656E643D2777273F3EFFDB004300080606070605080707070909
                  080A0C140D0C0B0B0C1912130F141D1A1F1E1D1A1C1C20242E2720222C231C1C
                  2837292C30313434341F27393D38323C2E333432FFDB0043010909090C0B0C18
                  0D0D1832211C2132323232323232323232323232323232323232323232323232
                  32323232323232323232323232323232323232323232323232FFC00011080120
                  012003012200021101031101FFC4001F00000105010101010101000000000000
                  00000102030405060708090A0BFFC400B5100002010303020403050504040000
                  017D01020300041105122131410613516107227114328191A1082342B1C11552
                  D1F02433627282090A161718191A25262728292A3435363738393A4344454647
                  48494A535455565758595A636465666768696A737475767778797A8384858687
                  88898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3
                  C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6
                  F7F8F9FAFFC4001F010003010101010101010101000000000000010203040506
                  0708090A0BFFC400B51100020102040403040705040400010277000102031104
                  052131061241510761711322328108144291A1B1C109233352F0156272D10A16
                  2434E125F11718191A262728292A35363738393A434445464748494A53545556
                  5758595A636465666768696A737475767778797A82838485868788898A929394
                  95969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9
                  CAD2D3D4D5D6D7D8D9DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C
                  03010002110311003F00F7FA28A2800A28A2800A28A2800A28A2800A293239E7
                  A552BFD52CB4C80CD797090A0EEC7AFE1401773514F7305B46649E6489075676
                  0A3F335E65AE7C51690B5BE890B0249026950B16F70A39AC4B1F0AF8ABC50CB7
                  57334D144C48335E96DD9EBC267A671E9D296A4B91DEDF7C44D0AC9C08E67B91
                  83B8C4BD31F5C67F0AE75FE2C493CC62B2D277B9E5232DB99BDF8FE5FAD68E97
                  F0AF4BB6447D4679EF6653CE0EC423D3039C7E35D6E9FA169BA5E3EC5630407F
                  BC89F373EFD4FE34EC2BC8E01B54F1FEB01BC8B192CC0048CA88B1F8B649A83F
                  E114F1C6A53C73DCDF084E72435DB6411C13F28F61FA5777E2DD5E5D07C3F35F
                  4088D229545DFF007573C6715CFF0081BC7337882F67D3F5058D6EA35F323641
                  80EB9C11F51C1A5642D4C287E1AEB77B19377AD44B2A90B8C33E083EF8ED8A0F
                  C26D40DC81FDAD07920E449E536F1EBC6EAF4BD53528F4CD3AEAF65C058232DC
                  FF0011C703F302BCB7C23E36D5EF7C63656F7F7CF24170CD1B45B400095E3F51
                  4F41FCCBB37C2FD594A8B7D66374501417465C0E07A9EDFE7BD46BE05F16D960
                  DB6AC09546E16775CE0F03F11CFB57ACE4015C4F8EFC5AFA15BC56963222DF4A
                  7793B4308D077C1E327D2934876312D747F885A55A178F5113EDC318A49BCD7C
                  67A0DC0E3D300D325F1D78B748891B55D12331B2E43BA14E4FB8247E18CD74DE
                  01F125C788F489A5BA2AD3C12F96CEA9B41180471D3BD754F12C8A55C654F623
                  23F5A1242F43CFB4BF8B3613AEDD4AD1EDA51D5A23E60FE86BB1B0F11E93A9C1
                  E75A5F432AF71BB047B62A95EF83B42BE88C72E9D00F999C346363293D4F1DEB
                  90D57E16AC6E25D2AFCA16627CA9DB8F6C11CD3B798B99ADCF500C38E7AD3B35
                  E4169A978CBC1A5BFB42D64BBB152048C58CBEF90DDB8EDD2BB0D27E21E83AA2
                  A86B836B211F72E38FD47143D0A52475F45315D5D432B6E53C820E734FA0A0A2
                  8A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A33400669AC4004
                  9358DAE78974ED062CDD499988CAC49CB1AE2FED9E26F1DC6CFA73C7A7695E61
                  4F30B9CCA338E08193DFDA9584E4916FC41F108C576DA76850BDD5D02577C6BE
                  673E8A3BFD6B3F4BF026ABAF8FB67892F2EA12D2730160CEC318E4F200CFF08F
                  4ED5DEE93A169FA3C091D9DAC71B2AAA34810067C0C658F7AD51814D682D5991
                  A5787349D1D5459584313018DFB72DF893CD6B818A5A29DC120E9452D148672F
                  E3C289E0CD419E312615768233824800FEB5E1BA5EA12E91AB5B6A501FDE5BBE
                  E000FBC3A11F8D7B9F8F63F3BC15A8AEEC7C8873FF0003535E45A0786535ED1F
                  589D25617562A8638C1EA0E59B3EF81FA51622477DE39D7A1BCF00457368098F
                  50D9B371C103EF11F5C800E7DEBCC7C31726D3C59A54DB72A2EA3E4FF77904F1
                  F5AAAAD797B1DAD82CD3796B204811989442CD8F97F135B3E33D222F0C6BB145
                  66F2910C292EF7E7738E491F95249B13699EFB34F1DB5BC93CCE1638D4BB31EC
                  0578969B02F8F7C7D7125E4F2456CC8F30556C315042AA2FA1C107F035BDF12F
                  C4D245636FA4C1279666884D74C3B29E8A7F53F9562693F0DB5BBFD3E3BE1710
                  DA975DD1C4ECD92A7D71D29D98E4CB7F0FF531A2F8C6EB4557596D2E6568D5D4
                  8015D7255871C8238FCABD94B2842C48000CE735F39DEE9DA978375CB57BA555
                  9EDDD2E1761DC0807279C7D457B0F8C35B10F81E7BCB59306EA3558CF5243E33
                  F9293F951EA117A1C77887C75AA6AFAAAE97E1C320467DA8D08FDE4A7D73D877
                  CD501E16F1D6993AEA514D2CB3C658EE173BD88190490C70D9F41EB5ABF0874C
                  0CBA8EACE4162CB6C831F742E59B1E9F780FC2BBBBFF0013E8BA65F0B1BCBD48
                  6E76EE2AC0F00F3C9028B24B50B37A9C7F81FC7175AB6A2DA3EB00493BA9F29F
                  60192012CA7DFB7E0735A5E29F87B67AB234FA6470DA5EB1CB10308FF503BD54
                  97C2535CFC40B4F1058CB6F2581904AEC8E090769C8F7F6C7AD761ADEB16DA16
                  932DFDD13B1000A8A705DBB0146C3B268F2982EBC57F0F92149551ECE7C158E4
                  7DCB9C0CA0E855BF4AF45F0FF8D349F1011143234575804C320DA73EC7BD47E1
                  8D6A3F18E88F35DD822012344D1B10EA78EC7D31FAD733E29F875224CDA86804
                  A4ABC9B756DA41F543FD286AFB0AEE3E68F51C8F5A2BCCBC27F10584C74CF10B
                  F972A9C25CC8A579C0F95C763C9E6BD25245911595832919041C834B6DCB4EE4
                  94519A298C28A28A0028A28A0028A28A0028A2909E0D001915C7F8D3C670F872
                  0FB340435FCA84AE7A463FBCD4BE32F18C5E1FB66B7B6656BF6FBAA79083D4FF
                  0085727E08F0AB6BB76FAF6B225922F34342920FF5CC39F31BD876EC6A512E56
                  645E1CF0BEA7E2F9D755D76698D8339758DFEFCDDBF01FD31DABD46583EC7A54
                  915842A8D1C4C208D4606E00E3F5A6D96ABA6DF4F35BD9DE413C901024489C36
                  C3E9ED5A0483557EC249753C274BF1E6B3A5EA2669AE64BB8D8FEF6191B218FA
                  A9ED5EABE1BF1869BE25801B67315C0FBD6F27DEFA8F51F4AF28B67B3F0FFC44
                  997538E37B259A68E5DF16E015810AC07E43E9543519ADA2F104AFE1992E044A
                  E1EDC229DEBEA5475DB9CF5E71536B31733EA7D100D2D796F853E25B3CD169DA
                  E2FCCC76ADD8F5E8038F5F522BD3D581E41E2A8A4C7D07A526690918A5743286
                  B1A72EAFA45DE9EEE556E2368CB0ED9E95CF782FC1EDE195BE79E64966BA7507
                  68E0228207F3ADFD475CD334B4CDF5F4107B33F24FD2B99BBF8A1A0C591079F7
                  0C3B2A607E669A90AC167F0E6C2D7C4A75749A431090CB1DBED1B439F53D5802
                  3A56CEAFE16D2B5DBAB7B9BFB7323DBFDDF9F83FEF7AD71F27C5A324816CF449
                  A556FBBB9F25BF000D44DF153505E0F875D5B3D0BB8F97FEF9F734EEFA12F951
                  D4EA9E05D1F59D71755BB1399832128B26158AF4C8F4C76AE980C003000ED8AF
                  35FF0085B2D1C8A6E3419A38B1C93291F90DB8ABF67F15F479D88B9B7BAB7520
                  15254386FC052BBEA3B2EE4DE3EF085DF88C5A4F61E51B984953BD8A8DA4E41E
                  3AD68DFF0086FCEF020D1061A582D95636EA0BA0C8EBEA47EB5674EF18E83A9B
                  05B6D4E1DE780927C849F4C1ADB122C8859082BEA0E453B89A3C67C0BE2A8BC2
                  D7B73A76A68E904F2AFCF8E629318C30F4E9935A3E3FB7F0EDE58C9AC5A6A30B
                  5FB320C432EEF3003CF4E9D8E7DABB0F1278234DF11665915A0BBC604D18C7E6
                  3BD7176FF08EF048A2E3558C44B91FBB8B2D472DC1DED62C7C2459A28356BC76
                  096036A73D03AEE271F4047E9595E31D7E5F16788A0D1F4B71716C87645B7859
                  A5C64B67DB1FFA15753E254B7F067C3E3A75A619E7C40ACE39727EFB1F7C03FA
                  5637C2BD11A4BAB8D6A4561145FB980F186FEF363D3A0FCE862B9E8BA36996DE
                  1FD121B488A2C50479773C64E39626B94BDF8ADA4DADD9861B59EE2356DA6418
                  5DDF407AD6B78B3FE273E0BBE1A64C27DCA1BF74C0EE504123F215C6FC36B7D1
                  755B3BFB1BFB3825BADC186FF98BC78C6467A1CE7F4A92969B1ADAAE99A378FE
                  C9AF349B848F53893A38DA48F4917AF5EF5CE787FC5FABF856FE3D33578E56B2
                  4CA18D97E641BBAA93D40E401D0F1549A26F067C47B78E2B82D1433C6ACD9C13
                  14800DA7FEFAFCD6BD5BC45E17B2F11D988EE014B84CF93301F329FEBCD3B5F7
                  16CF4362CEEE1BDB58AE6DE45961957723AF423D6AD578E683ADDFF8135A6D1F
                  56576B277072C73B33FC6BE83D6BD7E39124457560548CA907AD1B6E5A7724A2
                  8A2818514514005145140066B9EF1678921F0EE94D202AD77202B0467B9F5FA0
                  AD5BEBE834DB29AF2E1B6C512EF73DFF000AF1A985EF8F7C5B1463CC8EDD9B6C
                  8554B082319EE38048E9EF412DD897C21E1EB9F16EAE754D458C9648F9695B3F
                  BF7CE4A8F61D0FBF15EB5A958BDCE8F73676D2181DE1648D947DC24718AE6751
                  F14E8FE0B4B7D1E080B0895159232008D4F73EA48E7F1ADBD23C59A3EB6AA2CE
                  FA3694FF00CB263B5FF23CD1A2D094783D9DFDEE85ACFDA6176B79E2936C8376
                  791FC247715EE1E15F1559F89EC449132A5CC6313424F2BEE3D56BCE7E27787D
                  EC35AFED48500B7BCE5DBD241D78F71FD6B0B4FB4D6742B2B1F13583FEE24DC1
                  5D3E60B8620AC831DF9FA52B5B6127DCD8F89FA69B5F12FDA32596E63128E318
                  EA31EFD17F3AF44F07F8774AD274AB6B9B34124D3C28CF72DCB4808C8E7A77AE
                  626807C4FD22DAEA075B3BFB297CA99645DC002324F1FA57A2697629A66976B6
                  51BB3A5B42B12B3770001CFE54D0ED7662EA7E04D0356BB5BAB8B4DB26417F24
                  EC121FF6B1D6BA2262822258AA468392C7181D2B275FF1369DE1CB612DE4B990
                  8F9225E5DCFF008579FCADE26F8898F2E3163A433020B64023D71D5CD0DDC774
                  8EA759F88BA3E9ABE5DA937D72490A911E33FEF1E2B9898F8E7C5FB99636B3B1
                  63F2A13E4F7FFBE8F4EF5DA681E0BD1F4055686DC4D7400DD7330DCC4FB761F8
                  62BA30A07E1C74A2C2D59E6BA67C2787CD59B57BE7B8723E68E205467DDBA9FD
                  2BA8B6F03F872D23089A4DBB638CC8379FD735D20A4C63934EE1C88AF6F6505A
                  C6B1DBC291228C05450054DB10F247278A7D2138ED45D8D45113C08E0028A7D3
                  22B2EEBC2DA2DD97F3B4BB572E7258440127D735B201239A5F6A7762714CE1F5
                  1F863E1FBC05ADE192CDF8FF0052D90707AE0E6B0DFC09E25D0E6F3745D65E64
                  50C423B3291C71C1C83FA57A985A42BCD20B34793C3E3BF12787E65875CD38BC
                  4C060BA794DC75C11F7BF1AED7C39E2FD33C49137D9DDA1B84FBF6F2E032FB8C
                  7DE1C7515BB736B05DC2F05C449244C30CAE320D79B6B7F0CA64BE6BBF0FCAB0
                  8186489988DADCE769F4E9D680BF73BCD6B43B1D7ACFEC97F1178B258618A953
                  8C718FAD64789AC8E95E01BBB3D282DBC36F0055009F96307E623BE704F35C86
                  8DF10F53D12EC693E22B77731B6D7949C48809EADD88F4C735E9F6D716BA9D8A
                  CF6F2473DBCCB90C39073EB40FD0F39F851731FD9B54D3A597E6F303A465BA2E
                  369233EF5CEF8BB499BC17E2882F74A984513169EDCF38523EF29F51FD18D747
                  E21F87F7B637A354F0D48C8EBF30855F0C0E73F29E847B1AE73FB07C59E2BBD8
                  ADF5386E435AA05592E46D55F7FF0068E0734ADA5847A358693A3F8A1F4BF144
                  B67FE9451655E4E37818191DF0718FA569F89B589341D125BE8A0133290A431C
                  28CF76F6FF001AB7A4D847A5E956D62872B046101E99C753597E31D66C34AD02
                  E96F1E32F342CB144C325CE3038F4CE39A6F40E86624BA4FC45F0D3ED012ED54
                  2BEE5CB42E4640E7B1AE57C35E28BFF096AA746D6C91668C5189EB01CF0C0F74
                  C75F4E3E95C9681AD5E685AA8D4AC9649220E12655C8128FEE67A67D2BD17C53
                  6765E31F0C26B9A4C5E6DCC6BF3AA8F9B68192AC07248CF1E84E696FB8AFD8F4
                  7475650E1815600820FAD495E67F0D7C54F76BFD877526E785336D213CB28E36
                  7BED18E7D2BD2F34169A62D1482968282909183CD2D739E31D73FB0741927424
                  5C4A7CA840FEF11C9FC064D026CE17E206B573AB6B29A1E9E7CC45755DA983E6
                  4A4E31CFA703F3AEFF00C39E1FB5F0FE98B6D002F239DD2CACA373B7BFF2AE1B
                  E19E846F2F66F10DCB3C9B1DA383CCE72DDDBF0E9F5CD7AAEE51DFF0A1684AD5
                  DCF3FF001FF8365D623FED2D3D73771A6248F1CCCA3A7E38CFE95E3C567826C6
                  5A1915B1DD483E95F501C115C0F8DFC089ADEFD4AC404BE51F3C7B7E5980E47D
                  1BDFBD1626499E69AA5FF891B48B7B5D55EE25B17DB3C0655CEE014853BBD0E7
                  38F6AEA7E18EA1F6892EBC3F76826B2B88D9C239C8046370C7BE7350F813C42F
                  0DE47E1AD4E2FB45ACB2948E39577185C64E08F43E9D8035E95A5F85B47D22F5
                  AF2C6C5219D976965C9C0E3200E8A381D00A6B6122CE8FA269FA1C1245616E21
                  591CBBFCC58B374EA79E2B17C5DE36B6F0FA1B5B60B71A9C836A420E7613D370
                  FE9D6AB78EFC5C346B5FECEB362DA8DC2E3F7632D103DFEA7B0A83C17E085D38
                  26A7AA47E66A2E4BAAB124459CF3CFF11C8CD1B97B6C51D17C0D79AD5E0D63C5
                  33C92990E56D49E587A3FB7A2D7A4450A451AC688151400140C014F031D071DA
                  9C2804BB89D28A5C5140C0521A5A28013146326968A00292968C5031334B4521
                  3484068C0C5377A9E334D69511955DD01638033D698191ADF8674BD76161796A
                  865C616603E7538E307BD79B4536B1F0DF5868E557BAD3266CFDF2038FEF03D9
                  FDABD8430604E47155AFAC2D752B47B6BC852585C72AC3A7D3D2825F915B47D7
                  2C75DB21736328707865EEA7D1AB480041C0CD7925DE8BA97C3BD522D4ECE596
                  EB4C2713A6EC6E078C38F5C1E2BD334AD52D357B08AF2CE40F149D33D41EE08E
                  C7DA80462F8CBC570F876C5A38DB7DFCC87CB5047C9C7DF3E98F4EF5E71A3E89
                  AC7C41D5E4BFD426912D9080F3B26030CF08807EA6BB9F107C3D875FF108D466
                  BE956091544B10EBC0E02B76CD761696B059DB476F046B1431285445E1547A0A
                  61AB338F86F4BFEC43A47D8905991B7CB031D075CFAFBFE14DF0EF86AD7C396B
                  3DBDABC8E934A6460E7B918C7E95A37FA9D9E97079D7B711DBC59C0676C67F0A
                  F38D77E2AE59E1D12DF247FCBC4CBDBBE16A5B2AC8A5E3DF0F4FA0EB316BBA6B
                  986191FE6318C08A4EC4FB1E95E8BE15D6D7C41A05B5E90165394957D1D7AD73
                  3E15F11DB78E345B9D275654FB5AE55D54637AE7875FA5735E16D4E4F0878C65
                  D26EE52B68F218661BB2AAE7051FF1E01FAFB53E84AB267B4514C0D9EFCE69F4
                  8B1BD8D79A7C41F375CD734CF0FDB27CC5C333EDDC17771B881D80CD7A674155
                  0595BADEB5DAC09F686508650BF36D1D89F4A04D18379A45C69BE039B4CD38B1
                  9E1B5D8AC8B8673FC447FB4DCFE26BC4E25D46E7538EC2DDA63732C9F2C4242B
                  97F7CF435F4A11C1F4C57997C43F07C6F136B9A7C4C9708774EA9C03FF004D38
                  E72391C7273435725A6B6392BDBFF18F85444B7B737506FDC519A6F3010303A6
                  4F7A9CFC44F16C7147279ABE5B0CAB3DB0C363AE0E39ACDD385D78ABC43A658E
                  A7A8492A12B199257C9DAA32473DC85C7D5B35EF71DA4096F1C0224F2A301510
                  AE42803000A60B538EF04B8F1024BAC5FE976697B04E6386E604DBBC606E38CF
                  5C9209ADEF14EBD1681A3C970CEA27752B029EEF8FE95ACEF15ADBBC8C5228A3
                  52CC4FCAA07524D79569D1DD7C40F16B5D5EA2B58587400111B10D951F8F04FB
                  5202E780BC37717F7C9E26D559A4DC0F92253B8BB67FD61F4EF81EF9E8057A80
                  005448AC8A01C1C7A71ED530A634828A28A061451450014518AC5F11788AD3C3
                  5A69BCBB059721422E32C7BE052036A8A82DE74B8B78E64CEC9143AE7D0D4F4C
                  028A292818B9C5715F107C4B7BA059DB45618492E377EF4AE7601B7A0F5E6BB3
                  62075AF3BF10CF677FAFCFA9DE3BBE9BE1E519418C4B724E420FFC7411F4A44B
                  661F84E0D535EF105EDA6A7AC6B10BC3002C82668DBEF71BB8F9719E00C1EBCD
                  76EDE04D05E6599EDE79251FC6D73212C7DCE6A3F054177776F3EBFA944A97DA
                  8B02001F7215E2303EA324FD6BAC193E8299293671C7C016D684BE91A9EA1A6B
                  E491E54DB97FEF93511B7F1A6896C3C9BAB7D5C062ECB247E5C9B40076820E32
                  704576EC38EB47B914156391D3FC4DA4F8984FA3DDDACB6F70C18359DCA61881
                  E99E32073F4E6B8EB79A5F873E3492194BBE91760063C818EA1BD3239045753E
                  3ED0CCD6075AB26F2350B006449178DCA3D7D48ED4B341078FFC0D14CBB05DB4
                  595207FAB980C30FA678FC6811D843224D0A488728CA194FB1E95C778DFC5F77
                  E1E78EDACE04F31E3DFE739E0738C01DEB3BE1BEBF31337876FCBADD5B64C3E6
                  1C9283829F553FA56A7C46D18EA5E1EFB4C6A5AE2CDBCC03FBC87861F8707F0A
                  013D0F3A4D1F5EF1659DEEAFE7BCFE4E02461B73B9383851E983B89F6ADBF853
                  2D88BCBCB29E1417C4168D8AF44E8CBF5CD687C2BD650C173A3C8AAB2C6DE723
                  01F7D480083EE08FCAA3D67C23A8699E3AB1D5B46B5796DE4B85965546DA1304
                  061F420E7F034217430FC57653F83BC631DFE9A0C11CBFBC8767DD3EA87F5FD2
                  B53C7DA7C3A9693A778A6CC652644F37031C372ADF504907EB5E83AEF87AC7C4
                  762B697A8DB51832B2360A91E86A47D0EC8E83FD8AB1EDB410792ABD703A03F5
                  14058CCF026B7FDB3E1D8FCC72D736A7CA949EF8E87FEF9C57535E4FF0ECBE8B
                  E2ED4F469F70327CA9CE46E424F3F55271EC2BD63341716154EFAFED74DB392E
                  EEE511C11804B1F7E0003B9AB67A5794FC58D6B6C9069A8495897CE9154FF111
                  F28F7EE7F1A43B9D11F899A08BA580FDA9149C091A21B4FE20E47E22BABB7BAB
                  7BEB28EE2091258255DC8CBD187A8AF2ED67E1FE9BA5F82DAF9DE71A8C51A33C
                  85BE52C5B95C76196FD2B93D27C6DAC683A73D8D94D1246CDB93CC8F26263D40
                  FAFA76A64731D0F8DBC1F268373FDB3A6EEFB18937B04054DB367208C76CE719
                  EE715E9BE1CBABCBED034FB8D462F2AF258434AA077EC7D89001C76CE2BC86CA
                  D7C5FE309D7CC92F1AD1D82B4B236C8D5377DE038C9009C60735EDCEEB6D6C5E
                  460123425D88E800EBFA500ADD0E13E257888DB5A268964C4DDDD150FB3F8549
                  C01F89E2BAAF0DE890E81A3C361110CCBF34B277773C93FA62BC92DEDB58F18F
                  8B2E6FAC1118C33890C92B1554C10138E79C2E31ED9ADFBFF1B78BB409CC1A96
                  9B6EF81B8BEC620AFB3020763DA8D6C17573D54609C77A5E3D6BCCF4BF883AFE
                  AD2BC567A14172F185691239B0501E075F706B65BC5BAEC6E43F83B502A33929
                  229FCA96A55D58ECCD15C4A78EB50FB379F2F84F55540B962AB9FE951C7F126C
                  15952F34DD4ADCB9E034391D71C53D42E8EEA8AE49FE21E831C65E692EA25071
                  992D9D47F2AB7278DBC3B1A02DAA45C9C1F95891F862803A1270335E6FA9447C
                  5FF10A1B00049A66979FB4FF0075981C95C7FBC00FA29A4F12FC4DB58ADE4B7D
                  155A699D302E0F017DC77349F0D359B08F48BA4BABC823BBFB433CBE6BED2471
                  F364F5E4E3F03EB4AE84DA67A42A8450AA3E5180001D074A7D528B54D3EE0131
                  5F5B4817A95954E3F5A92D2FAD6FA3325ADCC53A0382D1B8600FA7145C659A0F
                  4A89E68E2467775545192CC7005721A978F20178BA6E896CDAADFB8202A1C463
                  1D4963C501737F5CD561D1746BABF98AED8109019B019B1C293EF5E6DE0ED0AF
                  B5D5867D4E451A1C53BDC7924E0CF3B104EEFEF2E71D7A9AEC2DFC2A2FEE4DFF
                  0088E45BDB9651B6DBFE58DBFA851DFDC9F7AC5F896B7AD65A7E99A75ACAD148
                  C5CAC51EE00AE368C0F4EB4C93D091551142E02818000C7D29FD0D7836987C61
                  F67365A7FF0068E23732154DE00F6CB71F874AEBFC3BA678D2D3598754D454DC
                  472A18E5864B9C10A4FDEC723F0A577D42F13D33231D68AC3D11B588A1B91AE3
                  41BFED0DE4187BA1E83F33C559D4F5ED3347B7335FDEC7127605B2C4FA003AD3
                  1926AB25B43A5DD3DD0CDBAC2C645EE571D3EB5CDFC358258FC2492CBB556795
                  E48C2765381FCD4FE75957B79A87C40B88AD34879AD7425502EAE1D0A79D9619
                  45E79F947D39EFD2BBEB3B68ACED62B6B78D6286250A88A3EEA8E8280B1E69F1
                  03489347D66DBC4D64DB5CCC19F03215C74FC08E0D7A1697A85BEB5A34179100
                  629E3195F7C60AD47E23D2975BD0AEEC4805DD098CFA38E57F5AE2BE176A72C7
                  25EE873A60464CC9FEC9CE197F3FEB413B31DA7781B50D23C7705FD934634F47
                  66C93CEC6046CC77C6457A14D756D6CA7CE9E34DA32773018AC7F16D96A9A868
                  325BE912B4574CEA432C9B0900F2335C0D87C33D66F59CEABA8AC08790AAC646
                  3EF9CD1B8D68763A97C41F0F69D218BED4F3CA3AAC09BB1F89E2A968FF00126C
                  B59D660B08ECE5896662A923B0E78CF6AE23C1BA2D83F8E6E74BD4905C2C6B2A
                  46AE301D9580C919F63C56C7C41D16DF403A7EA5A45B2DB6242AC215DA377553
                  ED8C1E3BD017627C4169343F17E9FACDB290EFB64651C0731B0C8FC54815EA96
                  D3A5D5B453C64149555D48F422B84F88D6F1EA7E10B4D4963626378DC30EAAAE
                  003FFB2D6A7C3BD41EFBC236CB20F9ED98C0493D40C107F22281ADCEB0F4AF06
                  F1B49763C617773343B424E0C69283B5D5785181D8E07E75EF44641AAF736B05
                  E4463B8863963FEEC88187E4680699E33E24F888FAFE8B1D84766F0EE2A66766
                  043118E98E8339E2B73E185AE852E8EEF2ADB4BA9B4ACB279A4160A4E14007A0
                  2318C56C6ADF0C746BEDCD6BBAC9D9B2FB0EE5C7FBA78AE4EFBE136AB6DB9AD2
                  EADEE973C263CB623F2238A56645FC8F62545550170060631C573BE39D4974CF
                  0A5D311B9AE3FD1D31EAC3FC01A93C2167AAD8E8890EB33B4B765C91B9F7945E
                  00527BF426B85F8B1AB09AEADB4F8240C6DC179113A97230ABFE7D68BB2B448E
                  93E1869B1DAF8596ED5CB4B7923C8E48F42547E833F8D755AADABDE695776D16
                  37CD03C6A5BA64A9009FC68D26D23D3F4BB5B58D3624512A818C76E73EF9ABAD
                  F3034C12D0F3FF0086370534DBAD3AE1228EE2CE531E0A6D9190F3CE79C06661
                  F8D7A0F15C46BFE15D446B0BAF787E648AFD7868A450164CF5C9F4E99FA53E4F
                  18EABA65AA1D53C357BE6F467B621D09F6C1C8A0134B73B3C1EBDB1EB4D65070
                  48076F72335C3FFC279A9CF32ADA784B539011B8965DA73F88E956F678CF560C
                  4CF69A340E06D554F3A500F5CF6CD03BA343C45E21B0D0EDB33A7DA2E98622B5
                  8F05DFE8315CC7F606B7E30BE2DADC434ED2633986D61C076247249EBEC49C7B
                  015D8E97A0D9E9419D15A6B990832DCCBF349237A927FA56B63140ACCE557E1F
                  786D4B13A6464326C2092401EA3DEA0B3F873E1F82CBC99ED45CCACA15E6919B
                  2718CE0678E4576549F85171F2A3859BE16E80CC5A1FB4C276328024CA824FA1
                  06B9A3F0CB5EB5BDC595EC42227FD6895931CF52A3AD7AF6297140AC79D45F0E
                  6F6FAC1A3D635BB99262D9558D8B46AB9C9E0F538CD258FC316D3E68AE2DF5EB
                  B86E173BA48634538239C71EB8AF46C0A38A02C71EFA0789D2F8DC45E2890C7B
                  91444D6CA404046E247427E8052DE687E2A7BB125AF8982464B1C496AB940482
                  000383C7AD75F8A08A0394E1A3D23C74669C49E21B658640DB596004A9ED818E
                  3F3A593C3FE309ED9A36F148196C065B7084AFD4722BB7DB93ED46DA770E5671
                  171E02BBBF895351F12EA770170760C2AE7D80A9AC3E1BE8366DBE6865BB93B9
                  9D890C7DC0AEC738A504633DA90EC436F0476F0AC312048D06155780054B8A5C
                  8A4CE78C7EB400671DEBC92F2297C3BF156DE48BE58EE660DF37465909040FF8
                  1122BD68A8C579AFC568CDB9D37508462642EA1BD082197F5068133D281C8CD7
                  3BE28F14DAF86EC8B3E64B961FBB840EA7D4FA0ADAB1BA179A7DBDC81C4D12C9
                  8FA8CD79AEB5E0DD575EF1B5C7DA19D74F69558CCC78F2F1F754763C6DFC6903
                  D8E2E09B568A45F11A2485C4E5FCD11931972C4B0C8E9EBCFAE2AD788BC5DA87
                  8BFECB6496C8843E160872774846339F4ED5EE16DA7DB59D9259C5122DBA2ED0
                  9818C77CD430E9FA4D83B4B0DB5A5BC9C29655553F9D5585666749A248FE01FE
                  C7972D28B11163A9DC14607E62B93F84BA81FF004FD39D8EE2567419E830030F
                  D457A32DD5BDD4130B5B88E42A0AE6370707A7F3AF2AF85DE5C5E29BC4C61BEC
                  C55415E7861C67F0A4C7D51EB77330B7B796661F2C6A5C8FA0CD784DF6A9E24F
                  165DDD5D5AC776D1DBFCF22C1210B08E46000793D4F4CF19E95ED7AD5CC767A2
                  5ECF29F91207CE3BF04579C7C30D5F4DB0B3D46D6EAEA282E1A559B323850C9B
                  78C64F38C1FCC521B660683E3ED63C3AB3D95D87BB4466558A7C8789F278DC72
                  7AFAE78F4AB37BE3FF00107882E459E9E861677CC715A29DED83C64F5C7D3158
                  73436BAF78E9E18A4315BDEDFB224883254331E40FF3D6BDCF47D074CD121F2F
                  4FB286DC30192AB8661EE7BD0AE1A8787EDAF2D341B1B6D464325DC7084998B6
                  EC9EFCF7FAD79A6BF68355F8AF059C71AAE6E23763D4ED50AC48FCABD80E00E9
                  5E5F6C824F8D6E4B7DC591B3EFE5E31F91FCE9899E9EA334EE2907159973E22D
                  1ECEE7ECD71A95B473F4D8D20CE7E940D6C6A52119EA3A735CF4DE38F0E42A4F
                  F6A44E41036C79639F4E055293E23F87500C5C4AC7A10B11A570BA3AE2A3834B
                  815C349F1474042760B9603186118C1CFE3DAA94FF0016ACA1B858BFB3A760C3
                  3B84838A61747A3714B5E5777F174ABFFA369AA00E089A4C1FD2ABCFF15B5199
                  02DA69B1063C163B9CFD428A05CC8F5BA323D6BC69FC61E35D4544705B4E9B8F
                  063B6DADFAD1FF00170EE42A8FED105B395F9578CFA9E29598731ECB91EB4D2E
                  AA092C001CF26BC9C786BC797717937178522037006ECE59B3D4919C1A745E03
                  F13DC28B7BDD597C9656C83233679FBA47E6DDFF000A760E667A68D4AC9A3320
                  BB83CB1D5B78E2A03AF692B2344DA95A8917AAF9C2BCEE0F85376BBC4BAAC4A7
                  AA3246723EBCD3EC7E18DB1BC9A3935EF31940DF1C280302DC65B9EF86A41767
                  692F8C7C3D1052FAADB60AEE1CE722A84BF123C330BE0DEBB0F5485B1FCAB253
                  E12E9AB1053A95E9C367202AF1E9D2AE2FC2ED000E1EF338C67CD1D7F2A0351D
                  27C50F0EAB611AE9CE71F2C06A9DCFC56D2E3E2DACAE66C8272DB540FC09ABD0
                  FC31F0E450EC6867933DDE76CFE845681F02F869A1584E916DB17FD9393F53DF
                  F1A63D4E464F8BF9C793A46411CEE9FBFE5551FE29EB52B30B7D2EDB00E0905D
                  981F4E473F857A747A369D08411D85B2ECE53110E3E9528B1B646056DE152393
                  FBB1D6803C91FC57E35BED863B59E219C1F2ADF1C7A723F5A73C3F1175053BBE
                  DA8920391B963CFE1C62BD840E39A5C7B50079E783743F15E9FAA7DA755B926D
                  4C7B5A179CB93E9EB822A6F8AB007F0D4126788EE3047D54FF008577B8F6AE4B
                  E22DAFDA3C1D3B9F9BC9923723D7E60A7F46A04CB7E08BA7BAF0769923672B17
                  97CFA212A3F90AE73C717DE2A83578E0D245CADA14DCA6DD012C472D93DAB77E
                  1E4663F03E9A08C1224EBFEFB565F8FEF3C4562F0CFA4B4AB682322568937156
                  27A9F6E94C2F64722DA678F754812375BE0B8C7EFA5DA0E7F1FE94F83E19788E
                  4399EEADE30FB99B1216F9B1818E3F1ADFF0F7C4E82544B7D6D3C99C706E107C
                  8DF51D8D77561ABE9FAA26EB1BC8A7180C446F9201F5145C1338CF0B7C3BB9D0
                  6EE3BB7D6255718F321B75DA920FEE9279C67D31581E0311DAFC44BB863930A4
                  4D185ECFB5B83FCF1FF02AF61C0C578F6896E2DFE2FC8830A91CF3E01EE18363
                  F9FE9481A67A96B1A70D5749B9B1673189936EF033B4E735E4BA8FC2BD6A3903
                  5ACB693A9CB60B1439FA6319AF6AED4CC0FAD0368F0397E1F78AACA4574B177D
                  A772B4328CA9EC41CD5DD37FE13FD3E64FB3C1AA15565CC520257DC1C8231EF5
                  ED1F6CB5373F6533C7F68C67CBDE3763D715CF78DBC492F8674B8A7B689249E6
                  976AEFFBA303273F952E564DBCCE9A36631A6FE1C81BABCB2C9C8F8BD34B2939
                  8E4940F64F2CF3F962BD03C3DABAEBBA0D9EA4A9B3CF8F2C9FDD6070CBFF007D
                  035C25FA1B0F8C1693B61629D863038F9936E73EED9FCE98DEC7A3D85FDB6A56
                  30DEDAC81E0997746C38C8AE164F8536B25C4B23EA73ED724ED58C03C9CF27DA
                  BD0218A386358E240A8A30AAA30147B54DC503DCF3BFF854BA617DCDA85E6300
                  6005EBEBD2AD47F0ABC3E80177BC91F3CB1987F857754940591C8C1F0DFC3700
                  19B26971DE4958FF00222AC0F01786C4CB28D2E3DEA49FBCDCFB75AE98714679
                  A2E2B2326DBC39A3D993E469B6C849CFFAB07F9D5F4B58633F2431AFA15502A7
                  241A381DE81D90DC75FA5721E21F154BE1EF1369D6F3247FD977119DF21EB1B6
                  719FA723F3AEC31EFD6B92F1F689FDB7E1F730C3E65CC0774631F311FC400FA7
                  F2A034398F1C78CAFD3593A669170D1C70AE6478796673D81F6AE56F3C55E299
                  F49F2E7B9B910A4BB4CDB5958B91F74B0E3B1AEE3E19E83259DA5D6A17D69E5C
                  D348A2159530C8807500F4073FA56D78EB44975CF0FF00916AA5A686512AA2F5
                  6E186073D79CFE149A62B3B9E7126B5F63BDB383C3DAC6A0CF310921B97C2076
                  1B471D3AB1E7AE4FB56C7813C3DE23D23C58935D5B4F05A14712B970438E7683
                  EBC9EB54B48F873ADCFAA4125DC4969044E92B1660DBB043600078E95EC4668D
                  4952CBB80C919E714EC2B93039147190055792EA08A069E5963489012CECC005
                  006793F4ACFD5BC49A56896D14F7B76AAB2FFAB2B972C319C803AD3B02923631
                  9A5C0FCEB0349F16E91AC492A59DD65E252EF1BA6D200EFCF6ABF69ABD95FE97
                  FDA3693ACD68519B7A1C8C2F5A452923409C527535E7979F15F4EB7204165713
                  82090DBC0A4D2FE215FEA835190690B1450C0ED03B39DAD20C6109C753B8501C
                  C8F45DC338A3AF4AF1FB9F89DAFC3A87D95B4EB7865F3163F25D58B67763D6BD
                  754960095C66804C90D72FE3E765F065FE08F982827FE06B5D39E95C3FC4FB8F
                  27C2BE56EC19E745FCB27F9E2806697805597C11A50720B345BB8F7626BA4600
                  839E7B5617836036FE0DD2118FCDF6643CFB8CFF005AC1F1878EA5D0EFA4D3ED
                  21469D50334921F94679C63E94C57B6E72FE23D121D47E232E99037D992E5806
                  2983D1093C76E47EB5977705CF8275B0B63AAC73EE4C99623CEDCB00AC33ED9F
                  CAA3B4D2BC43E30BC6D4EDD1C33B92D3E70324638F6AEB34DF84E19F7EAD7ECC
                  C4F2901C6F1CF563CE7A516158D9F03F8BAEBC4325C5BDD2A3B42370950633EC
                  7D2B93D28349F19A5D8BB825CCFBB83D30715EA1A3E83A7E856BF67D3EDD6253
                  8DCDD4B7D6BCD3C2AC24F8A771204650CD70D927DFBD20D4F5F638AF34F08F8A
                  66FF0084B751D26FE795C5C4CED6E642582956C6C03B0DA33FF01AF4A22BC7B5
                  FBA3E0EF88936A8B64B32CCBE620DC46770C361BF3FCE81B21F1CDDC9A57C458
                  2F7253CB6866539E028C06C0F4E0D76BF11AD3EDBE1095D42B790EB37FC07952
                  73FF0002AF29F17788CF8AB544B95B5FB32246218D4B6E2C324FA7BD49278A7C
                  45A968F1E885DA7840550123FDE301823247F938A5726FADCF43F855A909F44B
                  9D3D8FCF6B3165FF0071B91FAEEAA5F12A4FB0F88347D411D84B17CC3D00470D
                  93F5CFE1537C2BD1B52D323D4AE2FED64B68E768C4424E0E1436703D3E61F8E6
                  B57E24694350F0CBDCA90B35A37980E3A8E857F91FF80D31AD8EBE1956689244
                  3F23A8607DAA5AE57E1FEA4BA8F846D307E7B606DDC7A15E9FF8E915D50A0684
                  2715526D46CEDED5AEA6B9896DD7832171B7352DD7369360E1BCB6C7E55F3EE9
                  856F353D3F4D9EE592CDEE143EE72573DCE3B1FE1CFF00B54033DAB4EF1868BA
                  A5D7D9AD6EF329FBA1D4A6FF00F773D6A8EB9E3ED2343B96B5732DC5CA1DAEB1
                  01853EE4F02B0FE21E8DA4E9FE178E6B7B58ADE78A4510EC1C904E48E39ED5C4
                  699A2DC5F34379A66A964F78430920B8214A7047718618E87AE4F6EB40B53D1A
                  FF00E2469D068F6B7D6D0CB23DC3B22C2C7695DBF789EA0F51507863C7F75E21
                  D6D6CC69812DD90B09237DDB31CE5B23EEF41C7F7ABC7EE64932D6ACEDB22662
                  AA186327EF63B63815D8F8062D3EC758B5D4AF35AB780ED644B64243B16046D7
                  247033C81EB81DA9095CF42F1A78AE4F0D25B086D96596727EF9E001FD79AE6B
                  FE13ED6348D6D2DB5BB6B6303005FEC841280E70C39C3738CFD2A6F8B16D27D9
                  AC2F1492BB8C4500CFCC48231FAFE55C96A5E18BDF095EDADEEA36F15ED9E4B3
                  85058371C823A8E09A63EA74B67AF78ABC637F78BA45C456569071C81904F2B9
                  EB92707BF158FAAF8F35AFECF934AB92F05DC52959258D806E382AC3A6739E9D
                  8557D16EAEFC0FE279927B7B89612A46C562AA41FBAF9E84E33D47527D2A9EA3
                  A56BBAFBDCEBE34A9BC8B990BA8033C1C72AA4EE231DC639FAD17B0AC51B3F14
                  EAF657EB7515FCE651FF003D24254FD41E2A3D4358BAD4B52B9BCBB1203720B8
                  8C485369FBA3047F748E9ED56B4EF0A6ADAA8B2860D2A580CD21F32E64C85DBC
                  65883D3039F7CE0722BB9D27E1D0B1F13EFBB2971A4C36EC0194FF00AC66E0E5
                  7B6304E7B678A425138CD32E2F2E7C29AE2C923BDAC6D098C03C0977F07D86D0
                  473C1257BD54D2C1D6756B382EEE0A43830C1C92030070A06785CE0647AD7709
                  F0EEEEDB56D46DADA78174CBE82441BCF3BC90CA08F6207E02947C278CE9702B
                  EA4EB7C993238505091C803B8C631924E7AD3D476B1C1EA10DDE87A8988C53D8
                  4FE515746E4156186DBD8A11D3E95D4F857C530E9DE0AD6AC5A68E2B88C33DB8
                  66059CB83C7FB4C304FE2B57ACFC03677D2EDD5FC442EEFCC676245206080772
                  09C9C66B1C683E0B86E62B79BC4B34AC705D962CA93D396ED46A16B1C5EE3BD7
                  68632173C93D0D77DE16D534EF0F58DC5CCDAE8BD2E8CE9A5C485834A76FCCC5
                  8751B47A7D4D74977E16F03EE3653324135BC425902CC43B21E858F7E9C62B98
                  B0D4FC0767A92C71E9F772DB2A95371312E18F04165EBD01FAD1663D0A1E1DD7
                  34D5F14C9AD6BC642C58CA8634CA8949EA47A00DC7A62BDC6CEEA1BFB386EE06
                  DD1CD1AC88D8FE16E95E571EBDE01B6D4502688BB198E66640CABFF013F4AEAF
                  44F1FE97ACEB50E97690CE82443B19D40195192B8FA53B204D1D91E86BCC3E2A
                  5CA4F73A5E98B9F35C9239E32E42AFE3906BD389E2BC9261FF00090FC5D1193B
                  A1B260DC7FD32E49FF00BEE9147A95A402D6CA183242C51AA0C7B002BC9358F1
                  76933789277BDD12DAEA13295F34B624DABF28E7A7403F3AF4EF11DFAE9BE1CB
                  FBA240D90B0527FBC4607EB5E4DE02F0D597892F2F8DEAB7936C142A21DB82C0
                  E39EF8028259D9E89F10BC36D1FD94674F8A362B1A3A6D423EA2BAEB3D574FBD
                  DA6D6F2DE6C9C0092027F9D70EDF08F4CDB188F51BC47FE26E0EE3FD2B267F85
                  3AB5A956D3F5184956241F991FF31C503D4F5992558E36727E551935E59F0D2D
                  5AF3C4BAA6A92A7DD0C013D99DB711F95754EF7BE1FF00004C6FE7F3AF2281D4
                  3E7249276AF3DFA8ACDF857148346BD9DC604B73F2FAFCAA01FD41A05ADCF403
                  D2B1B58F0EE99AEA2ADFDB091971B5C70C06738DDE95B38A6B0C8F4A0B7A9CC8
                  F0C785B4447BA7D3AC624030D24C81B1F8B13CD63DC7C4BF0DD80F2EDA2B8946
                  EDA3C9842A923DF23F95735E33BDD43C47E2C8F45B60445E6186289861770CEE
                  63F867F4AEAB4AF867A1DA5AA0BE8DEF6E02FCF2C8ECAA7E8A0F02925733EBA1
                  3787FE22E91AE5DB5A90F693972B1ACA40120ED823BFB5759710C575049138DD
                  1C885580EE2BCB7C67E02B5D334E9352D2FCC444C19200D9D8A7BA93D0035D1F
                  C38D724D57416B59DE47B8B2711BBBF25948C83F9E57F0A6357D8C0F00DC1D03
                  C577FA14F85499CECC9E9228E38F753FA57AA738AF32F893A6CF617B67E24B10
                  DE742EA5C83DD7EE9FC7A1AEFF0049D4A0D5F4BB7BEB570D0CCB9047A8383FA8
                  2281ADCE6BC6FA06A7AC0827D3AEC4662465789E531AB67DC7D7F9573CDF0D6D
                  E3D18452EAB0A6A2CFB9D9CFC80607CBB73C723AD747F126465F09B246C177CE
                  8AC4F231D4E7F2AF1FD36F74C8AF259758B59EF211196108976967E0658FD375
                  2B833D0EDBC1F1A2DBCBE28F10C57165116F2E03361491938CF71D4E2A2D7341
                  F06EA7733DDDB6B10D988937CE96C0307073D07AF1D0573FE289AD26D0B489F4
                  FD32E2C2D95E4558A51C13C3647AF5C7E1ED54F58BFF00B7E8E5ADFC39069F1B
                  32B7DA628080D91FDE3C6339C2FB556A49BB6BA4780679E3D3ADAFEE67B9BC95
                  52372A7EF75C0E07A1C1208AD4BFF0BF863C17241ACDC2DEDC84942C3013BB2C
                  01604E7A8C01D7BFB9AE77E1FDF6AAFAD416B636568F6E1C9959E250EAA4124E
                  FF00BC4FF3E878AECBE2BC6CFE1885D47DDB9009F4F94FF85086896CFE22E81A
                  84AB15D4525BA302F1B4F18D840CFCD5043E38BCD775092CF48D03ED90443F79
                  23CC1475C0C6477AE67C597B637FE17F0D4366F1CD7CB0A2941F33AE514107D4
                  EE1FA1AE6B4BB310EA33A6A5A94FA4A4795670ACC770232854107FFD5484D9EF
                  17770D6BA2CD772420C90C0D2795F7C640C819C735E6A3C73AFC9A5CDAAC26CB
                  EC50DC88846701DBE5E8A3D31EBDB3E95DCE8B3D95FF0085BC8D32F9AF23485A
                  0129E58B6DEF9FA8FD2BCFBC1BE08B6D7C5D5D5FB5CC5145308FCA5C297207CC
                  5987A1E3F0A76190E9FE36D5B54D78B5D6BBFD976922127116F44C7451EE71F7
                  8FBD5183C5DAD3E91AE5BB5D4B3C0CA1BCF3C18CB49C9FA119AE8754F87CB3F8
                  D60B382DA48B467803B491FF0006011B727DC03F8D73BAB783F5DD1AE6E2CED2
                  1B9B8B3B8DB99614389403F2EE007073C91EB45BB06C4FE10B8D167D46DCEB5A
                  8EA7F6D793CA8D119962049C01B94E7F90AB7078A350F07D96A9E1DBB8E49648
                  DCADABC8C5B0A7392C7B820861EBDEA3F0CC3E2AD153FD0BC370CB217044B708
                  55F19FBA1B76001D338F7F4AEBBC61E08B8F13BD9DE5BB436D75B152E4392463
                  83907BE391EF459F50BDCF2DB559F4FB8B0B8937DA437C876CBB7A213B4B285F
                  C3FC2A58B4FB8B5D0AE4CBA6A5DD8CA508D422CFC9838CA3763D720D7A86BFF0
                  FA2D4AC74CB6B1B8FB3FD862F2412BBB2BEBF5CE7F3ACC3F0B6F90359C1AFCE9
                  A7C8E1E4876900B7F13601C6720726803CFBC49AB5BEADA8C7736F0B4412DD21
                  6566DC7E518C9381E82BA6D035AD02CFE1BDFE9B2DC2FF00684EB2FEED90E5A4
                  23E5C6070071FAD75B0FC2AD1A39ADA49249E4587978C9E253EA7DBDA8BEF85D
                  A2DE5EB4E92DC411B7DF862202F4C7071903E94ADE62B33C580DE42819DC7E50
                  06493E82BA1F0A437563E33D2CCD1C90C893A8642A77F2083FA1AF66B4F08687
                  A7DDC5776DA6C493C246C6E4E31C6EE4FDEC77AD46D3ED1AEC5DBC119B855C79
                  A546E0282AC88359D4D349D2AE2F1C83E5A9DABEADDAB86F85DA63BC97BAD4AE
                  AC65261561D490D973F9E3F5AAFF0013F5A967BAB6D0ADBE763B5DD5464990E4
                  2AFF009F5AEF3C39A3A685A15A69E9826241E637F798F2C68E817D43C49A37F6
                  F68935879C616720AB81DC1C8CFB554F0A785E2F0DD83C4A77CF34864924C7E4
                  BF80FEB5D1919A05055840314BD79A5A42463AD0163CF3E29EA620D2ADAC1012
                  F3BF9AC41E36A8FF00EBFE95D0F826C9B4FF000969D6EF8DFE5F984631CB12DF
                  8F5AF3EF13CEFE27F1E4367095682291214CF5600FEF063B8CE79F6AF608D022
                  AA8002A8C003B60628E825B925211918A5A42463AD033CA75671E1CF89F16A17
                  431693162F215C801D48CE3D54EDCFA835D85E78EBC39670890EA70CB91F2AC3
                  963F90E9F8D54F1CF872E35CB5B77B54592688B2EC66001071CE7F0AE674AF85
                  534CE64D66E8C630098A020927BE5BB7E03F1A094ECCA9E22F88F36A96F358E9
                  B6AD1DBCE7CB32B9CB9CF50147193C8EF8CF6ABBF0D344D5ECB559EF6E2D9EDE
                  D64876B798BB4BB12082077C60F5F5AEEB4EF0AE8DA6146B5B085645181211B9
                  FAFAD6CED03F2C50B40D6E55D42C62D46C2E2CEE0168A6428D8F718C8AF34F0C
                  6A737847C493F87F53982594AD98E473808E49C11ECD9FCEBD58E7D6B88F1EF8
                  4DB5BB55BDB38C7DBA05E98E645EC33EA0D00CC1F17F87BC557FAB5D792AF736
                  3236F8D04C7E40074032067A8AC9B4F01F89B4AD5526B6B689A40BBD1D590A29
                  EE08618079EC3F1AEC3C0BE2FF00ED68574DD424CDF463E466EB2007BFAB0033
                  C75AEE783D29A25ABEC79B3F83BC49E20D1CDA6BBA8408C2E3CE8CC63715E082
                  33E9C8C5769AC6890EAFA2CBA6B7C88CA046C467611D0FE95AC0018F618A5C51
                  71D8F2BB4F84D7115C46D26AA11411BDA052AC463B1CD7A0EADA3DA6B3A6BD8D
                  EAB491363A1E463BE7D78FD6B4F14878EF45C123811A37837C19776F717726DB
                  A1F342F2969186063700071C54D2DB782B5FB5BCD6BC88AE16124CD27CCACAD8
                  CF42473591E38D126BDF107DAACAF2DE79C227FA0C9CE4FB03C1070323BD705F
                  68961B6D52CE0B368259995A611C8DB63552415D9939F998727E9DA8BC8763D1
                  74FF00881E1DD260486CF49BAB7D38B90258E20101EBCF3C9C56C6B9E38D2B43
                  82D8DAC7F6D9AE47991C56E704A9CFCC71EA7B75AC36D574197E183471188225
                  BAC7E41701C4DC7F08EF9E775713A0DC4DA16B5A6EAF77137D8DDD991CC5C3A9
                  18723DD7AE7EB4ACC49D8F405F89422BDBAB3D4B4B92C6E2281E48964973BD80
                  DC14F1D4E300D5F87C6914DE0C9B5C687C874768843B8302F9C2807E9835CDF8
                  97C6B69AB4F269BA3E9D16A2D3C2CAD71E510E38382808CF15C2D89D4B535B6D
                  02DB7BA3DC6E54E8AAE4632DE80601FC3DE804EFB9E99A6FC4137DE11D4B5092
                  28E2D46D546D42786240C30CF5E739ADFF00056BB27883C3B15DDC95FB48768E
                  6C018660786F6C8C57916BDE12D57C38E8937EF21940559620769E7F31F8F6AE
                  8FE1E6B37DA3B7F65FF644D3C53DC73244A418DF001C93C6DC018A61747AFE71
                  DA8009A553950718C8E94B8A4506293B6053A93028189B700E6B23C47AC45A16
                  8D3DE48C15C29110FEF391C55EBEBEB6D36D64BABB95638D07249C67D85793CA
                  B7FF0012BC4CD1237D9B4DB55DAD8390A84FFE867F4A0342FF00803419F55D41
                  BC4FA98766DEC61DFF00C6E7AB8F4038C7E35EA416ABDA5BC76B6F1DBC31848A
                  250A8A3B01D07E156A814505145140C4E82B3F59BF1A668D79784FFAA8D881EF
                  D07EB5A24D7947C53F1190FF00D910BAF9718F36720F5E3A7E1C1A018CF861A6
                  B5EEAD73AC4A49FB39689723EFBB0CB1FC3FAD7AC818AC2F09690346F0EDADB3
                  2E252BBE5E73973CFF00F5BF0ADFA05142555BD5B96B2996CD912E4A111338CA
                  AB6382455AA43D2828E7F43D4AE048BA5EAD2DA0D5150B2A5BB121A2E007F6EB
                  FA8F5ADFC7D2B8CF16BB787F3AFD8C5199DE445B8790E4320046C03B6EE39F6C
                  D747A3EAD6FACE956FA85B92239941C31C953DD4FBD04234050453B348682AC2
                  77E8690AE47E14FA4340AC79C78B7C0E58C9AC68CCD0DDA132C91C7C1739CE57
                  D083923D6B4BC21E348B5948ECAF9922D4557BF025C6391EFCF22BB32323DBD3
                  D6B84F16F8196FCFF686931AC57CA77145F943FBFB1E282763BC073D314A2BCE
                  7C35E3C36F2FF65F8949B7BA43B5677180DECD8E95E8514B1CD1AC9132BA38C8
                  23906829324EF4871E94A28340CE43C51E05B2F12DC25C99A4B69C70EE801DC3
                  A73F4A7E87E06D2B468A65F28DCC93A84792600FCA3B01FC39CE7F0AEAB1818E
                  B4B8E69DC938B4F869E1D4BD1746DA4628FBF6193E56FA8AE92EB47B0BEB65B7
                  BAB2825853EE23460803D876ABE573F8D380345C2C64E9FE1FD2F4B7792CACA1
                  85DCE4955E738C1EB56A0B1B4B5C182DA38C818055003F9D5BEBE946DCD171D8
                  8CA2B2E0AE40ED8A72C61470303D00C0CD3C0C52D21D9094B49D68EDC50018E2
                  AA5EDF5BE9D672DDDCC8238614DCCC7B0A8F54D5ECF47B36B9BE9D638C74C1E5
                  8FA01DEBCA750D4356F88DAB2D9E9D13C3611724B0F9132792DEA71D05026EC1
                  ACEA57FF0010B5F834ED2E278ED222412E3E551DDDC7AFA0FF00135E9FA0E856
                  9E1ED352C6CE33B472F2372F237F798F7269BA068169E1ED392D2D972C466594
                  8F9A46F526B63D281217A5145141414514139140CCAD7B588B43D226BE970C10
                  61549C6E6EC2BCA3C1BA20F14F88E6BCD403CD0C67CC9370E1893951F5CE4D5B
                  F1D6B5278875E8748D3B7C888FE50DBD1A427049FA57A3F86F438741D1E0B38C
                  2F980032BA8C191FB9A08DDD8D80318E318F4A7527A52D22C5A422968C500432
                  C31CF1949635753D9C64647B57975BDDDC7C3FF13DDC5749249A55E307474E04
                  6371C1E4760707E99AF5622B1FC41A241AEE9725A4C143F58998642B763F4A09
                  68D28678E789258DC346E372B03D454D5E61E0ED6E6F0EEA6DE19D653C92F266
                  DDC9CFCCC7014FA03D47A723D2BD3430F5A609DC5A5A28A062114847069D4501
                  6398F137842CFC47065879376A3E4980F4ECDEB5C0C57FE24F87F782DE6845CE
                  9FB8E2324ED607A1563C29E9D6BD90F4AAD756705E42D0DCC093444E4A48BB81
                  FC0D04D8C3D07C6BA46BA912A4E20BA719F225383F87AD7461B3D0E6B87D63E1
                  9E93781A5B02D673E72028DC99FA76AC571E35F0823CAD225FD8A3743F38EFF3
                  7AAD02BB3D505048F5AF39D37E2BD948E1350B29A0278DD17CCA3F0EB5D5D8F8
                  AB45D4638E48352B721C6406902B0F620D055CDBA5A606046EC839F7A0382D80
                  C323B5003B14B4DDC319CD579EFAD6DD37CB73146BEACE0500593466B9BBEF1B
                  E8360997BF8E53FDD83F787F4AE5B50F8A7E6B98743B179A4C100CC18927B7CA
                  BCFEB40B98F4A7956342CEC1547524E05717E24F88363A5C422D38ADF5CB2E72
                  AD94503B923AD7310681E2DF164CB36A8EF6F6CCC495B81B47E083B7B1AECFC3
                  FE03D274068A5447B9B98D76ACD39C95E73F28EDFE79A049B390B1F05EBBE2AB
                  E4D47C453C91407E6F2C9F9CFF00B207F08AF4DB1D3AD74DB55B6B3B748615E8
                  A831F9D5C0A14000718C0C52E3A5055808A5A28A06145145001D8D715E39F167
                  F61590B6B4913ED9329C9CF312E386FAD6AF8A3C4D6BE1BB1DEE0497127FAA87
                  3CB1F7F6AF3FF09E8F3F8C3599B57D554CB648C465810B337603D40FEB409BD4
                  DEF873E1E36F66DAD5DA37DAAE79883725533D7EAC73F862BD040C5323411A2A
                  28C2A80A0638000A9290D201C52D25140C2968A4A062D348F4A7521A04626B7E
                  1CB1D6AD6459ED6379F6111C8C3041EA324738E99AE57C3FE2C9B47BA5D075E5
                  6468A4F262BB0E5D49ECAC4F3F8D7A2D73FE25F0DDAEBF60D1CB1E274F9A2917
                  860476CFA504B563741FE74FAF24D0BC677FE1CD40693AF2CB35BA1F2D652A4B
                  C647739FBC0FBF35EA367776F7B6F1DC5B4AB2C52A875753C30F5A6172D628A2
                  8A0614514503138A4650CB823208C60D2E29714058C6D43C35A3EA8ACB77A7C2
                  E48C160BB4FE62B9ABDF859A2DC10609EE6DFF00BC03EF07F3AEF71462826C79
                  84DF0C7538B7FD8FC412803042B061B88F5C1EBD2AA9F86BE23D923FF6CC61E5
                  C798A247C1F5CFF7BF2AF59C518A42B1E591FC31D65AD951F5D58F03FD5A6FDB
                  9FCC7F2A920F844AC83ED7AB3120F58E1193F8935E9F8A314058E2ED7E18F87E
                  DD41952E2E1C2905A494F35D35869563A6C4B1D9D9C302A8C2EC4038ABF8A314
                  0F94680074FC29D8A4A5A6505145148028A299BD77150C370EA33934C438F4AC
                  7D7BC4365E1FB3FB45D372C088917EF39F41E950F88BC55A7F87ADDCCF3235C1
                  5CC76E1BE663FD0579CD9695ACF8F7531A85DC863B3C9476CF08BFDD41FD6813
                  63748D36FF00C79E2596F6F8B2D9A365CA1E14672231FA73E95EBD6967058DBC
                  76F6D12C5120C2AA8E95169BA65AE9363159D9C42382300281DFDCD5EA4090B4
                  94514142D14514005145140C28A28A04262908A751401CEF88FC2B65E22B6225
                  063B8006C994E08F63ED5E6F18D77C05AA3482169206C210C4F9520CE7E5F43C
                  E2BDA48AAF736B15DC4D14F1AC91B0C15619FC69912463E87E2DD275E422DAE0
                  2CD9F9A097E5707E87AFE15BF9E6BCB35BF8633ADC9B9D1AE1463958DD8A95E7
                  B1A4D3FC79ABE8920B0D7AD5A7302E6697A4AA338CE3A37AE7AD1A873773D572
                  28ACAD2B5ED375A04D8DD24A530594020AE7B1FC8D6B50CB4252D2514802968A
                  280128A28A005A28A2800A28A280129693345300A334D6608A4B1C01C935C6EB
                  9F10F4BD1EEFECD1A9BB94292ED1380A9EC5BD695C57EE764CEA9197760AA064
                  927000AF37F13FC495B677B7D19A29988DA6620E14FB6783DFB563DC6ADE28F1
                  C4E2DEC627B7B173918CA809D8B3F7FA0F7AEBFC2FE00B2D065FB5CE45D5EE3E
                  5765F962F50BDFF134C96EFB1CCF86BC117DAD5E1D4FC43E624664DC217C6E9F
                  BFCDFECF6C57A9C16F15BC4B1431AC71A8C2AA8C6054A063A740318A5EF48A48
                  31452D25030E9475A5A2800A4A5A2800A28A2818514525002D145140094B4525
                  002119AC9D5340D3F5753F69814C854A8940C38183D0FE35AF463DFF004A7726
                  C8F2CD63E1BDE5BB9B8D16EE40E00E37947C73D08E3FFD75059F8EFC43E1F95A
                  DB5FB269C29C2B15D8D8FAF43F8D7ACF151490C732ED923571E8CB914C977471
                  FA7FC4DD0AE9545C99ED24EEB2464A8FC4574961AE697A96D3677F6D333F4092
                  024E3DAB0753F87BA36A04C9144D6B26771F2FEE93E856B9A97E176A0B7A2E6D
                  75182370C4AB6C60541CFD7FCFA74A9B07333D577519AF2E7D1FC79A5844B4BE
                  9674CE3E594305FC1A88BC4BE36D33115E696F7009382F0FCDD7D53E5EF4598F
                  99753D437668DD9AF3393E25EA3001F69D11E37E72B93B71F5C54727C54B8467
                  09A6ABAECC861231DA700E0E3A8E4F2314B50E647A9645266BC9E3F8A3AA98C2
                  FF0063A19B001C6E273F41DAAB5878DFC55F6FBA94DBBDDA306F2ED96DC8F2CF
                  1B4E7AF18236F539CD349B1F323D87349B857965B6BBE3AB8423FB3673962439
                  8768C718C6791C67FF00D740F0B78CF569239AFAF5214272D1BCCD8FA6D5FF00
                  3ED4598B9BB1E857DAD69BA723B5D5E428CBC32EE05BF2AE3353F8A16D196874
                  CB5796423F7723F0B9F751CE2A4B6F85D646F3ED37F7B35C1272D12FCAA4FD7A
                  D759A6787B4BD2540B2B18E361FC7B72DF893CD160BB679D3E9FE35F18A8374D
                  F64B37FE07CA2E3FDD1C9FC6B5B48F85B656B32CFA94E6ECAB67CA55C27E3DCD
                  7A16314EE298944AD6F6715B02224080E3800700559C514527A949242D149450
                  3168A292818B45145001483AD2D1401FFFD9}
                mmHeight = 24606
                mmLeft = 152929
                mmTop = 18786
                mmWidth = 26458
                BandType = 7
              end
              object pplotraforpag02: TppLabel
                UserName = 'lotraforpag02'
                Caption = 'LIQUIDADO POR:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3175
                mmLeft = 29369
                mmTop = 35455
                mmWidth = 24871
                BandType = 7
              end
              object pplliquidadopor: TppLabel
                UserName = 'lliquidadopor'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3175
                mmLeft = 18256
                mmTop = 39159
                mmWidth = 45773
                BandType = 7
              end
              object pplotraforpag01: TppLine
                UserName = 'lotraforpag01'
                Weight = 0.750000000000000000
                mmHeight = 265
                mmLeft = 19050
                mmTop = 34926
                mmWidth = 45773
                BandType = 7
              end
              object pplotraforpag05: TppLabel
                UserName = 'lotraforpag05'
                Caption = 'SECTORISTA PREVISIONAL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3175
                mmLeft = 83608
                mmTop = 35455
                mmWidth = 37571
                BandType = 7
              end
              object pplotraforpag04: TppLine
                UserName = 'lotraforpag04'
                Weight = 0.750000000000000000
                mmHeight = 265
                mmLeft = 79640
                mmTop = 34926
                mmWidth = 45773
                BandType = 7
              end
              object pplotraforpag08: TppLabel
                UserName = 'lotraforpag08'
                Caption = 'JEFE DE PREVISION SOCIAL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3175
                mmLeft = 143404
                mmTop = 35455
                mmWidth = 45773
                BandType = 7
              end
              object pplotraforpag07: TppLine
                UserName = 'lotraforpag07'
                Weight = 0.750000000000000000
                mmHeight = 265
                mmLeft = 143404
                mmTop = 34926
                mmWidth = 45773
                BandType = 7
              end
            end
            object pprregcheger: TppRegion
              UserName = 'rregcheger'
              Visible = False
              mmHeight = 41539
              mmLeft = 12700
              mmTop = 5822
              mmWidth = 181240
              BandType = 7
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              object pplchegen01: TppImage
                UserName = 'lchegen01'
                MaintainAspectRatio = False
                Stretch = True
                Picture.Data = {
                  0A544A504547496D61676543640000FFD8FFE000104A46494600010101012C01
                  2C0000FFE110784578696600004D4D002A000000080003876900040000000100
                  00083E9C9E0001000000120000105EEA1C00070000080C00000032000000001C
                  EA00000008000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000001EA1C00070000080C00000850000000001CEA00
                  0000080000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000530065006C006C006F002000560042000000FFE10C
                  70687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F003C3F
                  787061636B657420626567696E3D27EFBBBF272069643D2757354D304D704365
                  6869487A7265537A4E54637A6B633964273F3E0D0A3C783A786D706D65746120
                  786D6C6E733A783D2261646F62653A6E733A6D6574612F223E3C7264663A5244
                  4620786D6C6E733A7264663D22687474703A2F2F7777772E77332E6F72672F31
                  3939392F30322F32322D7264662D73796E7461782D6E7323223E3C7264663A44
                  65736372697074696F6E207264663A61626F75743D22757569643A6661663562
                  6464352D626133642D313164612D616433312D64333364373531383266316222
                  20786D6C6E733A64633D22687474703A2F2F7075726C2E6F72672F64632F656C
                  656D656E74732F312E312F222F3E3C7264663A4465736372697074696F6E2072
                  64663A61626F75743D22757569643A66616635626464352D626133642D313164
                  612D616433312D6433336437353138326631622220786D6C6E733A4D6963726F
                  736F667450686F746F3D22687474703A2F2F6E732E6D6963726F736F66742E63
                  6F6D2F70686F746F2F312E302F222F3E3C7264663A4465736372697074696F6E
                  207264663A61626F75743D22757569643A66616635626464352D626133642D31
                  3164612D616433312D6433336437353138326631622220786D6C6E733A4D6963
                  726F736F667450686F746F3D22687474703A2F2F6E732E6D6963726F736F6674
                  2E636F6D2F70686F746F2F312E302F223E3C4D6963726F736F667450686F746F
                  3A4461746541637175697265643E323031352D30382D31345431343A32313A31
                  312E3236373C2F4D6963726F736F667450686F746F3A44617465416371756972
                  65643E3C4D6963726F736F667450686F746F3A4C6173744B6579776F7264584D
                  503E3C7264663A42616720786D6C6E733A7264663D22687474703A2F2F777777
                  2E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E73
                  23223E3C7264663A6C693E53656C6C6F2056423C2F7264663A6C693E3C2F7264
                  663A4261673E0D0A0909093C2F4D6963726F736F667450686F746F3A4C617374
                  4B6579776F7264584D503E3C2F7264663A4465736372697074696F6E3E3C7264
                  663A4465736372697074696F6E207264663A61626F75743D22757569643A6661
                  6635626464352D626133642D313164612D616433312D64333364373531383266
                  31622220786D6C6E733A64633D22687474703A2F2F7075726C2E6F72672F6463
                  2F656C656D656E74732F312E312F223E3C64633A7375626A6563743E3C726466
                  3A42616720786D6C6E733A7264663D22687474703A2F2F7777772E77332E6F72
                  672F313939392F30322F32322D7264662D73796E7461782D6E7323223E3C7264
                  663A6C693E53656C6C6F2056423C2F7264663A6C693E3C2F7264663A4261673E
                  0D0A0909093C2F64633A7375626A6563743E3C2F7264663A4465736372697074
                  696F6E3E3C2F7264663A5244463E3C2F783A786D706D6574613E0D0A20202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  0A20202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  20202020200A2020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  202020202020202020200A202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020200A20202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  20202020202020202020202020202020202020200A2020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  202020202020202020202020202020202020202020202020200A202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020200A20
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020200A20202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  20202020202020200A2020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  202020202020202020202020200A202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020200A20202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  20202020202020202020202020202020202020202020200A2020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  202020202020202020202020202020202020202020202020202020200A202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  200A202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020200A20202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  20202020202020202020200A2020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  202020202020202020202020202020200A202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020200A20202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  20202020202020202020202020202020202020202020202020200A2020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  202020202020202020202020202020202020202020202020202020202020200A
                  202020202020202020202020202020202020202020202020202020203C3F7870
                  61636B657420656E643D2777273F3EFFDB004300080606070605080707070909
                  080A0C140D0C0B0B0C1912130F141D1A1F1E1D1A1C1C20242E2720222C231C1C
                  2837292C30313434341F27393D38323C2E333432FFDB0043010909090C0B0C18
                  0D0D1832211C2132323232323232323232323232323232323232323232323232
                  32323232323232323232323232323232323232323232323232FFC00011080120
                  012003012200021101031101FFC4001F00000105010101010101000000000000
                  00000102030405060708090A0BFFC400B5100002010303020403050504040000
                  017D01020300041105122131410613516107227114328191A1082342B1C11552
                  D1F02433627282090A161718191A25262728292A3435363738393A4344454647
                  48494A535455565758595A636465666768696A737475767778797A8384858687
                  88898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3
                  C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6
                  F7F8F9FAFFC4001F010003010101010101010101000000000000010203040506
                  0708090A0BFFC400B51100020102040403040705040400010277000102031104
                  052131061241510761711322328108144291A1B1C109233352F0156272D10A16
                  2434E125F11718191A262728292A35363738393A434445464748494A53545556
                  5758595A636465666768696A737475767778797A82838485868788898A929394
                  95969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9
                  CAD2D3D4D5D6D7D8D9DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C
                  03010002110311003F00F7FA28A2800A28A2800A28A2800A28A2800A293239E7
                  A552BFD52CB4C80CD797090A0EEC7AFE1401773514F7305B46649E6489075676
                  0A3F335E65AE7C51690B5BE890B0249026950B16F70A39AC4B1F0AF8ABC50CB7
                  57334D144C48335E96DD9EBC267A671E9D296A4B91DEDF7C44D0AC9C08E67B91
                  83B8C4BD31F5C67F0AE75FE2C493CC62B2D277B9E5232DB99BDF8FE5FAD68E97
                  F0AF4BB6447D4679EF6653CE0EC423D3039C7E35D6E9FA169BA5E3EC5630407F
                  BC89F373EFD4FE34EC2BC8E01B54F1FEB01BC8B192CC0048CA88B1F8B649A83F
                  E114F1C6A53C73DCDF084E72435DB6411C13F28F61FA5777E2DD5E5D07C3F35F
                  4088D229545DFF007573C6715CFF0081BC7337882F67D3F5058D6EA35F323641
                  80EB9C11F51C1A5642D4C287E1AEB77B19377AD44B2A90B8C33E083EF8ED8A0F
                  C26D40DC81FDAD07920E449E536F1EBC6EAF4BD53528F4CD3AEAF65C058232DC
                  FF0011C703F302BCB7C23E36D5EF7C63656F7F7CF24170CD1B45B400095E3F51
                  4F41FCCBB37C2FD594A8B7D66374501417465C0E07A9EDFE7BD46BE05F16D960
                  DB6AC09546E16775CE0F03F11CFB57ACE4015C4F8EFC5AFA15BC56963222DF4A
                  7793B4308D077C1E327D2934876312D747F885A55A178F5113EDC318A49BCD7C
                  67A0DC0E3D300D325F1D78B748891B55D12331B2E43BA14E4FB8247E18CD74DE
                  01F125C788F489A5BA2AD3C12F96CEA9B41180471D3BD754F12C8A55C654F623
                  23F5A1242F43CFB4BF8B3613AEDD4AD1EDA51D5A23E60FE86BB1B0F11E93A9C1
                  E75A5F432AF71BB047B62A95EF83B42BE88C72E9D00F999C346363293D4F1DEB
                  90D57E16AC6E25D2AFCA16627CA9DB8F6C11CD3B798B99ADCF500C38E7AD3B35
                  E4169A978CBC1A5BFB42D64BBB152048C58CBEF90DDB8EDD2BB0D27E21E83AA2
                  A86B836B211F72E38FD47143D0A52475F45315D5D432B6E53C820E734FA0A0A2
                  8A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A33400669AC4004
                  9358DAE78974ED062CDD499988CAC49CB1AE2FED9E26F1DC6CFA73C7A7695E61
                  4F30B9CCA338E08193DFDA9584E4916FC41F108C576DA76850BDD5D02577C6BE
                  673E8A3BFD6B3F4BF026ABAF8FB67892F2EA12D2730160CEC318E4F200CFF08F
                  4ED5DEE93A169FA3C091D9DAC71B2AAA34810067C0C658F7AD51814D682D5991
                  A5787349D1D5459584313018DFB72DF893CD6B818A5A29DC120E9452D148672F
                  E3C289E0CD419E312615768233824800FEB5E1BA5EA12E91AB5B6A501FDE5BBE
                  E000FBC3A11F8D7B9F8F63F3BC15A8AEEC7C8873FF0003535E45A0786535ED1F
                  589D25617562A8638C1EA0E59B3EF81FA51622477DE39D7A1BCF00457368098F
                  50D9B371C103EF11F5C800E7DEBCC7C31726D3C59A54DB72A2EA3E4FF77904F1
                  F5AAAAD797B1DAD82CD3796B204811989442CD8F97F135B3E33D222F0C6BB145
                  66F2910C292EF7E7738E491F95249B13699EFB34F1DB5BC93CCE1638D4BB31EC
                  0578969B02F8F7C7D7125E4F2456CC8F30556C315042AA2FA1C107F035BDF12F
                  C4D245636FA4C1279666884D74C3B29E8A7F53F9562693F0DB5BBFD3E3BE1710
                  DA975DD1C4ECD92A7D71D29D98E4CB7F0FF531A2F8C6EB4557596D2E6568D5D4
                  8015D7255871C8238FCABD94B2842C48000CE735F39DEE9DA978375CB57BA555
                  9EDDD2E1761DC0807279C7D457B0F8C35B10F81E7BCB59306EA3558CF5243E33
                  F9293F951EA117A1C77887C75AA6AFAAAE97E1C320467DA8D08FDE4A7D73D877
                  CD501E16F1D6993AEA514D2CB3C658EE173BD88190490C70D9F41EB5ABF0874C
                  0CBA8EACE4162CB6C831F742E59B1E9F780FC2BBBBFF0013E8BA65F0B1BCBD48
                  6E76EE2AC0F00F3C9028B24B50B37A9C7F81FC7175AB6A2DA3EB00493BA9F29F
                  60192012CA7DFB7E0735A5E29F87B67AB234FA6470DA5EB1CB10308FF503BD54
                  97C2535CFC40B4F1058CB6F2581904AEC8E090769C8F7F6C7AD761ADEB16DA16
                  932DFDD13B1000A8A705DBB0146C3B268F2982EBC57F0F92149551ECE7C158E4
                  7DCB9C0CA0E855BF4AF45F0FF8D349F1011143234575804C320DA73EC7BD47E1
                  8D6A3F18E88F35DD822012344D1B10EA78EC7D31FAD733E29F875224CDA86804
                  A4ABC9B756DA41F543FD286AFB0AEE3E68F51C8F5A2BCCBC27F10584C74CF10B
                  F972A9C25CC8A579C0F95C763C9E6BD25245911595832919041C834B6DCB4EE4
                  94519A298C28A28A0028A28A0028A28A0028A2909E0D001915C7F8D3C670F872
                  0FB340435FCA84AE7A463FBCD4BE32F18C5E1FB66B7B6656BF6FBAA79083D4FF
                  0085727E08F0AB6BB76FAF6B225922F34342920FF5CC39F31BD876EC6A512E56
                  645E1CF0BEA7E2F9D755D76698D8339758DFEFCDDBF01FD31DABD46583EC7A54
                  915842A8D1C4C208D4606E00E3F5A6D96ABA6DF4F35BD9DE413C901024489C36
                  C3E9ED5A0483557EC249753C274BF1E6B3A5EA2669AE64BB8D8FEF6191B218FA
                  A9ED5EABE1BF1869BE25801B67315C0FBD6F27DEFA8F51F4AF28B67B3F0FFC44
                  997538E37B259A68E5DF16E015810AC07E43E9543519ADA2F104AFE1992E044A
                  E1EDC229DEBEA5475DB9CF5E71536B31733EA7D100D2D796F853E25B3CD169DA
                  E2FCCC76ADD8F5E8038F5F522BD3D581E41E2A8A4C7D07A526690918A5743286
                  B1A72EAFA45DE9EEE556E2368CB0ED9E95CF782FC1EDE195BE79E64966BA7507
                  68E0228207F3ADFD475CD334B4CDF5F4107B33F24FD2B99BBF8A1A0C591079F7
                  0C3B2A607E669A90AC167F0E6C2D7C4A75749A431090CB1DBED1B439F53D5802
                  3A56CEAFE16D2B5DBAB7B9BFB7323DBFDDF9F83FEF7AD71F27C5A324816CF449
                  A556FBBB9F25BF000D44DF153505E0F875D5B3D0BB8F97FEF9F734EEFA12F951
                  D4EA9E05D1F59D71755BB1399832128B26158AF4C8F4C76AE980C003000ED8AF
                  35FF0085B2D1C8A6E3419A38B1C93291F90DB8ABF67F15F479D88B9B7BAB7520
                  15254386FC052BBEA3B2EE4DE3EF085DF88C5A4F61E51B984953BD8A8DA4E41E
                  3AD68DFF0086FCEF020D1061A582D95636EA0BA0C8EBEA47EB5674EF18E83A9B
                  05B6D4E1DE780927C849F4C1ADB122C8859082BEA0E453B89A3C67C0BE2A8BC2
                  D7B73A76A68E904F2AFCF8E629318C30F4E9935A3E3FB7F0EDE58C9AC5A6A30B
                  5FB320C432EEF3003CF4E9D8E7DABB0F1278234DF11665915A0BBC604D18C7E6
                  3BD7176FF08EF048A2E3558C44B91FBB8B2D472DC1DED62C7C2459A28356BC76
                  096036A73D03AEE271F4047E9595E31D7E5F16788A0D1F4B71716C87645B7859
                  A5C64B67DB1FFA15753E254B7F067C3E3A75A619E7C40ACE39727EFB1F7C03FA
                  5637C2BD11A4BAB8D6A4561145FB980F186FEF363D3A0FCE862B9E8BA36996DE
                  1FD121B488A2C50479773C64E39626B94BDF8ADA4DADD9861B59EE2356DA6418
                  5DDF407AD6B78B3FE273E0BBE1A64C27DCA1BF74C0EE504123F215C6FC36B7D1
                  755B3BFB1BFB3825BADC186FF98BC78C6467A1CE7F4A92969B1ADAAE99A378FE
                  C9AF349B848F53893A38DA48F4917AF5EF5CE787FC5FABF856FE3D33578E56B2
                  4CA18D97E641BBAA93D40E401D0F1549A26F067C47B78E2B82D1433C6ACD9C13
                  14800DA7FEFAFCD6BD5BC45E17B2F11D988EE014B84CF93301F329FEBCD3B5F7
                  16CF4362CEEE1BDB58AE6DE45961957723AF423D6AD578E683ADDFF8135A6D1F
                  56576B277072C73B33FC6BE83D6BD7E39124457560548CA907AD1B6E5A7724A2
                  8A2818514514005145140066B9EF1678921F0EE94D202AD77202B0467B9F5FA0
                  AD5BEBE834DB29AF2E1B6C512EF73DFF000AF1A985EF8F7C5B1463CC8EDD9B6C
                  8554B082319EE38048E9EF412DD897C21E1EB9F16EAE754D458C9648F9695B3F
                  BF7CE4A8F61D0FBF15EB5A958BDCE8F73676D2181DE1648D947DC24718AE6751
                  F14E8FE0B4B7D1E080B0895159232008D4F73EA48E7F1ADBD23C59A3EB6AA2CE
                  FA3694FF00CB263B5FF23CD1A2D094783D9DFDEE85ACFDA6176B79E2936C8376
                  791FC247715EE1E15F1559F89EC449132A5CC6313424F2BEE3D56BCE7E27787D
                  EC35AFED48500B7BCE5DBD241D78F71FD6B0B4FB4D6742B2B1F13583FEE24DC1
                  5D3E60B8620AC831DF9FA52B5B6127DCD8F89FA69B5F12FDA32596E63128E318
                  EA31EFD17F3AF44F07F8774AD274AB6B9B34124D3C28CF72DCB4808C8E7A77AE
                  626807C4FD22DAEA075B3BFB297CA99645DC002324F1FA57A2697629A66976B6
                  51BB3A5B42B12B3770001CFE54D0ED7662EA7E04D0356BB5BAB8B4DB26417F24
                  EC121FF6B1D6BA2262822258AA468392C7181D2B275FF1369DE1CB612DE4B990
                  8F9225E5DCFF008579FCADE26F8898F2E3163A433020B64023D71D5CD0DDC774
                  8EA759F88BA3E9ABE5DA937D72490A911E33FEF1E2B9898F8E7C5FB99636B3B1
                  63F2A13E4F7FFBE8F4EF5DA681E0BD1F4055686DC4D7400DD7330DCC4FB761F8
                  62BA30A07E1C74A2C2D59E6BA67C2787CD59B57BE7B8723E68E205467DDBA9FD
                  2BA8B6F03F872D23089A4DBB638CC8379FD735D20A4C63934EE1C88AF6F6505A
                  C6B1DBC291228C05450054DB10F247278A7D2138ED45D8D45113C08E0028A7D3
                  22B2EEBC2DA2DD97F3B4BB572E7258440127D735B201239A5F6A7762714CE1F5
                  1F863E1FBC05ADE192CDF8FF0052D90707AE0E6B0DFC09E25D0E6F3745D65E64
                  50C423B3291C71C1C83FA57A985A42BCD20B34793C3E3BF12787E65875CD38BC
                  4C060BA794DC75C11F7BF1AED7C39E2FD33C49137D9DDA1B84FBF6F2E032FB8C
                  7DE1C7515BB736B05DC2F05C449244C30CAE320D79B6B7F0CA64BE6BBF0FCAB0
                  8186489988DADCE769F4E9D680BF73BCD6B43B1D7ACFEC97F1178B258618A953
                  8C718FAD64789AC8E95E01BBB3D282DBC36F0055009F96307E623BE704F35C86
                  8DF10F53D12EC693E22B77731B6D7949C48809EADD88F4C735E9F6D716BA9D8A
                  CF6F2473DBCCB90C39073EB40FD0F39F851731FD9B54D3A597E6F303A465BA2E
                  369233EF5CEF8BB499BC17E2882F74A984513169EDCF38523EF29F51FD18D747
                  E21F87F7B637A354F0D48C8EBF30855F0C0E73F29E847B1AE73FB07C59E2BBD8
                  ADF5386E435AA05592E46D55F7FF0068E0734ADA5847A358693A3F8A1F4BF144
                  B67FE9451655E4E37818191DF0718FA569F89B589341D125BE8A0133290A431C
                  28CF76F6FF001AB7A4D847A5E956D62872B046101E99C753597E31D66C34AD02
                  E96F1E32F342CB144C325CE3038F4CE39A6F40E86624BA4FC45F0D3ED012ED54
                  2BEE5CB42E4640E7B1AE57C35E28BFF096AA746D6C91668C5189EB01CF0C0F74
                  C75F4E3E95C9681AD5E685AA8D4AC9649220E12655C8128FEE67A67D2BD17C53
                  6765E31F0C26B9A4C5E6DCC6BF3AA8F9B68192AC07248CF1E84E696FB8AFD8F4
                  7475650E1815600820FAD495E67F0D7C54F76BFD877526E785336D213CB28E36
                  7BED18E7D2BD2F34169A62D1482968282909183CD2D739E31D73FB0741927424
                  5C4A7CA840FEF11C9FC064D026CE17E206B573AB6B29A1E9E7CC45755DA983E6
                  4A4E31CFA703F3AEFF00C39E1FB5F0FE98B6D002F239DD2CACA373B7BFF2AE1B
                  E19E846F2F66F10DCB3C9B1DA383CCE72DDDBF0E9F5CD7AAEE51DFF0A1684AD5
                  DCF3FF001FF8365D623FED2D3D73771A6248F1CCCA3A7E38CFE95E3C567826C6
                  5A1915B1DD483E95F501C115C0F8DFC089ADEFD4AC404BE51F3C7B7E5980E47D
                  1BDFBD1626499E69AA5FF891B48B7B5D55EE25B17DB3C0655CEE014853BBD0E7
                  38F6AEA7E18EA1F6892EBC3F76826B2B88D9C239C8046370C7BE7350F813C42F
                  0DE47E1AD4E2FB45ACB2948E39577185C64E08F43E9D8035E95A5F85B47D22F5
                  AF2C6C5219D976965C9C0E3200E8A381D00A6B6122CE8FA269FA1C1245616E21
                  591CBBFCC58B374EA79E2B17C5DE36B6F0FA1B5B60B71A9C836A420E7613D370
                  FE9D6AB78EFC5C346B5FECEB362DA8DC2E3F7632D103DFEA7B0A83C17E085D38
                  26A7AA47E66A2E4BAAB124459CF3CFF11C8CD1B97B6C51D17C0D79AD5E0D63C5
                  33C92990E56D49E587A3FB7A2D7A4450A451AC688151400140C014F031D071DA
                  9C2804BB89D28A5C5140C0521A5A28013146326968A00292968C5031334B4521
                  3484068C0C5377A9E334D69511955DD01638033D698191ADF8674BD76161796A
                  865C616603E7538E307BD79B4536B1F0DF5868E557BAD3266CFDF2038FEF03D9
                  FDABD8430604E47155AFAC2D752B47B6BC852585C72AC3A7D3D2825F915B47D7
                  2C75DB21736328707865EEA7D1AB480041C0CD7925DE8BA97C3BD522D4ECE596
                  EB4C2713A6EC6E078C38F5C1E2BD334AD52D357B08AF2CE40F149D33D41EE08E
                  C7DA80462F8CBC570F876C5A38DB7DFCC87CB5047C9C7DF3E98F4EF5E71A3E89
                  AC7C41D5E4BFD426912D9080F3B26030CF08807EA6BB9F107C3D875FF108D466
                  BE956091544B10EBC0E02B76CD761696B059DB476F046B1431285445E1547A0A
                  61AB338F86F4BFEC43A47D8905991B7CB031D075CFAFBFE14DF0EF86AD7C396B
                  3DBDABC8E934A6460E7B918C7E95A37FA9D9E97079D7B711DBC59C0676C67F0A
                  F38D77E2AE59E1D12DF247FCBC4CBDBBE16A5B2AC8A5E3DF0F4FA0EB316BBA6B
                  986191FE6318C08A4EC4FB1E95E8BE15D6D7C41A05B5E90165394957D1D7AD73
                  3E15F11DB78E345B9D275654FB5AE55D54637AE7875FA5735E16D4E4F0878C65
                  D26EE52B68F218661BB2AAE7051FF1E01FAFB53E84AB267B4514C0D9EFCE69F4
                  8B1BD8D79A7C41F375CD734CF0FDB27CC5C333EDDC17771B881D80CD7A674155
                  0595BADEB5DAC09F686508650BF36D1D89F4A04D18379A45C69BE039B4CD38B1
                  9E1B5D8AC8B8673FC447FB4DCFE26BC4E25D46E7538EC2DDA63732C9F2C4242B
                  97F7CF435F4A11C1F4C57997C43F07C6F136B9A7C4C9708774EA9C03FF004D38
                  E72391C7273435725A6B6392BDBFF18F85444B7B737506FDC519A6F3010303A6
                  4F7A9CFC44F16C7147279ABE5B0CAB3DB0C363AE0E39ACDD385D78ABC43A658E
                  A7A8492A12B199257C9DAA32473DC85C7D5B35EF71DA4096F1C0224F2A301510
                  AE42803000A60B538EF04B8F1024BAC5FE976697B04E6386E604DBBC606E38CF
                  5C9209ADEF14EBD1681A3C970CEA27752B029EEF8FE95ACEF15ADBBC8C5228A3
                  52CC4FCAA07524D79569D1DD7C40F16B5D5EA2B58587400111B10D951F8F04FB
                  5202E780BC37717F7C9E26D559A4DC0F92253B8BB67FD61F4EF81EF9E8057A80
                  005448AC8A01C1C7A71ED530A634828A28A061451450014518AC5F11788AD3C3
                  5A69BCBB059721422E32C7BE052036A8A82DE74B8B78E64CEC9143AE7D0D4F4C
                  028A292818B9C5715F107C4B7BA059DB45618492E377EF4AE7601B7A0F5E6BB3
                  62075AF3BF10CF677FAFCFA9DE3BBE9BE1E519418C4B724E420FFC7411F4A44B
                  661F84E0D535EF105EDA6A7AC6B10BC3002C82668DBEF71BB8F9719E00C1EBCD
                  76EDE04D05E6599EDE79251FC6D73212C7DCE6A3F054177776F3EBFA944A97DA
                  8B02001F7215E2303EA324FD6BAC193E8299293671C7C016D684BE91A9EA1A6B
                  E491E54DB97FEF93511B7F1A6896C3C9BAB7D5C062ECB247E5C9B40076820E32
                  704576EC38EB47B914156391D3FC4DA4F8984FA3DDDACB6F70C18359DCA61881
                  E99E32073F4E6B8EB79A5F873E3492194BBE91760063C818EA1BD3239045753E
                  3ED0CCD6075AB26F2350B006449178DCA3D7D48ED4B341078FFC0D14CBB05DB4
                  595207FAB980C30FA678FC6811D843224D0A488728CA194FB1E95C778DFC5F77
                  E1E78EDACE04F31E3DFE739E0738C01DEB3BE1BEBF31337876FCBADD5B64C3E6
                  1C9283829F553FA56A7C46D18EA5E1EFB4C6A5AE2CDBCC03FBC87861F8707F0A
                  013D0F3A4D1F5EF1659DEEAFE7BCFE4E02461B73B9383851E983B89F6ADBF853
                  2D88BCBCB29E1417C4168D8AF44E8CBF5CD687C2BD650C173A3C8AAB2C6DE723
                  01F7D480083EE08FCAA3D67C23A8699E3AB1D5B46B5796DE4B85965546DA1304
                  061F420E7F034217430FC57653F83BC631DFE9A0C11CBFBC8767DD3EA87F5FD2
                  B53C7DA7C3A9693A778A6CC652644F37031C372ADF504907EB5E83AEF87AC7C4
                  762B697A8DB51832B2360A91E86A47D0EC8E83FD8AB1EDB410792ABD703A03F5
                  14058CCF026B7FDB3E1D8FCC72D736A7CA949EF8E87FEF9C57535E4FF0ECBE8B
                  E2ED4F469F70327CA9CE46E424F3F55271EC2BD63341716154EFAFED74DB392E
                  EEE511C11804B1F7E0003B9AB67A5794FC58D6B6C9069A8495897CE9154FF111
                  F28F7EE7F1A43B9D11F899A08BA580FDA9149C091A21B4FE20E47E22BABB7BAB
                  7BEB28EE2091258255DC8CBD187A8AF2ED67E1FE9BA5F82DAF9DE71A8C51A33C
                  85BE52C5B95C76196FD2B93D27C6DAC683A73D8D94D1246CDB93CC8F26263D40
                  FAFA76A64731D0F8DBC1F268373FDB3A6EEFB18937B04054DB367208C76CE719
                  EE715E9BE1CBABCBED034FB8D462F2AF258434AA077EC7D89001C76CE2BC86CA
                  D7C5FE309D7CC92F1AD1D82B4B236C8D5377DE038C9009C60735EDCEEB6D6C5E
                  460123425D88E800EBFA500ADD0E13E257888DB5A268964C4DDDD150FB3F8549
                  C01F89E2BAAF0DE890E81A3C361110CCBF34B277773C93FA62BC92DEDB58F18F
                  8B2E6FAC1118C33890C92B1554C10138E79C2E31ED9ADFBFF1B78BB409CC1A96
                  9B6EF81B8BEC620AFB3020763DA8D6C17573D54609C77A5E3D6BCCF4BF883AFE
                  AD2BC567A14172F185691239B0501E075F706B65BC5BAEC6E43F83B502A33929
                  229FCA96A55D58ECCD15C4A78EB50FB379F2F84F55540B962AB9FE951C7F126C
                  15952F34DD4ADCB9E034391D71C53D42E8EEA8AE49FE21E831C65E692EA25071
                  992D9D47F2AB7278DBC3B1A02DAA45C9C1F95891F862803A1270335E6FA9447C
                  5FF10A1B00049A66979FB4FF0075981C95C7FBC00FA29A4F12FC4DB58ADE4B7D
                  155A699D302E0F017DC77349F0D359B08F48BA4BABC823BBFB433CBE6BED2471
                  F364F5E4E3F03EB4AE84DA67A42A8450AA3E5180001D074A7D528B54D3EE0131
                  5F5B4817A95954E3F5A92D2FAD6FA3325ADCC53A0382D1B8600FA7145C659A0F
                  4A89E68E2467775545192CC7005721A978F20178BA6E896CDAADFB8202A1C463
                  1D4963C501737F5CD561D1746BABF98AED8109019B019B1C293EF5E6DE0ED0AF
                  B5D5867D4E451A1C53BDC7924E0CF3B104EEFEF2E71D7A9AEC2DFC2A2FEE4DFF
                  0088E45BDB9651B6DBFE58DBFA851DFDC9F7AC5F896B7AD65A7E99A75ACAD148
                  C5CAC51EE00AE368C0F4EB4C93D091551142E02818000C7D29FD0D7836987C61
                  F67365A7FF0068E23732154DE00F6CB71F874AEBFC3BA678D2D3598754D454DC
                  472A18E5864B9C10A4FDEC723F0A577D42F13D33231D68AC3D11B588A1B91AE3
                  41BFED0DE4187BA1E83F33C559D4F5ED3347B7335FDEC7127605B2C4FA003AD3
                  1926AB25B43A5DD3DD0CDBAC2C645EE571D3EB5CDFC358258FC2492CBB556795
                  E48C2765381FCD4FE75957B79A87C40B88AD34879AD7425502EAE1D0A79D9619
                  45E79F947D39EFD2BBEB3B68ACED62B6B78D6286250A88A3EEA8E8280B1E69F1
                  03489347D66DBC4D64DB5CCC19F03215C74FC08E0D7A1697A85BEB5A34179100
                  629E3195F7C60AD47E23D2975BD0AEEC4805DD098CFA38E57F5AE2BE176A72C7
                  25EE873A60464CC9FEC9CE197F3FEB413B31DA7781B50D23C7705FD934634F47
                  66C93CEC6046CC77C6457A14D756D6CA7CE9E34DA32773018AC7F16D96A9A868
                  325BE912B4574CEA432C9B0900F2335C0D87C33D66F59CEABA8AC08790AAC646
                  3EF9CD1B8D68763A97C41F0F69D218BED4F3CA3AAC09BB1F89E2A968FF00126C
                  B59D660B08ECE5896662A923B0E78CF6AE23C1BA2D83F8E6E74BD4905C2C6B2A
                  46AE301D9580C919F63C56C7C41D16DF403A7EA5A45B2DB6242AC215DA377553
                  ED8C1E3BD017627C4169343F17E9FACDB290EFB64651C0731B0C8FC54815EA96
                  D3A5D5B453C64149555D48F422B84F88D6F1EA7E10B4D4963626378DC30EAAAE
                  003FFB2D6A7C3BD41EFBC236CB20F9ED98C0493D40C107F22281ADCEB0F4AF06
                  F1B49763C617773343B424E0C69283B5D5785181D8E07E75EF44641AAF736B05
                  E4463B8863963FEEC88187E4680699E33E24F888FAFE8B1D84766F0EE2A66766
                  043118E98E8339E2B73E185AE852E8EEF2ADB4BA9B4ACB279A4160A4E14007A0
                  2318C56C6ADF0C746BEDCD6BBAC9D9B2FB0EE5C7FBA78AE4EFBE136AB6DB9AD2
                  EADEE973C263CB623F2238A56645FC8F62545550170060631C573BE39D4974CF
                  0A5D311B9AE3FD1D31EAC3FC01A93C2167AAD8E8890EB33B4B765C91B9F7945E
                  00527BF426B85F8B1AB09AEADB4F8240C6DC179113A97230ABFE7D68BB2B448E
                  93E1869B1DAF8596ED5CB4B7923C8E48F42547E833F8D755AADABDE695776D16
                  37CD03C6A5BA64A9009FC68D26D23D3F4BB5B58D3624512A818C76E73EF9ABAD
                  F3034C12D0F3FF0086370534DBAD3AE1228EE2CE531E0A6D9190F3CE79C06661
                  F8D7A0F15C46BFE15D446B0BAF787E648AFD7868A450164CF5C9F4E99FA53E4F
                  18EABA65AA1D53C357BE6F467B621D09F6C1C8A0134B73B3C1EBDB1EB4D65070
                  48076F72335C3FFC279A9CF32ADA784B539011B8965DA73F88E956F678CF560C
                  4CF69A340E06D554F3A500F5CF6CD03BA343C45E21B0D0EDB33A7DA2E98622B5
                  8F05DFE8315CC7F606B7E30BE2DADC434ED2633986D61C076247249EBEC49C7B
                  015D8E97A0D9E9419D15A6B990832DCCBF349237A927FA56B63140ACCE557E1F
                  786D4B13A6464326C2092401EA3DEA0B3F873E1F82CBC99ED45CCACA15E6919B
                  2718CE0678E4576549F85171F2A3859BE16E80CC5A1FB4C276328024CA824FA1
                  06B9A3F0CB5EB5BDC595EC42227FD6895931CF52A3AD7AF6297140AC79D45F0E
                  6F6FAC1A3D635BB99262D9558D8B46AB9C9E0F538CD258FC316D3E68AE2DF5EB
                  B86E173BA48634538239C71EB8AF46C0A38A02C71EFA0789D2F8DC45E2890C7B
                  91444D6CA404046E247427E8052DE687E2A7BB125AF8982464B1C496AB940482
                  000383C7AD75F8A08A0394E1A3D23C74669C49E21B658640DB596004A9ED818E
                  3F3A593C3FE309ED9A36F148196C065B7084AFD4722BB7DB93ED46DA770E5671
                  171E02BBBF895351F12EA770170760C2AE7D80A9AC3E1BE8366DBE6865BB93B9
                  9D890C7DC0AEC738A504633DA90EC436F0476F0AC312048D06155780054B8A5C
                  8A4CE78C7EB400671DEBC92F2297C3BF156DE48BE58EE660DF37465909040FF8
                  1122BD68A8C579AFC568CDB9D37508462642EA1BD082197F5068133D281C8CD7
                  3BE28F14DAF86EC8B3E64B961FBB840EA7D4FA0ADAB1BA179A7DBDC81C4D12C9
                  8FA8CD79AEB5E0DD575EF1B5C7DA19D74F69558CCC78F2F1F754763C6DFC6903
                  D8E2E09B568A45F11A2485C4E5FCD11931972C4B0C8E9EBCFAE2AD788BC5DA87
                  8BFECB6496C8843E160872774846339F4ED5EE16DA7DB59D9259C5122DBA2ED0
                  9818C77CD430E9FA4D83B4B0DB5A5BC9C29655553F9D5585666749A248FE01FE
                  C7972D28B11163A9DC14607E62B93F84BA81FF004FD39D8EE2567419E830030F
                  D457A32DD5BDD4130B5B88E42A0AE6370707A7F3AF2AF85DE5C5E29BC4C61BEC
                  C55415E7861C67F0A4C7D51EB77330B7B796661F2C6A5C8FA0CD784DF6A9E24F
                  165DDD5D5AC776D1DBFCF22C1210B08E46000793D4F4CF19E95ED7AD5CC767A2
                  5ECF29F91207CE3BF04579C7C30D5F4DB0B3D46D6EAEA282E1A559B323850C9B
                  78C64F38C1FCC521B660683E3ED63C3AB3D95D87BB4466558A7C8789F278DC72
                  7AFAE78F4AB37BE3FF00107882E459E9E861677CC715A29DED83C64F5C7D3158
                  73436BAF78E9E18A4315BDEDFB224883254331E40FF3D6BDCF47D074CD121F2F
                  4FB286DC30192AB8661EE7BD0AE1A8787EDAF2D341B1B6D464325DC7084998B6
                  EC9EFCF7FAD79A6BF68355F8AF059C71AAE6E23763D4ED50AC48FCABD80E00E9
                  5E5F6C824F8D6E4B7DC591B3EFE5E31F91FCE9899E9EA334EE2907159973E22D
                  1ECEE7ECD71A95B473F4D8D20CE7E940D6C6A52119EA3A735CF4DE38F0E42A4F
                  F6A44E41036C79639F4E055293E23F87500C5C4AC7A10B11A570BA3AE2A3834B
                  815C349F1474042760B9603186118C1CFE3DAA94FF0016ACA1B858BFB3A760C3
                  3B84838A61747A3714B5E5777F174ABFFA369AA00E089A4C1FD2ABCFF15B5199
                  02DA69B1063C163B9CFD428A05CC8F5BA323D6BC69FC61E35D4544705B4E9B8F
                  063B6DADFAD1FF00170EE42A8FED105B395F9578CFA9E29598731ECB91EB4D2E
                  AA092C001CF26BC9C786BC797717937178522037006ECE59B3D4919C1A745E03
                  F13DC28B7BDD597C9656C83233679FBA47E6DDFF000A760E667A68D4AC9A3320
                  BB83CB1D5B78E2A03AF692B2344DA95A8917AAF9C2BCEE0F85376BBC4BAAC4A7
                  AA3246723EBCD3EC7E18DB1BC9A3935EF31940DF1C280302DC65B9EF86A41767
                  692F8C7C3D1052FAADB60AEE1CE722A84BF123C330BE0DEBB0F5485B1FCAB253
                  E12E9AB1053A95E9C367202AF1E9D2AE2FC2ED000E1EF338C67CD1D7F2A0351D
                  27C50F0EAB611AE9CE71F2C06A9DCFC56D2E3E2DACAE66C8272DB540FC09ABD0
                  FC31F0E450EC6867933DDE76CFE845681F02F869A1584E916DB17FD9393F53DF
                  F1A63D4E464F8BF9C793A46411CEE9FBFE5551FE29EB52B30B7D2EDB00E0905D
                  981F4E473F857A747A369D08411D85B2ECE53110E3E9528B1B646056DE152393
                  FBB1D6803C91FC57E35BED863B59E219C1F2ADF1C7A723F5A73C3F1175053BBE
                  DA8920391B963CFE1C62BD840E39A5C7B50079E783743F15E9FAA7DA755B926D
                  4C7B5A179CB93E9EB822A6F8AB007F0D4126788EE3047D54FF008577B8F6AE4B
                  E22DAFDA3C1D3B9F9BC9923723D7E60A7F46A04CB7E08BA7BAF0769923672B17
                  97CFA212A3F90AE73C717DE2A83578E0D245CADA14DCA6DD012C472D93DAB77E
                  1E4663F03E9A08C1224EBFEFB565F8FEF3C4562F0CFA4B4AB682322568937156
                  27A9F6E94C2F64722DA678F754812375BE0B8C7EFA5DA0E7F1FE94F83E19788E
                  4399EEADE30FB99B1216F9B1818E3F1ADFF0F7C4E82544B7D6D3C99C706E107C
                  8DF51D8D77561ABE9FAA26EB1BC8A7180C446F9201F5145C1338CF0B7C3BB9D0
                  6EE3BB7D6255718F321B75DA920FEE9279C67D31581E0311DAFC44BB863930A4
                  4D185ECFB5B83FCF1FF02AF61C0C578F6896E2DFE2FC8830A91CF3E01EE18363
                  F9FE9481A67A96B1A70D5749B9B1673189936EF033B4E735E4BA8FC2BD6A3903
                  5ACB693A9CB60B1439FA6319AF6AED4CC0FAD0368F0397E1F78AACA4574B177D
                  A772B4328CA9EC41CD5DD37FE13FD3E64FB3C1AA15565CC520257DC1C8231EF5
                  ED1F6CB5373F6533C7F68C67CBDE3763D715CF78DBC492F8674B8A7B689249E6
                  976AEFFBA303273F952E564DBCCE9A36631A6FE1C81BABCB2C9C8F8BD34B2939
                  8E4940F64F2CF3F962BD03C3DABAEBBA0D9EA4A9B3CF8F2C9FDD6070CBFF007D
                  035C25FA1B0F8C1693B61629D863038F9936E73EED9FCE98DEC7A3D85FDB6A56
                  30DEDAC81E0997746C38C8AE164F8536B25C4B23EA73ED724ED58C03C9CF27DA
                  BD0218A386358E240A8A30AAA30147B54DC503DCF3BFF854BA617DCDA85E6300
                  6005EBEBD2AD47F0ABC3E80177BC91F3CB1987F857754940591C8C1F0DFC3700
                  19B26971DE4958FF00222AC0F01786C4CB28D2E3DEA49FBCDCFB75AE98714679
                  A2E2B2326DBC39A3D993E469B6C849CFFAB07F9D5F4B58633F2431AFA15502A7
                  241A381DE81D90DC75FA5721E21F154BE1EF1369D6F3247FD977119DF21EB1B6
                  719FA723F3AEC31EFD6B92F1F689FDB7E1F730C3E65CC0774631F311FC400FA7
                  F2A034398F1C78CAFD3593A669170D1C70AE6478796673D81F6AE56F3C55E299
                  F49F2E7B9B910A4BB4CDB5958B91F74B0E3B1AEE3E19E83259DA5D6A17D69E5C
                  D348A2159530C8807500F4073FA56D78EB44975CF0FF00916AA5A686512AA2F5
                  6E186073D79CFE149A62B3B9E7126B5F63BDB383C3DAC6A0CF310921B97C2076
                  1B471D3AB1E7AE4FB56C7813C3DE23D23C58935D5B4F05A14712B970438E7683
                  EBC9EB54B48F873ADCFAA4125DC4969044E92B1660DBB043600078E95EC4668D
                  4952CBB80C919E714EC2B93039147190055792EA08A069E5963489012CECC005
                  006793F4ACFD5BC49A56896D14F7B76AAB2FFAB2B972C319C803AD3B02923631
                  9A5C0FCEB0349F16E91AC492A59DD65E252EF1BA6D200EFCF6ABF69ABD95FE97
                  FDA3693ACD68519B7A1C8C2F5A452923409C527535E7979F15F4EB7204165713
                  82090DBC0A4D2FE215FEA835190690B1450C0ED03B39DAD20C6109C753B8501C
                  C8F45DC338A3AF4AF1FB9F89DAFC3A87D95B4EB7865F3163F25D58B67763D6BD
                  754960095C66804C90D72FE3E765F065FE08F982827FE06B5D39E95C3FC4FB8F
                  27C2BE56EC19E745FCB27F9E2806697805597C11A50720B345BB8F7626BA4600
                  839E7B5617836036FE0DD2118FCDF6643CFB8CFF005AC1F1878EA5D0EFA4D3ED
                  21469D50334921F94679C63E94C57B6E72FE23D121D47E232E99037D992E5806
                  2983D1093C76E47EB5977705CF8275B0B63AAC73EE4C99623CEDCB00AC33ED9F
                  CAA3B4D2BC43E30BC6D4EDD1C33B92D3E70324638F6AEB34DF84E19F7EAD7ECC
                  C4F2901C6F1CF563CE7A516158D9F03F8BAEBC4325C5BDD2A3B42370950633EC
                  7D2B93D28349F19A5D8BB825CCFBB83D30715EA1A3E83A7E856BF67D3EDD6253
                  8DCDD4B7D6BCD3C2AC24F8A771204650CD70D927DFBD20D4F5F638AF34F08F8A
                  66FF0084B751D26FE795C5C4CED6E642582956C6C03B0DA33FF01AF4A22BC7B5
                  FBA3E0EF88936A8B64B32CCBE620DC46770C361BF3FCE81B21F1CDDC9A57C458
                  2F7253CB6866539E028C06C0F4E0D76BF11AD3EDBE1095D42B790EB37FC07952
                  73FF0002AF29F17788CF8AB544B95B5FB32246218D4B6E2C324FA7BD49278A7C
                  45A968F1E885DA7840550123FDE301823247F938A5726FADCF43F855A909F44B
                  9D3D8FCF6B3165FF0071B91FAEEAA5F12A4FB0F88347D411D84B17CC3D00470D
                  93F5CFE1537C2BD1B52D323D4AE2FED64B68E768C4424E0E1436703D3E61F8E6
                  B57E24694350F0CBDCA90B35A37980E3A8E857F91FF80D31AD8EBE1956689244
                  3F23A8607DAA5AE57E1FEA4BA8F846D307E7B606DDC7A15E9FF8E915D50A0684
                  2715526D46CEDED5AEA6B9896DD7832171B7352DD7369360E1BCB6C7E55F3EE9
                  856F353D3F4D9EE592CDEE143EE72573DCE3B1FE1CFF00B54033DAB4EF1868BA
                  A5D7D9AD6EF329FBA1D4A6FF00F773D6A8EB9E3ED2343B96B5732DC5CA1DAEB1
                  01853EE4F02B0FE21E8DA4E9FE178E6B7B58ADE78A4510EC1C904E48E39ED5C4
                  699A2DC5F34379A66A964F78430920B8214A7047718618E87AE4F6EB40B53D1A
                  FF00E2469D068F6B7D6D0CB23DC3B22C2C7695DBF789EA0F51507863C7F75E21
                  D6D6CC69812DD90B09237DDB31CE5B23EEF41C7F7ABC7EE64932D6ACEDB22662
                  AA186327EF63B63815D8F8062D3EC758B5D4AF35AB780ED644B64243B16046D7
                  247033C81EB81DA9095CF42F1A78AE4F0D25B086D96596727EF9E001FD79AE6B
                  FE13ED6348D6D2DB5BB6B6303005FEC841280E70C39C3738CFD2A6F8B16D27D9
                  AC2F1492BB8C4500CFCC48231FAFE55C96A5E18BDF095EDADEEA36F15ED9E4B3
                  85058371C823A8E09A63EA74B67AF78ABC637F78BA45C456569071C81904F2B9
                  EB92707BF158FAAF8F35AFECF934AB92F05DC52959258D806E382AC3A6739E9D
                  8557D16EAEFC0FE279927B7B89612A46C562AA41FBAF9E84E33D47527D2A9EA3
                  A56BBAFBDCEBE34A9BC8B990BA8033C1C72AA4EE231DC639FAD17B0AC51B3F14
                  EAF657EB7515FCE651FF003D24254FD41E2A3D4358BAD4B52B9BCBB1203720B8
                  8C485369FBA3047F748E9ED56B4EF0A6ADAA8B2860D2A580CD21F32E64C85DBC
                  65883D3039F7CE0722BB9D27E1D0B1F13EFBB2971A4C36EC0194FF00AC66E0E5
                  7B6304E7B678A425138CD32E2F2E7C29AE2C923BDAC6D098C03C0977F07D86D0
                  473C1257BD54D2C1D6756B382EEE0A43830C1C92030070A06785CE0647AD7709
                  F0EEEEDB56D46DADA78174CBE82441BCF3BC90CA08F6207E02947C278CE9702B
                  EA4EB7C993238505091C803B8C631924E7AD3D476B1C1EA10DDE87A8988C53D8
                  4FE515746E4156186DBD8A11D3E95D4F857C530E9DE0AD6AC5A68E2B88C33DB8
                  66059CB83C7FB4C304FE2B57ACFC03677D2EDD5FC442EEFCC676245206080772
                  09C9C66B1C683E0B86E62B79BC4B34AC705D962CA93D396ED46A16B1C5EE3BD7
                  68632173C93D0D77DE16D534EF0F58DC5CCDAE8BD2E8CE9A5C485834A76FCCC5
                  8751B47A7D4D74977E16F03EE3653324135BC425902CC43B21E858F7E9C62B98
                  B0D4FC0767A92C71E9F772DB2A95371312E18F04165EBD01FAD1663D0A1E1DD7
                  34D5F14C9AD6BC642C58CA8634CA8949EA47A00DC7A62BDC6CEEA1BFB386EE06
                  DD1CD1AC88D8FE16E95E571EBDE01B6D4502688BB198E66640CABFF013F4AEAF
                  44F1FE97ACEB50E97690CE82443B19D40195192B8FA53B204D1D91E86BCC3E2A
                  5CA4F73A5E98B9F35C9239E32E42AFE3906BD389E2BC9261FF00090FC5D1193B
                  A1B260DC7FD32E49FF00BEE9147A95A402D6CA183242C51AA0C7B002BC9358F1
                  76933789277BDD12DAEA13295F34B624DABF28E7A7403F3AF4EF11DFAE9BE1CB
                  FBA240D90B0527FBC4607EB5E4DE02F0D597892F2F8DEAB7936C142A21DB82C0
                  E39EF8028259D9E89F10BC36D1FD94674F8A362B1A3A6D423EA2BAEB3D574FBD
                  DA6D6F2DE6C9C0092027F9D70EDF08F4CDB188F51BC47FE26E0EE3FD2B267F85
                  3AB5A956D3F5184956241F991FF31C503D4F5992558E36727E551935E59F0D2D
                  5AF3C4BAA6A92A7DD0C013D99DB711F95754EF7BE1FF00004C6FE7F3AF2281D4
                  3E7249276AF3DFA8ACDF857148346BD9DC604B73F2FAFCAA01FD41A05ADCF403
                  D2B1B58F0EE99AEA2ADFDB091971B5C70C06738DDE95B38A6B0C8F4A0B7A9CC8
                  F0C785B4447BA7D3AC624030D24C81B1F8B13CD63DC7C4BF0DD80F2EDA2B8946
                  EDA3C9842A923DF23F95735E33BDD43C47E2C8F45B60445E6186289861770CEE
                  63F867F4AEAB4AF867A1DA5AA0BE8DEF6E02FCF2C8ECAA7E8A0F02925733EBA1
                  3787FE22E91AE5DB5A90F693972B1ACA40120ED823BFB5759710C575049138DD
                  1C885580EE2BCB7C67E02B5D334E9352D2FCC444C19200D9D8A7BA93D0035D1F
                  C38D724D57416B59DE47B8B2711BBBF25948C83F9E57F0A6357D8C0F00DC1D03
                  C577FA14F85499CECC9E9228E38F753FA57AA738AF32F893A6CF617B67E24B10
                  DE742EA5C83DD7EE9FC7A1AEFF0049D4A0D5F4BB7BEB570D0CCB9047A8383FA8
                  2281ADCE6BC6FA06A7AC0827D3AEC4662465789E531AB67DC7D7F9573CDF0D6D
                  E3D18452EAB0A6A2CFB9D9CFC80607CBB73C723AD747F126465F09B246C177CE
                  8AC4F231D4E7F2AF1FD36F74C8AF259758B59EF211196108976967E0658FD375
                  2B833D0EDBC1F1A2DBCBE28F10C57165116F2E03361491938CF71D4E2A2D7341
                  F06EA7733DDDB6B10D988937CE96C0307073D07AF1D0573FE289AD26D0B489F4
                  FD32E2C2D95E4558A51C13C3647AF5C7E1ED54F58BFF00B7E8E5ADFC39069F1B
                  32B7DA628080D91FDE3C6339C2FB556A49BB6BA4780679E3D3ADAFEE67B9BC95
                  52372A7EF75C0E07A1C1208AD4BFF0BF863C17241ACDC2DEDC84942C3013BB2C
                  01604E7A8C01D7BFB9AE77E1FDF6AAFAD416B636568F6E1C9959E250EAA4124E
                  FF00BC4FF3E878AECBE2BC6CFE1885D47DDB9009F4F94FF85086896CFE22E81A
                  84AB15D4525BA302F1B4F18D840CFCD5043E38BCD775092CF48D03ED90443F79
                  23CC1475C0C6477AE67C597B637FE17F0D4366F1CD7CB0A2941F33AE514107D4
                  EE1FA1AE6B4BB310EA33A6A5A94FA4A4795670ACC770232854107FFD5484D9EF
                  17770D6BA2CD772420C90C0D2795F7C640C819C735E6A3C73AFC9A5CDAAC26CB
                  EC50DC88846701DBE5E8A3D31EBDB3E95DCE8B3D95FF0085BC8D32F9AF23485A
                  0129E58B6DEF9FA8FD2BCFBC1BE08B6D7C5D5D5FB5CC5145308FCA5C297207CC
                  5987A1E3F0A76190E9FE36D5B54D78B5D6BBFD976922127116F44C7451EE71F7
                  8FBD5183C5DAD3E91AE5BB5D4B3C0CA1BCF3C18CB49C9FA119AE8754F87CB3F8
                  D60B382DA48B467803B491FF0006011B727DC03F8D73BAB783F5DD1AE6E2CED2
                  1B9B8B3B8DB99614389403F2EE007073C91EB45BB06C4FE10B8D167D46DCEB5A
                  8EA7F6D793CA8D119962049C01B94E7F90AB7078A350F07D96A9E1DBB8E49648
                  DCADABC8C5B0A7392C7B820861EBDEA3F0CC3E2AD153FD0BC370CB217044B708
                  55F19FBA1B76001D338F7F4AEBBC61E08B8F13BD9DE5BB436D75B152E4392463
                  83907BE391EF459F50BDCF2DB559F4FB8B0B8937DA437C876CBB7A213B4B285F
                  C3FC2A58B4FB8B5D0AE4CBA6A5DD8CA508D422CFC9838CA3763D720D7A86BFF0
                  FA2D4AC74CB6B1B8FB3FD862F2412BBB2BEBF5CE7F3ACC3F0B6F90359C1AFCE9
                  A7C8E1E4876900B7F13601C6720726803CFBC49AB5BEADA8C7736F0B4412DD21
                  6566DC7E518C9381E82BA6D035AD02CFE1BDFE9B2DC2FF00684EB2FEED90E5A4
                  23E5C6070071FAD75B0FC2AD1A39ADA49249E4587978C9E253EA7DBDA8BEF85D
                  A2DE5EB4E92DC411B7DF862202F4C7071903E94ADE62B33C580DE42819DC7E50
                  06493E82BA1F0A437563E33D2CCD1C90C893A8642A77F2083FA1AF66B4F08687
                  A7DDC5776DA6C493C246C6E4E31C6EE4FDEC77AD46D3ED1AEC5DBC119B855C79
                  A546E0282AC88359D4D349D2AE2F1C83E5A9DABEADDAB86F85DA63BC97BAD4AE
                  AC65261561D490D973F9E3F5AAFF0013F5A967BAB6D0ADBE763B5DD5464990E4
                  2AFF009F5AEF3C39A3A685A15A69E9826241E637F798F2C68E817D43C49A37F6
                  F68935879C616720AB81DC1C8CFB554F0A785E2F0DD83C4A77CF34864924C7E4
                  BF80FEB5D1919A05055840314BD79A5A42463AD0163CF3E29EA620D2ADAC1012
                  F3BF9AC41E36A8FF00EBFE95D0F826C9B4FF000969D6EF8DFE5F984631CB12DF
                  8F5AF3EF13CEFE27F1E4367095682291214CF5600FEF063B8CE79F6AF608D022
                  AA8002A8C003B60628E825B925211918A5A42463AD033CA75671E1CF89F16A17
                  431693162F215C801D48CE3D54EDCFA835D85E78EBC39670890EA70CB91F2AC3
                  963F90E9F8D54F1CF872E35CB5B77B54592688B2EC66001071CE7F0AE674AF85
                  534CE64D66E8C630098A020927BE5BB7E03F1A094ECCA9E22F88F36A96F358E9
                  B6AD1DBCE7CB32B9CB9CF50147193C8EF8CF6ABBF0D344D5ECB559EF6E2D9EDE
                  D64876B798BB4BB12082077C60F5F5AEEB4EF0AE8DA6146B5B085645181211B9
                  FAFAD6CED03F2C50B40D6E55D42C62D46C2E2CEE0168A6428D8F718C8AF34F0C
                  6A737847C493F87F53982594AD98E473808E49C11ECD9FCEBD58E7D6B88F1EF8
                  4DB5BB55BDB38C7DBA05E98E645EC33EA0D00CC1F17F87BC557FAB5D792AF736
                  3236F8D04C7E40074032067A8AC9B4F01F89B4AD5526B6B689A40BBD1D590A29
                  EE08618079EC3F1AEC3C0BE2FF00ED68574DD424CDF463E466EB2007BFAB0033
                  C75AEE783D29A25ABEC79B3F83BC49E20D1CDA6BBA8408C2E3CE8CC63715E082
                  33E9C8C5769AC6890EAFA2CBA6B7C88CA046C467611D0FE95AC0018F618A5C51
                  71D8F2BB4F84D7115C46D26AA11411BDA052AC463B1CD7A0EADA3DA6B3A6BD8D
                  EAB491363A1E463BE7D78FD6B4F14878EF45C123811A37837C19776F717726DB
                  A1F342F2969186063700071C54D2DB782B5FB5BCD6BC88AE16124CD27CCACAD8
                  CF42473591E38D126BDF107DAACAF2DE79C227FA0C9CE4FB03C1070323BD705F
                  68961B6D52CE0B368259995A611C8DB63552415D9939F998727E9DA8BC8763D1
                  74FF00881E1DD260486CF49BAB7D38B90258E20101EBCF3C9C56C6B9E38D2B43
                  82D8DAC7F6D9AE47991C56E704A9CFCC71EA7B75AC36D574197E183471188225
                  BAC7E41701C4DC7F08EF9E775713A0DC4DA16B5A6EAF77137D8DDD991CC5C3A9
                  18723DD7AE7EB4ACC49D8F405F89422BDBAB3D4B4B92C6E2281E48964973BD80
                  DC14F1D4E300D5F87C6914DE0C9B5C687C874768843B8302F9C2807E9835CDF8
                  97C6B69AB4F269BA3E9D16A2D3C2CAD71E510E38382808CF15C2D89D4B535B6D
                  02DB7BA3DC6E54E8AAE4632DE80601FC3DE804EFB9E99A6FC4137DE11D4B5092
                  28E2D46D546D42786240C30CF5E739ADFF00056BB27883C3B15DDC95FB48768E
                  6C018660786F6C8C57916BDE12D57C38E8937EF21940559620769E7F31F8F6AE
                  8FE1E6B37DA3B7F65FF644D3C53DC73244A418DF001C93C6DC018A61747AFE71
                  DA8009A553950718C8E94B8A4506293B6053A93028189B700E6B23C47AC45A16
                  8D3DE48C15C29110FEF391C55EBEBEB6D36D64BABB95638D07249C67D85793CA
                  B7FF0012BC4CD1237D9B4DB55DAD8390A84FFE867F4A0342FF00803419F55D41
                  BC4FA98766DEC61DFF00C6E7AB8F4038C7E35EA416ABDA5BC76B6F1DBC31848A
                  250A8A3B01D07E156A814505145140C4E82B3F59BF1A668D79784FFAA8D881EF
                  D07EB5A24D7947C53F1190FF00D910BAF9718F36720F5E3A7E1C1A018CF861A6
                  B5EEAD73AC4A49FB39689723EFBB0CB1FC3FAD7AC818AC2F09690346F0EDADB3
                  2E252BBE5E73973CFF00F5BF0ADFA05142555BD5B96B2996CD912E4A111338CA
                  AB6382455AA43D2828E7F43D4AE048BA5EAD2DA0D5150B2A5BB121A2E007F6EB
                  FA8F5ADFC7D2B8CF16BB787F3AFD8C5199DE445B8790E4320046C03B6EE39F6C
                  D747A3EAD6FACE956FA85B92239941C31C953DD4FBD04234050453B348682AC2
                  77E8690AE47E14FA4340AC79C78B7C0E58C9AC68CCD0DDA132C91C7C1739CE57
                  D083923D6B4BC21E348B5948ECAF9922D4557BF025C6391EFCF22BB32323DBD3
                  D6B84F16F8196FCFF686931AC57CA77145F943FBFB1E282763BC073D314A2BCE
                  7C35E3C36F2FF65F8949B7BA43B5677180DECD8E95E8514B1CD1AC9132BA38C8
                  23906829324EF4871E94A28340CE43C51E05B2F12DC25C99A4B69C70EE801DC3
                  A73F4A7E87E06D2B468A65F28DCC93A84792600FCA3B01FC39CE7F0AEAB1818E
                  B4B8E69DC938B4F869E1D4BD1746DA4628FBF6193E56FA8AE92EB47B0BEB65B7
                  BAB2825853EE23460803D876ABE573F8D380345C2C64E9FE1FD2F4B7792CACA1
                  85DCE4955E738C1EB56A0B1B4B5C182DA38C818055003F9D5BEBE946DCD171D8
                  8CA2B2E0AE40ED8A72C61470303D00C0CD3C0C52D21D9094B49D68EDC50018E2
                  AA5EDF5BE9D672DDDCC8238614DCCC7B0A8F54D5ECF47B36B9BE9D638C74C1E5
                  8FA01DEBCA750D4356F88DAB2D9E9D13C3611724B0F9132792DEA71D05026EC1
                  ACEA57FF0010B5F834ED2E278ED222412E3E551DDDC7AFA0FF00135E9FA0E856
                  9E1ED352C6CE33B472F2372F237F798F7269BA068169E1ED392D2D972C466594
                  8F9A46F526B63D281217A5145141414514139140CCAD7B588B43D226BE970C10
                  61549C6E6EC2BCA3C1BA20F14F88E6BCD403CD0C67CC9370E1893951F5CE4D5B
                  F1D6B5278875E8748D3B7C888FE50DBD1A427049FA57A3F86F438741D1E0B38C
                  2F980032BA8C191FB9A08DDD8D80318E318F4A7527A52D22C5A422968C500432
                  C31CF1949635753D9C64647B57975BDDDC7C3FF13DDC5749249A55E307474E04
                  6371C1E4760707E99AF5622B1FC41A241AEE9725A4C143F58998642B763F4A09
                  68D28678E789258DC346E372B03D454D5E61E0ED6E6F0EEA6DE19D653C92F266
                  DDC9CFCCC7014FA03D47A723D2BD3430F5A609DC5A5A28A062114847069D4501
                  6398F137842CFC47065879376A3E4980F4ECDEB5C0C57FE24F87F782DE6845CE
                  9FB8E2324ED607A1563C29E9D6BD90F4AAD756705E42D0DCC093444E4A48BB81
                  FC0D04D8C3D07C6BA46BA912A4E20BA719F225383F87AD7461B3D0E6B87D63E1
                  9E93781A5B02D673E72028DC99FA76AC571E35F0823CAD225FD8A3743F38EFF3
                  7AAD02BB3D505048F5AF39D37E2BD948E1350B29A0278DD17CCA3F0EB5D5D8F8
                  AB45D4638E48352B721C6406902B0F620D055CDBA5A606046EC839F7A0382D80
                  C323B5003B14B4DDC319CD579EFAD6DD37CB73146BEACE0500593466B9BBEF1B
                  E8360997BF8E53FDD83F787F4AE5B50F8A7E6B98743B179A4C100CC18927B7CA
                  BCFEB40B98F4A7956342CEC1547524E05717E24F88363A5C422D38ADF5CB2E72
                  AD94503B923AD7310681E2DF164CB36A8EF6F6CCC495B81B47E083B7B1AECFC3
                  FE03D274068A5447B9B98D76ACD39C95E73F28EDFE79A049B390B1F05EBBE2AB
                  E4D47C453C91407E6F2C9F9CFF00B207F08AF4DB1D3AD74DB55B6B3B748615E8
                  A831F9D5C0A14000718C0C52E3A5055808A5A28A06145145001D8D715E39F167
                  F61590B6B4913ED9329C9CF312E386FAD6AF8A3C4D6BE1BB1DEE0497127FAA87
                  3CB1F7F6AF3FF09E8F3F8C3599B57D554CB648C465810B337603D40FEB409BD4
                  DEF873E1E36F66DAD5DA37DAAE79883725533D7EAC73F862BD040C5323411A2A
                  28C2A80A0638000A9290D201C52D25140C2968A4A062D348F4A7521A04626B7E
                  1CB1D6AD6459ED6379F6111C8C3041EA324738E99AE57C3FE2C9B47BA5D075E5
                  6468A4F262BB0E5D49ECAC4F3F8D7A2D73FE25F0DDAEBF60D1CB1E274F9A2917
                  860476CFA504B563741FE74FAF24D0BC677FE1CD40693AF2CB35BA1F2D652A4B
                  C647739FBC0FBF35EA367776F7B6F1DC5B4AB2C52A875753C30F5A6172D628A2
                  8A0614514503138A4650CB823208C60D2E29714058C6D43C35A3EA8ACB77A7C2
                  E48C160BB4FE62B9ABDF859A2DC10609EE6DFF00BC03EF07F3AEF71462826C79
                  84DF0C7538B7FD8FC412803042B061B88F5C1EBD2AA9F86BE23D923FF6CC61E5
                  C798A247C1F5CFF7BF2AF59C518A42B1E591FC31D65AD951F5D58F03FD5A6FDB
                  9FCC7F2A920F844AC83ED7AB3120F58E1193F8935E9F8A314058E2ED7E18F87E
                  DD41952E2E1C2905A494F35D35869563A6C4B1D9D9C302A8C2EC4038ABF8A314
                  0F94680074FC29D8A4A5A6505145148028A299BD77150C370EA33934C438F4AC
                  7D7BC4365E1FB3FB45D372C088917EF39F41E950F88BC55A7F87ADDCCF3235C1
                  5CC76E1BE663FD0579CD9695ACF8F7531A85DC863B3C9476CF08BFDD41FD6813
                  63748D36FF00C79E2596F6F8B2D9A365CA1E14672231FA73E95EBD6967058DBC
                  76F6D12C5120C2AA8E95169BA65AE9363159D9C42382300281DFDCD5EA4090B4
                  94514142D14514005145140C28A28A04262908A751401CEF88FC2B65E22B6225
                  063B8006C994E08F63ED5E6F18D77C05AA3482169206C210C4F9520CE7E5F43C
                  E2BDA48AAF736B15DC4D14F1AC91B0C15619FC69912463E87E2DD275E422DAE0
                  2CD9F9A097E5707E87AFE15BF9E6BCB35BF8633ADC9B9D1AE1463958DD8A95E7
                  B1A4D3FC79ABE8920B0D7AD5A7302E6697A4AA338CE3A37AE7AD1A873773D572
                  28ACAD2B5ED375A04D8DD24A530594020AE7B1FC8D6B50CB4252D2514802968A
                  280128A28A005A28A2800A28A280129693345300A334D6608A4B1C01C935C6EB
                  9F10F4BD1EEFECD1A9BB94292ED1380A9EC5BD695C57EE764CEA9197760AA064
                  927000AF37F13FC495B677B7D19A29988DA6620E14FB6783DFB563DC6ADE28F1
                  C4E2DEC627B7B173918CA809D8B3F7FA0F7AEBFC2FE00B2D065FB5CE45D5EE3E
                  5765F962F50BDFF134C96EFB1CCF86BC117DAD5E1D4FC43E624664DC217C6E9F
                  BFCDFECF6C57A9C16F15BC4B1431AC71A8C2AA8C6054A063A740318A5EF48A48
                  31452D25030E9475A5A2800A4A5A2800A28A2818514525002D145140094B4525
                  002119AC9D5340D3F5753F69814C854A8940C38183D0FE35AF463DFF004A7726
                  C8F2CD63E1BDE5BB9B8D16EE40E00E37947C73D08E3FFD75059F8EFC43E1F95A
                  DB5FB269C29C2B15D8D8FAF43F8D7ACF151490C732ED923571E8CB914C977471
                  FA7FC4DD0AE9545C99ED24EEB2464A8FC4574961AE697A96D3677F6D333F4092
                  024E3DAB0753F87BA36A04C9144D6B26771F2FEE93E856B9A97E176A0B7A2E6D
                  75182370C4AB6C60541CFD7FCFA74A9B07333D577519AF2E7D1FC79A5844B4BE
                  9674CE3E594305FC1A88BC4BE36D33115E696F7009382F0FCDD7D53E5EF4598F
                  99753D437668DD9AF3393E25EA3001F69D11E37E72B93B71F5C54727C54B8467
                  09A6ABAECC861231DA700E0E3A8E4F2314B50E647A9645266BC9E3F8A3AA98C2
                  FF0063A19B001C6E273F41DAAB5878DFC55F6FBA94DBBDDA306F2ED96DC8F2CF
                  1B4E7AF18236F539CD349B1F323D87349B857965B6BBE3AB8423FB3673962439
                  8768C718C6791C67FF00D740F0B78CF569239AFAF5214272D1BCCD8FA6D5FF00
                  3ED4598B9BB1E857DAD69BA723B5D5E428CBC32EE05BF2AE3353F8A16D196874
                  CB5796423F7723F0B9F751CE2A4B6F85D646F3ED37F7B35C1272D12FCAA4FD7A
                  D759A6787B4BD2540B2B18E361FC7B72DF893CD160BB679D3E9FE35F18A8374D
                  F64B37FE07CA2E3FDD1C9FC6B5B48F85B656B32CFA94E6ECAB67CA55C27E3DCD
                  7A16314EE298944AD6F6715B02224080E3800700559C514527A949242D149450
                  3168A292818B45145001483AD2D1401FFFD9}
                mmHeight = 24606
                mmLeft = 38893
                mmTop = 9526
                mmWidth = 26458
                BandType = 7
              end
              object pplchegen02: TppLine
                UserName = 'lchegen02'
                Weight = 0.750000000000000000
                mmHeight = 265
                mmLeft = 31485
                mmTop = 28311
                mmWidth = 45773
                BandType = 7
              end
              object pplchegen03: TppLabel
                UserName = 'Label301'
                Caption = 'JEFE DE PREVISION SOCIAL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3175
                mmLeft = 31486
                mmTop = 28840
                mmWidth = 45773
                BandType = 7
              end
              object pplchegen05: TppLabel
                UserName = 'lchegen05'
                Caption = 'Beneficiario: '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3175
                mmLeft = 96837
                mmTop = 28311
                mmWidth = 81492
                BandType = 7
              end
              object pplchegen04: TppLine
                UserName = 'lchegen04'
                Weight = 0.750000000000000000
                mmHeight = 265
                mmLeft = 114829
                mmTop = 28311
                mmWidth = 45773
                BandType = 7
              end
              object pplchegen06: TppLabel
                UserName = 'lchegen06'
                Caption = 'DNI: 09733891'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3175
                mmLeft = 114829
                mmTop = 31222
                mmWidth = 45773
                BandType = 7
              end
              object pplchegen07: TppLabel
                UserName = 'lchegen07'
                Caption = 
                  'Firmo en se'#241'al de conformidad, No teniendo reclamo alguno al res' +
                  'pecto, recibo copia de mi liquidaci'#243'n y carta de recojo de  cheq' +
                  'ue de '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 14023
                mmTop = 36249
                mmWidth = 171186
                BandType = 7
              end
              object pplchegen08: TppLabel
                UserName = 'Label302'
                Caption = 
                  'gerencia BCP, que podra ser cobrado las 24 horas(*) de aprobada ' +
                  'la liquidaci'#243'n.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3239
                mmLeft = 14023
                mmTop = 39688
                mmWidth = 100563
                BandType = 7
              end
              object pplchegen09: TppLabel
                UserName = 'lchegen09'
                Caption = '(*) dias h'#225'biles lun-vie'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 14023
                mmTop = 43128
                mmWidth = 30163
                BandType = 7
              end
            end
            object pprregdepctacajmon: TppRegion
              UserName = 'rregcheger1'
              mmHeight = 41539
              mmLeft = 12700
              mmTop = 5822
              mmWidth = 181240
              BandType = 7
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              object ppImage3: TppImage
                UserName = 'Image3'
                MaintainAspectRatio = False
                Stretch = True
                Picture.Data = {
                  0A544A504547496D61676543640000FFD8FFE000104A46494600010101012C01
                  2C0000FFE110784578696600004D4D002A000000080003876900040000000100
                  00083E9C9E0001000000120000105EEA1C00070000080C00000032000000001C
                  EA00000008000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  00000000000000000000000001EA1C00070000080C00000850000000001CEA00
                  0000080000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000530065006C006C006F002000560042000000FFE10C
                  70687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F003C3F
                  787061636B657420626567696E3D27EFBBBF272069643D2757354D304D704365
                  6869487A7265537A4E54637A6B633964273F3E0D0A3C783A786D706D65746120
                  786D6C6E733A783D2261646F62653A6E733A6D6574612F223E3C7264663A5244
                  4620786D6C6E733A7264663D22687474703A2F2F7777772E77332E6F72672F31
                  3939392F30322F32322D7264662D73796E7461782D6E7323223E3C7264663A44
                  65736372697074696F6E207264663A61626F75743D22757569643A6661663562
                  6464352D626133642D313164612D616433312D64333364373531383266316222
                  20786D6C6E733A64633D22687474703A2F2F7075726C2E6F72672F64632F656C
                  656D656E74732F312E312F222F3E3C7264663A4465736372697074696F6E2072
                  64663A61626F75743D22757569643A66616635626464352D626133642D313164
                  612D616433312D6433336437353138326631622220786D6C6E733A4D6963726F
                  736F667450686F746F3D22687474703A2F2F6E732E6D6963726F736F66742E63
                  6F6D2F70686F746F2F312E302F222F3E3C7264663A4465736372697074696F6E
                  207264663A61626F75743D22757569643A66616635626464352D626133642D31
                  3164612D616433312D6433336437353138326631622220786D6C6E733A4D6963
                  726F736F667450686F746F3D22687474703A2F2F6E732E6D6963726F736F6674
                  2E636F6D2F70686F746F2F312E302F223E3C4D6963726F736F667450686F746F
                  3A4461746541637175697265643E323031352D30382D31345431343A32313A31
                  312E3236373C2F4D6963726F736F667450686F746F3A44617465416371756972
                  65643E3C4D6963726F736F667450686F746F3A4C6173744B6579776F7264584D
                  503E3C7264663A42616720786D6C6E733A7264663D22687474703A2F2F777777
                  2E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E73
                  23223E3C7264663A6C693E53656C6C6F2056423C2F7264663A6C693E3C2F7264
                  663A4261673E0D0A0909093C2F4D6963726F736F667450686F746F3A4C617374
                  4B6579776F7264584D503E3C2F7264663A4465736372697074696F6E3E3C7264
                  663A4465736372697074696F6E207264663A61626F75743D22757569643A6661
                  6635626464352D626133642D313164612D616433312D64333364373531383266
                  31622220786D6C6E733A64633D22687474703A2F2F7075726C2E6F72672F6463
                  2F656C656D656E74732F312E312F223E3C64633A7375626A6563743E3C726466
                  3A42616720786D6C6E733A7264663D22687474703A2F2F7777772E77332E6F72
                  672F313939392F30322F32322D7264662D73796E7461782D6E7323223E3C7264
                  663A6C693E53656C6C6F2056423C2F7264663A6C693E3C2F7264663A4261673E
                  0D0A0909093C2F64633A7375626A6563743E3C2F7264663A4465736372697074
                  696F6E3E3C2F7264663A5244463E3C2F783A786D706D6574613E0D0A20202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  0A20202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  20202020200A2020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  202020202020202020200A202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020200A20202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  20202020202020202020202020202020202020200A2020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  202020202020202020202020202020202020202020202020200A202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020200A20
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020200A20202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  20202020202020200A2020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  202020202020202020202020200A202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020200A20202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  20202020202020202020202020202020202020202020200A2020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  202020202020202020202020202020202020202020202020202020200A202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  200A202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020200A20202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  20202020202020202020200A2020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  202020202020202020202020202020200A202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020200A20202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  20202020202020202020202020202020202020202020202020200A2020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  2020202020202020202020202020202020202020202020202020202020202020
                  202020202020202020202020202020202020202020202020202020202020200A
                  202020202020202020202020202020202020202020202020202020203C3F7870
                  61636B657420656E643D2777273F3EFFDB004300080606070605080707070909
                  080A0C140D0C0B0B0C1912130F141D1A1F1E1D1A1C1C20242E2720222C231C1C
                  2837292C30313434341F27393D38323C2E333432FFDB0043010909090C0B0C18
                  0D0D1832211C2132323232323232323232323232323232323232323232323232
                  32323232323232323232323232323232323232323232323232FFC00011080120
                  012003012200021101031101FFC4001F00000105010101010101000000000000
                  00000102030405060708090A0BFFC400B5100002010303020403050504040000
                  017D01020300041105122131410613516107227114328191A1082342B1C11552
                  D1F02433627282090A161718191A25262728292A3435363738393A4344454647
                  48494A535455565758595A636465666768696A737475767778797A8384858687
                  88898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3
                  C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6
                  F7F8F9FAFFC4001F010003010101010101010101000000000000010203040506
                  0708090A0BFFC400B51100020102040403040705040400010277000102031104
                  052131061241510761711322328108144291A1B1C109233352F0156272D10A16
                  2434E125F11718191A262728292A35363738393A434445464748494A53545556
                  5758595A636465666768696A737475767778797A82838485868788898A929394
                  95969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9
                  CAD2D3D4D5D6D7D8D9DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C
                  03010002110311003F00F7FA28A2800A28A2800A28A2800A28A2800A293239E7
                  A552BFD52CB4C80CD797090A0EEC7AFE1401773514F7305B46649E6489075676
                  0A3F335E65AE7C51690B5BE890B0249026950B16F70A39AC4B1F0AF8ABC50CB7
                  57334D144C48335E96DD9EBC267A671E9D296A4B91DEDF7C44D0AC9C08E67B91
                  83B8C4BD31F5C67F0AE75FE2C493CC62B2D277B9E5232DB99BDF8FE5FAD68E97
                  F0AF4BB6447D4679EF6653CE0EC423D3039C7E35D6E9FA169BA5E3EC5630407F
                  BC89F373EFD4FE34EC2BC8E01B54F1FEB01BC8B192CC0048CA88B1F8B649A83F
                  E114F1C6A53C73DCDF084E72435DB6411C13F28F61FA5777E2DD5E5D07C3F35F
                  4088D229545DFF007573C6715CFF0081BC7337882F67D3F5058D6EA35F323641
                  80EB9C11F51C1A5642D4C287E1AEB77B19377AD44B2A90B8C33E083EF8ED8A0F
                  C26D40DC81FDAD07920E449E536F1EBC6EAF4BD53528F4CD3AEAF65C058232DC
                  FF0011C703F302BCB7C23E36D5EF7C63656F7F7CF24170CD1B45B400095E3F51
                  4F41FCCBB37C2FD594A8B7D66374501417465C0E07A9EDFE7BD46BE05F16D960
                  DB6AC09546E16775CE0F03F11CFB57ACE4015C4F8EFC5AFA15BC56963222DF4A
                  7793B4308D077C1E327D2934876312D747F885A55A178F5113EDC318A49BCD7C
                  67A0DC0E3D300D325F1D78B748891B55D12331B2E43BA14E4FB8247E18CD74DE
                  01F125C788F489A5BA2AD3C12F96CEA9B41180471D3BD754F12C8A55C654F623
                  23F5A1242F43CFB4BF8B3613AEDD4AD1EDA51D5A23E60FE86BB1B0F11E93A9C1
                  E75A5F432AF71BB047B62A95EF83B42BE88C72E9D00F999C346363293D4F1DEB
                  90D57E16AC6E25D2AFCA16627CA9DB8F6C11CD3B798B99ADCF500C38E7AD3B35
                  E4169A978CBC1A5BFB42D64BBB152048C58CBEF90DDB8EDD2BB0D27E21E83AA2
                  A86B836B211F72E38FD47143D0A52475F45315D5D432B6E53C820E734FA0A0A2
                  8A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A33400669AC4004
                  9358DAE78974ED062CDD499988CAC49CB1AE2FED9E26F1DC6CFA73C7A7695E61
                  4F30B9CCA338E08193DFDA9584E4916FC41F108C576DA76850BDD5D02577C6BE
                  673E8A3BFD6B3F4BF026ABAF8FB67892F2EA12D2730160CEC318E4F200CFF08F
                  4ED5DEE93A169FA3C091D9DAC71B2AAA34810067C0C658F7AD51814D682D5991
                  A5787349D1D5459584313018DFB72DF893CD6B818A5A29DC120E9452D148672F
                  E3C289E0CD419E312615768233824800FEB5E1BA5EA12E91AB5B6A501FDE5BBE
                  E000FBC3A11F8D7B9F8F63F3BC15A8AEEC7C8873FF0003535E45A0786535ED1F
                  589D25617562A8638C1EA0E59B3EF81FA51622477DE39D7A1BCF00457368098F
                  50D9B371C103EF11F5C800E7DEBCC7C31726D3C59A54DB72A2EA3E4FF77904F1
                  F5AAAAD797B1DAD82CD3796B204811989442CD8F97F135B3E33D222F0C6BB145
                  66F2910C292EF7E7738E491F95249B13699EFB34F1DB5BC93CCE1638D4BB31EC
                  0578969B02F8F7C7D7125E4F2456CC8F30556C315042AA2FA1C107F035BDF12F
                  C4D245636FA4C1279666884D74C3B29E8A7F53F9562693F0DB5BBFD3E3BE1710
                  DA975DD1C4ECD92A7D71D29D98E4CB7F0FF531A2F8C6EB4557596D2E6568D5D4
                  8015D7255871C8238FCABD94B2842C48000CE735F39DEE9DA978375CB57BA555
                  9EDDD2E1761DC0807279C7D457B0F8C35B10F81E7BCB59306EA3558CF5243E33
                  F9293F951EA117A1C77887C75AA6AFAAAE97E1C320467DA8D08FDE4A7D73D877
                  CD501E16F1D6993AEA514D2CB3C658EE173BD88190490C70D9F41EB5ABF0874C
                  0CBA8EACE4162CB6C831F742E59B1E9F780FC2BBBBFF0013E8BA65F0B1BCBD48
                  6E76EE2AC0F00F3C9028B24B50B37A9C7F81FC7175AB6A2DA3EB00493BA9F29F
                  60192012CA7DFB7E0735A5E29F87B67AB234FA6470DA5EB1CB10308FF503BD54
                  97C2535CFC40B4F1058CB6F2581904AEC8E090769C8F7F6C7AD761ADEB16DA16
                  932DFDD13B1000A8A705DBB0146C3B268F2982EBC57F0F92149551ECE7C158E4
                  7DCB9C0CA0E855BF4AF45F0FF8D349F1011143234575804C320DA73EC7BD47E1
                  8D6A3F18E88F35DD822012344D1B10EA78EC7D31FAD733E29F875224CDA86804
                  A4ABC9B756DA41F543FD286AFB0AEE3E68F51C8F5A2BCCBC27F10584C74CF10B
                  F972A9C25CC8A579C0F95C763C9E6BD25245911595832919041C834B6DCB4EE4
                  94519A298C28A28A0028A28A0028A28A0028A2909E0D001915C7F8D3C670F872
                  0FB340435FCA84AE7A463FBCD4BE32F18C5E1FB66B7B6656BF6FBAA79083D4FF
                  0085727E08F0AB6BB76FAF6B225922F34342920FF5CC39F31BD876EC6A512E56
                  645E1CF0BEA7E2F9D755D76698D8339758DFEFCDDBF01FD31DABD46583EC7A54
                  915842A8D1C4C208D4606E00E3F5A6D96ABA6DF4F35BD9DE413C901024489C36
                  C3E9ED5A0483557EC249753C274BF1E6B3A5EA2669AE64BB8D8FEF6191B218FA
                  A9ED5EABE1BF1869BE25801B67315C0FBD6F27DEFA8F51F4AF28B67B3F0FFC44
                  997538E37B259A68E5DF16E015810AC07E43E9543519ADA2F104AFE1992E044A
                  E1EDC229DEBEA5475DB9CF5E71536B31733EA7D100D2D796F853E25B3CD169DA
                  E2FCCC76ADD8F5E8038F5F522BD3D581E41E2A8A4C7D07A526690918A5743286
                  B1A72EAFA45DE9EEE556E2368CB0ED9E95CF782FC1EDE195BE79E64966BA7507
                  68E0228207F3ADFD475CD334B4CDF5F4107B33F24FD2B99BBF8A1A0C591079F7
                  0C3B2A607E669A90AC167F0E6C2D7C4A75749A431090CB1DBED1B439F53D5802
                  3A56CEAFE16D2B5DBAB7B9BFB7323DBFDDF9F83FEF7AD71F27C5A324816CF449
                  A556FBBB9F25BF000D44DF153505E0F875D5B3D0BB8F97FEF9F734EEFA12F951
                  D4EA9E05D1F59D71755BB1399832128B26158AF4C8F4C76AE980C003000ED8AF
                  35FF0085B2D1C8A6E3419A38B1C93291F90DB8ABF67F15F479D88B9B7BAB7520
                  15254386FC052BBEA3B2EE4DE3EF085DF88C5A4F61E51B984953BD8A8DA4E41E
                  3AD68DFF0086FCEF020D1061A582D95636EA0BA0C8EBEA47EB5674EF18E83A9B
                  05B6D4E1DE780927C849F4C1ADB122C8859082BEA0E453B89A3C67C0BE2A8BC2
                  D7B73A76A68E904F2AFCF8E629318C30F4E9935A3E3FB7F0EDE58C9AC5A6A30B
                  5FB320C432EEF3003CF4E9D8E7DABB0F1278234DF11665915A0BBC604D18C7E6
                  3BD7176FF08EF048A2E3558C44B91FBB8B2D472DC1DED62C7C2459A28356BC76
                  096036A73D03AEE271F4047E9595E31D7E5F16788A0D1F4B71716C87645B7859
                  A5C64B67DB1FFA15753E254B7F067C3E3A75A619E7C40ACE39727EFB1F7C03FA
                  5637C2BD11A4BAB8D6A4561145FB980F186FEF363D3A0FCE862B9E8BA36996DE
                  1FD121B488A2C50479773C64E39626B94BDF8ADA4DADD9861B59EE2356DA6418
                  5DDF407AD6B78B3FE273E0BBE1A64C27DCA1BF74C0EE504123F215C6FC36B7D1
                  755B3BFB1BFB3825BADC186FF98BC78C6467A1CE7F4A92969B1ADAAE99A378FE
                  C9AF349B848F53893A38DA48F4917AF5EF5CE787FC5FABF856FE3D33578E56B2
                  4CA18D97E641BBAA93D40E401D0F1549A26F067C47B78E2B82D1433C6ACD9C13
                  14800DA7FEFAFCD6BD5BC45E17B2F11D988EE014B84CF93301F329FEBCD3B5F7
                  16CF4362CEEE1BDB58AE6DE45961957723AF423D6AD578E683ADDFF8135A6D1F
                  56576B277072C73B33FC6BE83D6BD7E39124457560548CA907AD1B6E5A7724A2
                  8A2818514514005145140066B9EF1678921F0EE94D202AD77202B0467B9F5FA0
                  AD5BEBE834DB29AF2E1B6C512EF73DFF000AF1A985EF8F7C5B1463CC8EDD9B6C
                  8554B082319EE38048E9EF412DD897C21E1EB9F16EAE754D458C9648F9695B3F
                  BF7CE4A8F61D0FBF15EB5A958BDCE8F73676D2181DE1648D947DC24718AE6751
                  F14E8FE0B4B7D1E080B0895159232008D4F73EA48E7F1ADBD23C59A3EB6AA2CE
                  FA3694FF00CB263B5FF23CD1A2D094783D9DFDEE85ACFDA6176B79E2936C8376
                  791FC247715EE1E15F1559F89EC449132A5CC6313424F2BEE3D56BCE7E27787D
                  EC35AFED48500B7BCE5DBD241D78F71FD6B0B4FB4D6742B2B1F13583FEE24DC1
                  5D3E60B8620AC831DF9FA52B5B6127DCD8F89FA69B5F12FDA32596E63128E318
                  EA31EFD17F3AF44F07F8774AD274AB6B9B34124D3C28CF72DCB4808C8E7A77AE
                  626807C4FD22DAEA075B3BFB297CA99645DC002324F1FA57A2697629A66976B6
                  51BB3A5B42B12B3770001CFE54D0ED7662EA7E04D0356BB5BAB8B4DB26417F24
                  EC121FF6B1D6BA2262822258AA468392C7181D2B275FF1369DE1CB612DE4B990
                  8F9225E5DCFF008579FCADE26F8898F2E3163A433020B64023D71D5CD0DDC774
                  8EA759F88BA3E9ABE5DA937D72490A911E33FEF1E2B9898F8E7C5FB99636B3B1
                  63F2A13E4F7FFBE8F4EF5DA681E0BD1F4055686DC4D7400DD7330DCC4FB761F8
                  62BA30A07E1C74A2C2D59E6BA67C2787CD59B57BE7B8723E68E205467DDBA9FD
                  2BA8B6F03F872D23089A4DBB638CC8379FD735D20A4C63934EE1C88AF6F6505A
                  C6B1DBC291228C05450054DB10F247278A7D2138ED45D8D45113C08E0028A7D3
                  22B2EEBC2DA2DD97F3B4BB572E7258440127D735B201239A5F6A7762714CE1F5
                  1F863E1FBC05ADE192CDF8FF0052D90707AE0E6B0DFC09E25D0E6F3745D65E64
                  50C423B3291C71C1C83FA57A985A42BCD20B34793C3E3BF12787E65875CD38BC
                  4C060BA794DC75C11F7BF1AED7C39E2FD33C49137D9DDA1B84FBF6F2E032FB8C
                  7DE1C7515BB736B05DC2F05C449244C30CAE320D79B6B7F0CA64BE6BBF0FCAB0
                  8186489988DADCE769F4E9D680BF73BCD6B43B1D7ACFEC97F1178B258618A953
                  8C718FAD64789AC8E95E01BBB3D282DBC36F0055009F96307E623BE704F35C86
                  8DF10F53D12EC693E22B77731B6D7949C48809EADD88F4C735E9F6D716BA9D8A
                  CF6F2473DBCCB90C39073EB40FD0F39F851731FD9B54D3A597E6F303A465BA2E
                  369233EF5CEF8BB499BC17E2882F74A984513169EDCF38523EF29F51FD18D747
                  E21F87F7B637A354F0D48C8EBF30855F0C0E73F29E847B1AE73FB07C59E2BBD8
                  ADF5386E435AA05592E46D55F7FF0068E0734ADA5847A358693A3F8A1F4BF144
                  B67FE9451655E4E37818191DF0718FA569F89B589341D125BE8A0133290A431C
                  28CF76F6FF001AB7A4D847A5E956D62872B046101E99C753597E31D66C34AD02
                  E96F1E32F342CB144C325CE3038F4CE39A6F40E86624BA4FC45F0D3ED012ED54
                  2BEE5CB42E4640E7B1AE57C35E28BFF096AA746D6C91668C5189EB01CF0C0F74
                  C75F4E3E95C9681AD5E685AA8D4AC9649220E12655C8128FEE67A67D2BD17C53
                  6765E31F0C26B9A4C5E6DCC6BF3AA8F9B68192AC07248CF1E84E696FB8AFD8F4
                  7475650E1815600820FAD495E67F0D7C54F76BFD877526E785336D213CB28E36
                  7BED18E7D2BD2F34169A62D1482968282909183CD2D739E31D73FB0741927424
                  5C4A7CA840FEF11C9FC064D026CE17E206B573AB6B29A1E9E7CC45755DA983E6
                  4A4E31CFA703F3AEFF00C39E1FB5F0FE98B6D002F239DD2CACA373B7BFF2AE1B
                  E19E846F2F66F10DCB3C9B1DA383CCE72DDDBF0E9F5CD7AAEE51DFF0A1684AD5
                  DCF3FF001FF8365D623FED2D3D73771A6248F1CCCA3A7E38CFE95E3C567826C6
                  5A1915B1DD483E95F501C115C0F8DFC089ADEFD4AC404BE51F3C7B7E5980E47D
                  1BDFBD1626499E69AA5FF891B48B7B5D55EE25B17DB3C0655CEE014853BBD0E7
                  38F6AEA7E18EA1F6892EBC3F76826B2B88D9C239C8046370C7BE7350F813C42F
                  0DE47E1AD4E2FB45ACB2948E39577185C64E08F43E9D8035E95A5F85B47D22F5
                  AF2C6C5219D976965C9C0E3200E8A381D00A6B6122CE8FA269FA1C1245616E21
                  591CBBFCC58B374EA79E2B17C5DE36B6F0FA1B5B60B71A9C836A420E7613D370
                  FE9D6AB78EFC5C346B5FECEB362DA8DC2E3F7632D103DFEA7B0A83C17E085D38
                  26A7AA47E66A2E4BAAB124459CF3CFF11C8CD1B97B6C51D17C0D79AD5E0D63C5
                  33C92990E56D49E587A3FB7A2D7A4450A451AC688151400140C014F031D071DA
                  9C2804BB89D28A5C5140C0521A5A28013146326968A00292968C5031334B4521
                  3484068C0C5377A9E334D69511955DD01638033D698191ADF8674BD76161796A
                  865C616603E7538E307BD79B4536B1F0DF5868E557BAD3266CFDF2038FEF03D9
                  FDABD8430604E47155AFAC2D752B47B6BC852585C72AC3A7D3D2825F915B47D7
                  2C75DB21736328707865EEA7D1AB480041C0CD7925DE8BA97C3BD522D4ECE596
                  EB4C2713A6EC6E078C38F5C1E2BD334AD52D357B08AF2CE40F149D33D41EE08E
                  C7DA80462F8CBC570F876C5A38DB7DFCC87CB5047C9C7DF3E98F4EF5E71A3E89
                  AC7C41D5E4BFD426912D9080F3B26030CF08807EA6BB9F107C3D875FF108D466
                  BE956091544B10EBC0E02B76CD761696B059DB476F046B1431285445E1547A0A
                  61AB338F86F4BFEC43A47D8905991B7CB031D075CFAFBFE14DF0EF86AD7C396B
                  3DBDABC8E934A6460E7B918C7E95A37FA9D9E97079D7B711DBC59C0676C67F0A
                  F38D77E2AE59E1D12DF247FCBC4CBDBBE16A5B2AC8A5E3DF0F4FA0EB316BBA6B
                  986191FE6318C08A4EC4FB1E95E8BE15D6D7C41A05B5E90165394957D1D7AD73
                  3E15F11DB78E345B9D275654FB5AE55D54637AE7875FA5735E16D4E4F0878C65
                  D26EE52B68F218661BB2AAE7051FF1E01FAFB53E84AB267B4514C0D9EFCE69F4
                  8B1BD8D79A7C41F375CD734CF0FDB27CC5C333EDDC17771B881D80CD7A674155
                  0595BADEB5DAC09F686508650BF36D1D89F4A04D18379A45C69BE039B4CD38B1
                  9E1B5D8AC8B8673FC447FB4DCFE26BC4E25D46E7538EC2DDA63732C9F2C4242B
                  97F7CF435F4A11C1F4C57997C43F07C6F136B9A7C4C9708774EA9C03FF004D38
                  E72391C7273435725A6B6392BDBFF18F85444B7B737506FDC519A6F3010303A6
                  4F7A9CFC44F16C7147279ABE5B0CAB3DB0C363AE0E39ACDD385D78ABC43A658E
                  A7A8492A12B199257C9DAA32473DC85C7D5B35EF71DA4096F1C0224F2A301510
                  AE42803000A60B538EF04B8F1024BAC5FE976697B04E6386E604DBBC606E38CF
                  5C9209ADEF14EBD1681A3C970CEA27752B029EEF8FE95ACEF15ADBBC8C5228A3
                  52CC4FCAA07524D79569D1DD7C40F16B5D5EA2B58587400111B10D951F8F04FB
                  5202E780BC37717F7C9E26D559A4DC0F92253B8BB67FD61F4EF81EF9E8057A80
                  005448AC8A01C1C7A71ED530A634828A28A061451450014518AC5F11788AD3C3
                  5A69BCBB059721422E32C7BE052036A8A82DE74B8B78E64CEC9143AE7D0D4F4C
                  028A292818B9C5715F107C4B7BA059DB45618492E377EF4AE7601B7A0F5E6BB3
                  62075AF3BF10CF677FAFCFA9DE3BBE9BE1E519418C4B724E420FFC7411F4A44B
                  661F84E0D535EF105EDA6A7AC6B10BC3002C82668DBEF71BB8F9719E00C1EBCD
                  76EDE04D05E6599EDE79251FC6D73212C7DCE6A3F054177776F3EBFA944A97DA
                  8B02001F7215E2303EA324FD6BAC193E8299293671C7C016D684BE91A9EA1A6B
                  E491E54DB97FEF93511B7F1A6896C3C9BAB7D5C062ECB247E5C9B40076820E32
                  704576EC38EB47B914156391D3FC4DA4F8984FA3DDDACB6F70C18359DCA61881
                  E99E32073F4E6B8EB79A5F873E3492194BBE91760063C818EA1BD3239045753E
                  3ED0CCD6075AB26F2350B006449178DCA3D7D48ED4B341078FFC0D14CBB05DB4
                  595207FAB980C30FA678FC6811D843224D0A488728CA194FB1E95C778DFC5F77
                  E1E78EDACE04F31E3DFE739E0738C01DEB3BE1BEBF31337876FCBADD5B64C3E6
                  1C9283829F553FA56A7C46D18EA5E1EFB4C6A5AE2CDBCC03FBC87861F8707F0A
                  013D0F3A4D1F5EF1659DEEAFE7BCFE4E02461B73B9383851E983B89F6ADBF853
                  2D88BCBCB29E1417C4168D8AF44E8CBF5CD687C2BD650C173A3C8AAB2C6DE723
                  01F7D480083EE08FCAA3D67C23A8699E3AB1D5B46B5796DE4B85965546DA1304
                  061F420E7F034217430FC57653F83BC631DFE9A0C11CBFBC8767DD3EA87F5FD2
                  B53C7DA7C3A9693A778A6CC652644F37031C372ADF504907EB5E83AEF87AC7C4
                  762B697A8DB51832B2360A91E86A47D0EC8E83FD8AB1EDB410792ABD703A03F5
                  14058CCF026B7FDB3E1D8FCC72D736A7CA949EF8E87FEF9C57535E4FF0ECBE8B
                  E2ED4F469F70327CA9CE46E424F3F55271EC2BD63341716154EFAFED74DB392E
                  EEE511C11804B1F7E0003B9AB67A5794FC58D6B6C9069A8495897CE9154FF111
                  F28F7EE7F1A43B9D11F899A08BA580FDA9149C091A21B4FE20E47E22BABB7BAB
                  7BEB28EE2091258255DC8CBD187A8AF2ED67E1FE9BA5F82DAF9DE71A8C51A33C
                  85BE52C5B95C76196FD2B93D27C6DAC683A73D8D94D1246CDB93CC8F26263D40
                  FAFA76A64731D0F8DBC1F268373FDB3A6EEFB18937B04054DB367208C76CE719
                  EE715E9BE1CBABCBED034FB8D462F2AF258434AA077EC7D89001C76CE2BC86CA
                  D7C5FE309D7CC92F1AD1D82B4B236C8D5377DE038C9009C60735EDCEEB6D6C5E
                  460123425D88E800EBFA500ADD0E13E257888DB5A268964C4DDDD150FB3F8549
                  C01F89E2BAAF0DE890E81A3C361110CCBF34B277773C93FA62BC92DEDB58F18F
                  8B2E6FAC1118C33890C92B1554C10138E79C2E31ED9ADFBFF1B78BB409CC1A96
                  9B6EF81B8BEC620AFB3020763DA8D6C17573D54609C77A5E3D6BCCF4BF883AFE
                  AD2BC567A14172F185691239B0501E075F706B65BC5BAEC6E43F83B502A33929
                  229FCA96A55D58ECCD15C4A78EB50FB379F2F84F55540B962AB9FE951C7F126C
                  15952F34DD4ADCB9E034391D71C53D42E8EEA8AE49FE21E831C65E692EA25071
                  992D9D47F2AB7278DBC3B1A02DAA45C9C1F95891F862803A1270335E6FA9447C
                  5FF10A1B00049A66979FB4FF0075981C95C7FBC00FA29A4F12FC4DB58ADE4B7D
                  155A699D302E0F017DC77349F0D359B08F48BA4BABC823BBFB433CBE6BED2471
                  F364F5E4E3F03EB4AE84DA67A42A8450AA3E5180001D074A7D528B54D3EE0131
                  5F5B4817A95954E3F5A92D2FAD6FA3325ADCC53A0382D1B8600FA7145C659A0F
                  4A89E68E2467775545192CC7005721A978F20178BA6E896CDAADFB8202A1C463
                  1D4963C501737F5CD561D1746BABF98AED8109019B019B1C293EF5E6DE0ED0AF
                  B5D5867D4E451A1C53BDC7924E0CF3B104EEFEF2E71D7A9AEC2DFC2A2FEE4DFF
                  0088E45BDB9651B6DBFE58DBFA851DFDC9F7AC5F896B7AD65A7E99A75ACAD148
                  C5CAC51EE00AE368C0F4EB4C93D091551142E02818000C7D29FD0D7836987C61
                  F67365A7FF0068E23732154DE00F6CB71F874AEBFC3BA678D2D3598754D454DC
                  472A18E5864B9C10A4FDEC723F0A577D42F13D33231D68AC3D11B588A1B91AE3
                  41BFED0DE4187BA1E83F33C559D4F5ED3347B7335FDEC7127605B2C4FA003AD3
                  1926AB25B43A5DD3DD0CDBAC2C645EE571D3EB5CDFC358258FC2492CBB556795
                  E48C2765381FCD4FE75957B79A87C40B88AD34879AD7425502EAE1D0A79D9619
                  45E79F947D39EFD2BBEB3B68ACED62B6B78D6286250A88A3EEA8E8280B1E69F1
                  03489347D66DBC4D64DB5CCC19F03215C74FC08E0D7A1697A85BEB5A34179100
                  629E3195F7C60AD47E23D2975BD0AEEC4805DD098CFA38E57F5AE2BE176A72C7
                  25EE873A60464CC9FEC9CE197F3FEB413B31DA7781B50D23C7705FD934634F47
                  66C93CEC6046CC77C6457A14D756D6CA7CE9E34DA32773018AC7F16D96A9A868
                  325BE912B4574CEA432C9B0900F2335C0D87C33D66F59CEABA8AC08790AAC646
                  3EF9CD1B8D68763A97C41F0F69D218BED4F3CA3AAC09BB1F89E2A968FF00126C
                  B59D660B08ECE5896662A923B0E78CF6AE23C1BA2D83F8E6E74BD4905C2C6B2A
                  46AE301D9580C919F63C56C7C41D16DF403A7EA5A45B2DB6242AC215DA377553
                  ED8C1E3BD017627C4169343F17E9FACDB290EFB64651C0731B0C8FC54815EA96
                  D3A5D5B453C64149555D48F422B84F88D6F1EA7E10B4D4963626378DC30EAAAE
                  003FFB2D6A7C3BD41EFBC236CB20F9ED98C0493D40C107F22281ADCEB0F4AF06
                  F1B49763C617773343B424E0C69283B5D5785181D8E07E75EF44641AAF736B05
                  E4463B8863963FEEC88187E4680699E33E24F888FAFE8B1D84766F0EE2A66766
                  043118E98E8339E2B73E185AE852E8EEF2ADB4BA9B4ACB279A4160A4E14007A0
                  2318C56C6ADF0C746BEDCD6BBAC9D9B2FB0EE5C7FBA78AE4EFBE136AB6DB9AD2
                  EADEE973C263CB623F2238A56645FC8F62545550170060631C573BE39D4974CF
                  0A5D311B9AE3FD1D31EAC3FC01A93C2167AAD8E8890EB33B4B765C91B9F7945E
                  00527BF426B85F8B1AB09AEADB4F8240C6DC179113A97230ABFE7D68BB2B448E
                  93E1869B1DAF8596ED5CB4B7923C8E48F42547E833F8D755AADABDE695776D16
                  37CD03C6A5BA64A9009FC68D26D23D3F4BB5B58D3624512A818C76E73EF9ABAD
                  F3034C12D0F3FF0086370534DBAD3AE1228EE2CE531E0A6D9190F3CE79C06661
                  F8D7A0F15C46BFE15D446B0BAF787E648AFD7868A450164CF5C9F4E99FA53E4F
                  18EABA65AA1D53C357BE6F467B621D09F6C1C8A0134B73B3C1EBDB1EB4D65070
                  48076F72335C3FFC279A9CF32ADA784B539011B8965DA73F88E956F678CF560C
                  4CF69A340E06D554F3A500F5CF6CD03BA343C45E21B0D0EDB33A7DA2E98622B5
                  8F05DFE8315CC7F606B7E30BE2DADC434ED2633986D61C076247249EBEC49C7B
                  015D8E97A0D9E9419D15A6B990832DCCBF349237A927FA56B63140ACCE557E1F
                  786D4B13A6464326C2092401EA3DEA0B3F873E1F82CBC99ED45CCACA15E6919B
                  2718CE0678E4576549F85171F2A3859BE16E80CC5A1FB4C276328024CA824FA1
                  06B9A3F0CB5EB5BDC595EC42227FD6895931CF52A3AD7AF6297140AC79D45F0E
                  6F6FAC1A3D635BB99262D9558D8B46AB9C9E0F538CD258FC316D3E68AE2DF5EB
                  B86E173BA48634538239C71EB8AF46C0A38A02C71EFA0789D2F8DC45E2890C7B
                  91444D6CA404046E247427E8052DE687E2A7BB125AF8982464B1C496AB940482
                  000383C7AD75F8A08A0394E1A3D23C74669C49E21B658640DB596004A9ED818E
                  3F3A593C3FE309ED9A36F148196C065B7084AFD4722BB7DB93ED46DA770E5671
                  171E02BBBF895351F12EA770170760C2AE7D80A9AC3E1BE8366DBE6865BB93B9
                  9D890C7DC0AEC738A504633DA90EC436F0476F0AC312048D06155780054B8A5C
                  8A4CE78C7EB400671DEBC92F2297C3BF156DE48BE58EE660DF37465909040FF8
                  1122BD68A8C579AFC568CDB9D37508462642EA1BD082197F5068133D281C8CD7
                  3BE28F14DAF86EC8B3E64B961FBB840EA7D4FA0ADAB1BA179A7DBDC81C4D12C9
                  8FA8CD79AEB5E0DD575EF1B5C7DA19D74F69558CCC78F2F1F754763C6DFC6903
                  D8E2E09B568A45F11A2485C4E5FCD11931972C4B0C8E9EBCFAE2AD788BC5DA87
                  8BFECB6496C8843E160872774846339F4ED5EE16DA7DB59D9259C5122DBA2ED0
                  9818C77CD430E9FA4D83B4B0DB5A5BC9C29655553F9D5585666749A248FE01FE
                  C7972D28B11163A9DC14607E62B93F84BA81FF004FD39D8EE2567419E830030F
                  D457A32DD5BDD4130B5B88E42A0AE6370707A7F3AF2AF85DE5C5E29BC4C61BEC
                  C55415E7861C67F0A4C7D51EB77330B7B796661F2C6A5C8FA0CD784DF6A9E24F
                  165DDD5D5AC776D1DBFCF22C1210B08E46000793D4F4CF19E95ED7AD5CC767A2
                  5ECF29F91207CE3BF04579C7C30D5F4DB0B3D46D6EAEA282E1A559B323850C9B
                  78C64F38C1FCC521B660683E3ED63C3AB3D95D87BB4466558A7C8789F278DC72
                  7AFAE78F4AB37BE3FF00107882E459E9E861677CC715A29DED83C64F5C7D3158
                  73436BAF78E9E18A4315BDEDFB224883254331E40FF3D6BDCF47D074CD121F2F
                  4FB286DC30192AB8661EE7BD0AE1A8787EDAF2D341B1B6D464325DC7084998B6
                  EC9EFCF7FAD79A6BF68355F8AF059C71AAE6E23763D4ED50AC48FCABD80E00E9
                  5E5F6C824F8D6E4B7DC591B3EFE5E31F91FCE9899E9EA334EE2907159973E22D
                  1ECEE7ECD71A95B473F4D8D20CE7E940D6C6A52119EA3A735CF4DE38F0E42A4F
                  F6A44E41036C79639F4E055293E23F87500C5C4AC7A10B11A570BA3AE2A3834B
                  815C349F1474042760B9603186118C1CFE3DAA94FF0016ACA1B858BFB3A760C3
                  3B84838A61747A3714B5E5777F174ABFFA369AA00E089A4C1FD2ABCFF15B5199
                  02DA69B1063C163B9CFD428A05CC8F5BA323D6BC69FC61E35D4544705B4E9B8F
                  063B6DADFAD1FF00170EE42A8FED105B395F9578CFA9E29598731ECB91EB4D2E
                  AA092C001CF26BC9C786BC797717937178522037006ECE59B3D4919C1A745E03
                  F13DC28B7BDD597C9656C83233679FBA47E6DDFF000A760E667A68D4AC9A3320
                  BB83CB1D5B78E2A03AF692B2344DA95A8917AAF9C2BCEE0F85376BBC4BAAC4A7
                  AA3246723EBCD3EC7E18DB1BC9A3935EF31940DF1C280302DC65B9EF86A41767
                  692F8C7C3D1052FAADB60AEE1CE722A84BF123C330BE0DEBB0F5485B1FCAB253
                  E12E9AB1053A95E9C367202AF1E9D2AE2FC2ED000E1EF338C67CD1D7F2A0351D
                  27C50F0EAB611AE9CE71F2C06A9DCFC56D2E3E2DACAE66C8272DB540FC09ABD0
                  FC31F0E450EC6867933DDE76CFE845681F02F869A1584E916DB17FD9393F53DF
                  F1A63D4E464F8BF9C793A46411CEE9FBFE5551FE29EB52B30B7D2EDB00E0905D
                  981F4E473F857A747A369D08411D85B2ECE53110E3E9528B1B646056DE152393
                  FBB1D6803C91FC57E35BED863B59E219C1F2ADF1C7A723F5A73C3F1175053BBE
                  DA8920391B963CFE1C62BD840E39A5C7B50079E783743F15E9FAA7DA755B926D
                  4C7B5A179CB93E9EB822A6F8AB007F0D4126788EE3047D54FF008577B8F6AE4B
                  E22DAFDA3C1D3B9F9BC9923723D7E60A7F46A04CB7E08BA7BAF0769923672B17
                  97CFA212A3F90AE73C717DE2A83578E0D245CADA14DCA6DD012C472D93DAB77E
                  1E4663F03E9A08C1224EBFEFB565F8FEF3C4562F0CFA4B4AB682322568937156
                  27A9F6E94C2F64722DA678F754812375BE0B8C7EFA5DA0E7F1FE94F83E19788E
                  4399EEADE30FB99B1216F9B1818E3F1ADFF0F7C4E82544B7D6D3C99C706E107C
                  8DF51D8D77561ABE9FAA26EB1BC8A7180C446F9201F5145C1338CF0B7C3BB9D0
                  6EE3BB7D6255718F321B75DA920FEE9279C67D31581E0311DAFC44BB863930A4
                  4D185ECFB5B83FCF1FF02AF61C0C578F6896E2DFE2FC8830A91CF3E01EE18363
                  F9FE9481A67A96B1A70D5749B9B1673189936EF033B4E735E4BA8FC2BD6A3903
                  5ACB693A9CB60B1439FA6319AF6AED4CC0FAD0368F0397E1F78AACA4574B177D
                  A772B4328CA9EC41CD5DD37FE13FD3E64FB3C1AA15565CC520257DC1C8231EF5
                  ED1F6CB5373F6533C7F68C67CBDE3763D715CF78DBC492F8674B8A7B689249E6
                  976AEFFBA303273F952E564DBCCE9A36631A6FE1C81BABCB2C9C8F8BD34B2939
                  8E4940F64F2CF3F962BD03C3DABAEBBA0D9EA4A9B3CF8F2C9FDD6070CBFF007D
                  035C25FA1B0F8C1693B61629D863038F9936E73EED9FCE98DEC7A3D85FDB6A56
                  30DEDAC81E0997746C38C8AE164F8536B25C4B23EA73ED724ED58C03C9CF27DA
                  BD0218A386358E240A8A30AAA30147B54DC503DCF3BFF854BA617DCDA85E6300
                  6005EBEBD2AD47F0ABC3E80177BC91F3CB1987F857754940591C8C1F0DFC3700
                  19B26971DE4958FF00222AC0F01786C4CB28D2E3DEA49FBCDCFB75AE98714679
                  A2E2B2326DBC39A3D993E469B6C849CFFAB07F9D5F4B58633F2431AFA15502A7
                  241A381DE81D90DC75FA5721E21F154BE1EF1369D6F3247FD977119DF21EB1B6
                  719FA723F3AEC31EFD6B92F1F689FDB7E1F730C3E65CC0774631F311FC400FA7
                  F2A034398F1C78CAFD3593A669170D1C70AE6478796673D81F6AE56F3C55E299
                  F49F2E7B9B910A4BB4CDB5958B91F74B0E3B1AEE3E19E83259DA5D6A17D69E5C
                  D348A2159530C8807500F4073FA56D78EB44975CF0FF00916AA5A686512AA2F5
                  6E186073D79CFE149A62B3B9E7126B5F63BDB383C3DAC6A0CF310921B97C2076
                  1B471D3AB1E7AE4FB56C7813C3DE23D23C58935D5B4F05A14712B970438E7683
                  EBC9EB54B48F873ADCFAA4125DC4969044E92B1660DBB043600078E95EC4668D
                  4952CBB80C919E714EC2B93039147190055792EA08A069E5963489012CECC005
                  006793F4ACFD5BC49A56896D14F7B76AAB2FFAB2B972C319C803AD3B02923631
                  9A5C0FCEB0349F16E91AC492A59DD65E252EF1BA6D200EFCF6ABF69ABD95FE97
                  FDA3693ACD68519B7A1C8C2F5A452923409C527535E7979F15F4EB7204165713
                  82090DBC0A4D2FE215FEA835190690B1450C0ED03B39DAD20C6109C753B8501C
                  C8F45DC338A3AF4AF1FB9F89DAFC3A87D95B4EB7865F3163F25D58B67763D6BD
                  754960095C66804C90D72FE3E765F065FE08F982827FE06B5D39E95C3FC4FB8F
                  27C2BE56EC19E745FCB27F9E2806697805597C11A50720B345BB8F7626BA4600
                  839E7B5617836036FE0DD2118FCDF6643CFB8CFF005AC1F1878EA5D0EFA4D3ED
                  21469D50334921F94679C63E94C57B6E72FE23D121D47E232E99037D992E5806
                  2983D1093C76E47EB5977705CF8275B0B63AAC73EE4C99623CEDCB00AC33ED9F
                  CAA3B4D2BC43E30BC6D4EDD1C33B92D3E70324638F6AEB34DF84E19F7EAD7ECC
                  C4F2901C6F1CF563CE7A516158D9F03F8BAEBC4325C5BDD2A3B42370950633EC
                  7D2B93D28349F19A5D8BB825CCFBB83D30715EA1A3E83A7E856BF67D3EDD6253
                  8DCDD4B7D6BCD3C2AC24F8A771204650CD70D927DFBD20D4F5F638AF34F08F8A
                  66FF0084B751D26FE795C5C4CED6E642582956C6C03B0DA33FF01AF4A22BC7B5
                  FBA3E0EF88936A8B64B32CCBE620DC46770C361BF3FCE81B21F1CDDC9A57C458
                  2F7253CB6866539E028C06C0F4E0D76BF11AD3EDBE1095D42B790EB37FC07952
                  73FF0002AF29F17788CF8AB544B95B5FB32246218D4B6E2C324FA7BD49278A7C
                  45A968F1E885DA7840550123FDE301823247F938A5726FADCF43F855A909F44B
                  9D3D8FCF6B3165FF0071B91FAEEAA5F12A4FB0F88347D411D84B17CC3D00470D
                  93F5CFE1537C2BD1B52D323D4AE2FED64B68E768C4424E0E1436703D3E61F8E6
                  B57E24694350F0CBDCA90B35A37980E3A8E857F91FF80D31AD8EBE1956689244
                  3F23A8607DAA5AE57E1FEA4BA8F846D307E7B606DDC7A15E9FF8E915D50A0684
                  2715526D46CEDED5AEA6B9896DD7832171B7352DD7369360E1BCB6C7E55F3EE9
                  856F353D3F4D9EE592CDEE143EE72573DCE3B1FE1CFF00B54033DAB4EF1868BA
                  A5D7D9AD6EF329FBA1D4A6FF00F773D6A8EB9E3ED2343B96B5732DC5CA1DAEB1
                  01853EE4F02B0FE21E8DA4E9FE178E6B7B58ADE78A4510EC1C904E48E39ED5C4
                  699A2DC5F34379A66A964F78430920B8214A7047718618E87AE4F6EB40B53D1A
                  FF00E2469D068F6B7D6D0CB23DC3B22C2C7695DBF789EA0F51507863C7F75E21
                  D6D6CC69812DD90B09237DDB31CE5B23EEF41C7F7ABC7EE64932D6ACEDB22662
                  AA186327EF63B63815D8F8062D3EC758B5D4AF35AB780ED644B64243B16046D7
                  247033C81EB81DA9095CF42F1A78AE4F0D25B086D96596727EF9E001FD79AE6B
                  FE13ED6348D6D2DB5BB6B6303005FEC841280E70C39C3738CFD2A6F8B16D27D9
                  AC2F1492BB8C4500CFCC48231FAFE55C96A5E18BDF095EDADEEA36F15ED9E4B3
                  85058371C823A8E09A63EA74B67AF78ABC637F78BA45C456569071C81904F2B9
                  EB92707BF158FAAF8F35AFECF934AB92F05DC52959258D806E382AC3A6739E9D
                  8557D16EAEFC0FE279927B7B89612A46C562AA41FBAF9E84E33D47527D2A9EA3
                  A56BBAFBDCEBE34A9BC8B990BA8033C1C72AA4EE231DC639FAD17B0AC51B3F14
                  EAF657EB7515FCE651FF003D24254FD41E2A3D4358BAD4B52B9BCBB1203720B8
                  8C485369FBA3047F748E9ED56B4EF0A6ADAA8B2860D2A580CD21F32E64C85DBC
                  65883D3039F7CE0722BB9D27E1D0B1F13EFBB2971A4C36EC0194FF00AC66E0E5
                  7B6304E7B678A425138CD32E2F2E7C29AE2C923BDAC6D098C03C0977F07D86D0
                  473C1257BD54D2C1D6756B382EEE0A43830C1C92030070A06785CE0647AD7709
                  F0EEEEDB56D46DADA78174CBE82441BCF3BC90CA08F6207E02947C278CE9702B
                  EA4EB7C993238505091C803B8C631924E7AD3D476B1C1EA10DDE87A8988C53D8
                  4FE515746E4156186DBD8A11D3E95D4F857C530E9DE0AD6AC5A68E2B88C33DB8
                  66059CB83C7FB4C304FE2B57ACFC03677D2EDD5FC442EEFCC676245206080772
                  09C9C66B1C683E0B86E62B79BC4B34AC705D962CA93D396ED46A16B1C5EE3BD7
                  68632173C93D0D77DE16D534EF0F58DC5CCDAE8BD2E8CE9A5C485834A76FCCC5
                  8751B47A7D4D74977E16F03EE3653324135BC425902CC43B21E858F7E9C62B98
                  B0D4FC0767A92C71E9F772DB2A95371312E18F04165EBD01FAD1663D0A1E1DD7
                  34D5F14C9AD6BC642C58CA8634CA8949EA47A00DC7A62BDC6CEEA1BFB386EE06
                  DD1CD1AC88D8FE16E95E571EBDE01B6D4502688BB198E66640CABFF013F4AEAF
                  44F1FE97ACEB50E97690CE82443B19D40195192B8FA53B204D1D91E86BCC3E2A
                  5CA4F73A5E98B9F35C9239E32E42AFE3906BD389E2BC9261FF00090FC5D1193B
                  A1B260DC7FD32E49FF00BEE9147A95A402D6CA183242C51AA0C7B002BC9358F1
                  76933789277BDD12DAEA13295F34B624DABF28E7A7403F3AF4EF11DFAE9BE1CB
                  FBA240D90B0527FBC4607EB5E4DE02F0D597892F2F8DEAB7936C142A21DB82C0
                  E39EF8028259D9E89F10BC36D1FD94674F8A362B1A3A6D423EA2BAEB3D574FBD
                  DA6D6F2DE6C9C0092027F9D70EDF08F4CDB188F51BC47FE26E0EE3FD2B267F85
                  3AB5A956D3F5184956241F991FF31C503D4F5992558E36727E551935E59F0D2D
                  5AF3C4BAA6A92A7DD0C013D99DB711F95754EF7BE1FF00004C6FE7F3AF2281D4
                  3E7249276AF3DFA8ACDF857148346BD9DC604B73F2FAFCAA01FD41A05ADCF403
                  D2B1B58F0EE99AEA2ADFDB091971B5C70C06738DDE95B38A6B0C8F4A0B7A9CC8
                  F0C785B4447BA7D3AC624030D24C81B1F8B13CD63DC7C4BF0DD80F2EDA2B8946
                  EDA3C9842A923DF23F95735E33BDD43C47E2C8F45B60445E6186289861770CEE
                  63F867F4AEAB4AF867A1DA5AA0BE8DEF6E02FCF2C8ECAA7E8A0F02925733EBA1
                  3787FE22E91AE5DB5A90F693972B1ACA40120ED823BFB5759710C575049138DD
                  1C885580EE2BCB7C67E02B5D334E9352D2FCC444C19200D9D8A7BA93D0035D1F
                  C38D724D57416B59DE47B8B2711BBBF25948C83F9E57F0A6357D8C0F00DC1D03
                  C577FA14F85499CECC9E9228E38F753FA57AA738AF32F893A6CF617B67E24B10
                  DE742EA5C83DD7EE9FC7A1AEFF0049D4A0D5F4BB7BEB570D0CCB9047A8383FA8
                  2281ADCE6BC6FA06A7AC0827D3AEC4662465789E531AB67DC7D7F9573CDF0D6D
                  E3D18452EAB0A6A2CFB9D9CFC80607CBB73C723AD747F126465F09B246C177CE
                  8AC4F231D4E7F2AF1FD36F74C8AF259758B59EF211196108976967E0658FD375
                  2B833D0EDBC1F1A2DBCBE28F10C57165116F2E03361491938CF71D4E2A2D7341
                  F06EA7733DDDB6B10D988937CE96C0307073D07AF1D0573FE289AD26D0B489F4
                  FD32E2C2D95E4558A51C13C3647AF5C7E1ED54F58BFF00B7E8E5ADFC39069F1B
                  32B7DA628080D91FDE3C6339C2FB556A49BB6BA4780679E3D3ADAFEE67B9BC95
                  52372A7EF75C0E07A1C1208AD4BFF0BF863C17241ACDC2DEDC84942C3013BB2C
                  01604E7A8C01D7BFB9AE77E1FDF6AAFAD416B636568F6E1C9959E250EAA4124E
                  FF00BC4FF3E878AECBE2BC6CFE1885D47DDB9009F4F94FF85086896CFE22E81A
                  84AB15D4525BA302F1B4F18D840CFCD5043E38BCD775092CF48D03ED90443F79
                  23CC1475C0C6477AE67C597B637FE17F0D4366F1CD7CB0A2941F33AE514107D4
                  EE1FA1AE6B4BB310EA33A6A5A94FA4A4795670ACC770232854107FFD5484D9EF
                  17770D6BA2CD772420C90C0D2795F7C640C819C735E6A3C73AFC9A5CDAAC26CB
                  EC50DC88846701DBE5E8A3D31EBDB3E95DCE8B3D95FF0085BC8D32F9AF23485A
                  0129E58B6DEF9FA8FD2BCFBC1BE08B6D7C5D5D5FB5CC5145308FCA5C297207CC
                  5987A1E3F0A76190E9FE36D5B54D78B5D6BBFD976922127116F44C7451EE71F7
                  8FBD5183C5DAD3E91AE5BB5D4B3C0CA1BCF3C18CB49C9FA119AE8754F87CB3F8
                  D60B382DA48B467803B491FF0006011B727DC03F8D73BAB783F5DD1AE6E2CED2
                  1B9B8B3B8DB99614389403F2EE007073C91EB45BB06C4FE10B8D167D46DCEB5A
                  8EA7F6D793CA8D119962049C01B94E7F90AB7078A350F07D96A9E1DBB8E49648
                  DCADABC8C5B0A7392C7B820861EBDEA3F0CC3E2AD153FD0BC370CB217044B708
                  55F19FBA1B76001D338F7F4AEBBC61E08B8F13BD9DE5BB436D75B152E4392463
                  83907BE391EF459F50BDCF2DB559F4FB8B0B8937DA437C876CBB7A213B4B285F
                  C3FC2A58B4FB8B5D0AE4CBA6A5DD8CA508D422CFC9838CA3763D720D7A86BFF0
                  FA2D4AC74CB6B1B8FB3FD862F2412BBB2BEBF5CE7F3ACC3F0B6F90359C1AFCE9
                  A7C8E1E4876900B7F13601C6720726803CFBC49AB5BEADA8C7736F0B4412DD21
                  6566DC7E518C9381E82BA6D035AD02CFE1BDFE9B2DC2FF00684EB2FEED90E5A4
                  23E5C6070071FAD75B0FC2AD1A39ADA49249E4587978C9E253EA7DBDA8BEF85D
                  A2DE5EB4E92DC411B7DF862202F4C7071903E94ADE62B33C580DE42819DC7E50
                  06493E82BA1F0A437563E33D2CCD1C90C893A8642A77F2083FA1AF66B4F08687
                  A7DDC5776DA6C493C246C6E4E31C6EE4FDEC77AD46D3ED1AEC5DBC119B855C79
                  A546E0282AC88359D4D349D2AE2F1C83E5A9DABEADDAB86F85DA63BC97BAD4AE
                  AC65261561D490D973F9E3F5AAFF0013F5A967BAB6D0ADBE763B5DD5464990E4
                  2AFF009F5AEF3C39A3A685A15A69E9826241E637F798F2C68E817D43C49A37F6
                  F68935879C616720AB81DC1C8CFB554F0A785E2F0DD83C4A77CF34864924C7E4
                  BF80FEB5D1919A05055840314BD79A5A42463AD0163CF3E29EA620D2ADAC1012
                  F3BF9AC41E36A8FF00EBFE95D0F826C9B4FF000969D6EF8DFE5F984631CB12DF
                  8F5AF3EF13CEFE27F1E4367095682291214CF5600FEF063B8CE79F6AF608D022
                  AA8002A8C003B60628E825B925211918A5A42463AD033CA75671E1CF89F16A17
                  431693162F215C801D48CE3D54EDCFA835D85E78EBC39670890EA70CB91F2AC3
                  963F90E9F8D54F1CF872E35CB5B77B54592688B2EC66001071CE7F0AE674AF85
                  534CE64D66E8C630098A020927BE5BB7E03F1A094ECCA9E22F88F36A96F358E9
                  B6AD1DBCE7CB32B9CB9CF50147193C8EF8CF6ABBF0D344D5ECB559EF6E2D9EDE
                  D64876B798BB4BB12082077C60F5F5AEEB4EF0AE8DA6146B5B085645181211B9
                  FAFAD6CED03F2C50B40D6E55D42C62D46C2E2CEE0168A6428D8F718C8AF34F0C
                  6A737847C493F87F53982594AD98E473808E49C11ECD9FCEBD58E7D6B88F1EF8
                  4DB5BB55BDB38C7DBA05E98E645EC33EA0D00CC1F17F87BC557FAB5D792AF736
                  3236F8D04C7E40074032067A8AC9B4F01F89B4AD5526B6B689A40BBD1D590A29
                  EE08618079EC3F1AEC3C0BE2FF00ED68574DD424CDF463E466EB2007BFAB0033
                  C75AEE783D29A25ABEC79B3F83BC49E20D1CDA6BBA8408C2E3CE8CC63715E082
                  33E9C8C5769AC6890EAFA2CBA6B7C88CA046C467611D0FE95AC0018F618A5C51
                  71D8F2BB4F84D7115C46D26AA11411BDA052AC463B1CD7A0EADA3DA6B3A6BD8D
                  EAB491363A1E463BE7D78FD6B4F14878EF45C123811A37837C19776F717726DB
                  A1F342F2969186063700071C54D2DB782B5FB5BCD6BC88AE16124CD27CCACAD8
                  CF42473591E38D126BDF107DAACAF2DE79C227FA0C9CE4FB03C1070323BD705F
                  68961B6D52CE0B368259995A611C8DB63552415D9939F998727E9DA8BC8763D1
                  74FF00881E1DD260486CF49BAB7D38B90258E20101EBCF3C9C56C6B9E38D2B43
                  82D8DAC7F6D9AE47991C56E704A9CFCC71EA7B75AC36D574197E183471188225
                  BAC7E41701C4DC7F08EF9E775713A0DC4DA16B5A6EAF77137D8DDD991CC5C3A9
                  18723DD7AE7EB4ACC49D8F405F89422BDBAB3D4B4B92C6E2281E48964973BD80
                  DC14F1D4E300D5F87C6914DE0C9B5C687C874768843B8302F9C2807E9835CDF8
                  97C6B69AB4F269BA3E9D16A2D3C2CAD71E510E38382808CF15C2D89D4B535B6D
                  02DB7BA3DC6E54E8AAE4632DE80601FC3DE804EFB9E99A6FC4137DE11D4B5092
                  28E2D46D546D42786240C30CF5E739ADFF00056BB27883C3B15DDC95FB48768E
                  6C018660786F6C8C57916BDE12D57C38E8937EF21940559620769E7F31F8F6AE
                  8FE1E6B37DA3B7F65FF644D3C53DC73244A418DF001C93C6DC018A61747AFE71
                  DA8009A553950718C8E94B8A4506293B6053A93028189B700E6B23C47AC45A16
                  8D3DE48C15C29110FEF391C55EBEBEB6D36D64BABB95638D07249C67D85793CA
                  B7FF0012BC4CD1237D9B4DB55DAD8390A84FFE867F4A0342FF00803419F55D41
                  BC4FA98766DEC61DFF00C6E7AB8F4038C7E35EA416ABDA5BC76B6F1DBC31848A
                  250A8A3B01D07E156A814505145140C4E82B3F59BF1A668D79784FFAA8D881EF
                  D07EB5A24D7947C53F1190FF00D910BAF9718F36720F5E3A7E1C1A018CF861A6
                  B5EEAD73AC4A49FB39689723EFBB0CB1FC3FAD7AC818AC2F09690346F0EDADB3
                  2E252BBE5E73973CFF00F5BF0ADFA05142555BD5B96B2996CD912E4A111338CA
                  AB6382455AA43D2828E7F43D4AE048BA5EAD2DA0D5150B2A5BB121A2E007F6EB
                  FA8F5ADFC7D2B8CF16BB787F3AFD8C5199DE445B8790E4320046C03B6EE39F6C
                  D747A3EAD6FACE956FA85B92239941C31C953DD4FBD04234050453B348682AC2
                  77E8690AE47E14FA4340AC79C78B7C0E58C9AC68CCD0DDA132C91C7C1739CE57
                  D083923D6B4BC21E348B5948ECAF9922D4557BF025C6391EFCF22BB32323DBD3
                  D6B84F16F8196FCFF686931AC57CA77145F943FBFB1E282763BC073D314A2BCE
                  7C35E3C36F2FF65F8949B7BA43B5677180DECD8E95E8514B1CD1AC9132BA38C8
                  23906829324EF4871E94A28340CE43C51E05B2F12DC25C99A4B69C70EE801DC3
                  A73F4A7E87E06D2B468A65F28DCC93A84792600FCA3B01FC39CE7F0AEAB1818E
                  B4B8E69DC938B4F869E1D4BD1746DA4628FBF6193E56FA8AE92EB47B0BEB65B7
                  BAB2825853EE23460803D876ABE573F8D380345C2C64E9FE1FD2F4B7792CACA1
                  85DCE4955E738C1EB56A0B1B4B5C182DA38C818055003F9D5BEBE946DCD171D8
                  8CA2B2E0AE40ED8A72C61470303D00C0CD3C0C52D21D9094B49D68EDC50018E2
                  AA5EDF5BE9D672DDDCC8238614DCCC7B0A8F54D5ECF47B36B9BE9D638C74C1E5
                  8FA01DEBCA750D4356F88DAB2D9E9D13C3611724B0F9132792DEA71D05026EC1
                  ACEA57FF0010B5F834ED2E278ED222412E3E551DDDC7AFA0FF00135E9FA0E856
                  9E1ED352C6CE33B472F2372F237F798F7269BA068169E1ED392D2D972C466594
                  8F9A46F526B63D281217A5145141414514139140CCAD7B588B43D226BE970C10
                  61549C6E6EC2BCA3C1BA20F14F88E6BCD403CD0C67CC9370E1893951F5CE4D5B
                  F1D6B5278875E8748D3B7C888FE50DBD1A427049FA57A3F86F438741D1E0B38C
                  2F980032BA8C191FB9A08DDD8D80318E318F4A7527A52D22C5A422968C500432
                  C31CF1949635753D9C64647B57975BDDDC7C3FF13DDC5749249A55E307474E04
                  6371C1E4760707E99AF5622B1FC41A241AEE9725A4C143F58998642B763F4A09
                  68D28678E789258DC346E372B03D454D5E61E0ED6E6F0EEA6DE19D653C92F266
                  DDC9CFCCC7014FA03D47A723D2BD3430F5A609DC5A5A28A062114847069D4501
                  6398F137842CFC47065879376A3E4980F4ECDEB5C0C57FE24F87F782DE6845CE
                  9FB8E2324ED607A1563C29E9D6BD90F4AAD756705E42D0DCC093444E4A48BB81
                  FC0D04D8C3D07C6BA46BA912A4E20BA719F225383F87AD7461B3D0E6B87D63E1
                  9E93781A5B02D673E72028DC99FA76AC571E35F0823CAD225FD8A3743F38EFF3
                  7AAD02BB3D505048F5AF39D37E2BD948E1350B29A0278DD17CCA3F0EB5D5D8F8
                  AB45D4638E48352B721C6406902B0F620D055CDBA5A606046EC839F7A0382D80
                  C323B5003B14B4DDC319CD579EFAD6DD37CB73146BEACE0500593466B9BBEF1B
                  E8360997BF8E53FDD83F787F4AE5B50F8A7E6B98743B179A4C100CC18927B7CA
                  BCFEB40B98F4A7956342CEC1547524E05717E24F88363A5C422D38ADF5CB2E72
                  AD94503B923AD7310681E2DF164CB36A8EF6F6CCC495B81B47E083B7B1AECFC3
                  FE03D274068A5447B9B98D76ACD39C95E73F28EDFE79A049B390B1F05EBBE2AB
                  E4D47C453C91407E6F2C9F9CFF00B207F08AF4DB1D3AD74DB55B6B3B748615E8
                  A831F9D5C0A14000718C0C52E3A5055808A5A28A06145145001D8D715E39F167
                  F61590B6B4913ED9329C9CF312E386FAD6AF8A3C4D6BE1BB1DEE0497127FAA87
                  3CB1F7F6AF3FF09E8F3F8C3599B57D554CB648C465810B337603D40FEB409BD4
                  DEF873E1E36F66DAD5DA37DAAE79883725533D7EAC73F862BD040C5323411A2A
                  28C2A80A0638000A9290D201C52D25140C2968A4A062D348F4A7521A04626B7E
                  1CB1D6AD6459ED6379F6111C8C3041EA324738E99AE57C3FE2C9B47BA5D075E5
                  6468A4F262BB0E5D49ECAC4F3F8D7A2D73FE25F0DDAEBF60D1CB1E274F9A2917
                  860476CFA504B563741FE74FAF24D0BC677FE1CD40693AF2CB35BA1F2D652A4B
                  C647739FBC0FBF35EA367776F7B6F1DC5B4AB2C52A875753C30F5A6172D628A2
                  8A0614514503138A4650CB823208C60D2E29714058C6D43C35A3EA8ACB77A7C2
                  E48C160BB4FE62B9ABDF859A2DC10609EE6DFF00BC03EF07F3AEF71462826C79
                  84DF0C7538B7FD8FC412803042B061B88F5C1EBD2AA9F86BE23D923FF6CC61E5
                  C798A247C1F5CFF7BF2AF59C518A42B1E591FC31D65AD951F5D58F03FD5A6FDB
                  9FCC7F2A920F844AC83ED7AB3120F58E1193F8935E9F8A314058E2ED7E18F87E
                  DD41952E2E1C2905A494F35D35869563A6C4B1D9D9C302A8C2EC4038ABF8A314
                  0F94680074FC29D8A4A5A6505145148028A299BD77150C370EA33934C438F4AC
                  7D7BC4365E1FB3FB45D372C088917EF39F41E950F88BC55A7F87ADDCCF3235C1
                  5CC76E1BE663FD0579CD9695ACF8F7531A85DC863B3C9476CF08BFDD41FD6813
                  63748D36FF00C79E2596F6F8B2D9A365CA1E14672231FA73E95EBD6967058DBC
                  76F6D12C5120C2AA8E95169BA65AE9363159D9C42382300281DFDCD5EA4090B4
                  94514142D14514005145140C28A28A04262908A751401CEF88FC2B65E22B6225
                  063B8006C994E08F63ED5E6F18D77C05AA3482169206C210C4F9520CE7E5F43C
                  E2BDA48AAF736B15DC4D14F1AC91B0C15619FC69912463E87E2DD275E422DAE0
                  2CD9F9A097E5707E87AFE15BF9E6BCB35BF8633ADC9B9D1AE1463958DD8A95E7
                  B1A4D3FC79ABE8920B0D7AD5A7302E6697A4AA338CE3A37AE7AD1A873773D572
                  28ACAD2B5ED375A04D8DD24A530594020AE7B1FC8D6B50CB4252D2514802968A
                  280128A28A005A28A2800A28A280129693345300A334D6608A4B1C01C935C6EB
                  9F10F4BD1EEFECD1A9BB94292ED1380A9EC5BD695C57EE764CEA9197760AA064
                  927000AF37F13FC495B677B7D19A29988DA6620E14FB6783DFB563DC6ADE28F1
                  C4E2DEC627B7B173918CA809D8B3F7FA0F7AEBFC2FE00B2D065FB5CE45D5EE3E
                  5765F962F50BDFF134C96EFB1CCF86BC117DAD5E1D4FC43E624664DC217C6E9F
                  BFCDFECF6C57A9C16F15BC4B1431AC71A8C2AA8C6054A063A740318A5EF48A48
                  31452D25030E9475A5A2800A4A5A2800A28A2818514525002D145140094B4525
                  002119AC9D5340D3F5753F69814C854A8940C38183D0FE35AF463DFF004A7726
                  C8F2CD63E1BDE5BB9B8D16EE40E00E37947C73D08E3FFD75059F8EFC43E1F95A
                  DB5FB269C29C2B15D8D8FAF43F8D7ACF151490C732ED923571E8CB914C977471
                  FA7FC4DD0AE9545C99ED24EEB2464A8FC4574961AE697A96D3677F6D333F4092
                  024E3DAB0753F87BA36A04C9144D6B26771F2FEE93E856B9A97E176A0B7A2E6D
                  75182370C4AB6C60541CFD7FCFA74A9B07333D577519AF2E7D1FC79A5844B4BE
                  9674CE3E594305FC1A88BC4BE36D33115E696F7009382F0FCDD7D53E5EF4598F
                  99753D437668DD9AF3393E25EA3001F69D11E37E72B93B71F5C54727C54B8467
                  09A6ABAECC861231DA700E0E3A8E4F2314B50E647A9645266BC9E3F8A3AA98C2
                  FF0063A19B001C6E273F41DAAB5878DFC55F6FBA94DBBDDA306F2ED96DC8F2CF
                  1B4E7AF18236F539CD349B1F323D87349B857965B6BBE3AB8423FB3673962439
                  8768C718C6791C67FF00D740F0B78CF569239AFAF5214272D1BCCD8FA6D5FF00
                  3ED4598B9BB1E857DAD69BA723B5D5E428CBC32EE05BF2AE3353F8A16D196874
                  CB5796423F7723F0B9F751CE2A4B6F85D646F3ED37F7B35C1272D12FCAA4FD7A
                  D759A6787B4BD2540B2B18E361FC7B72DF893CD160BB679D3E9FE35F18A8374D
                  F64B37FE07CA2E3FDD1C9FC6B5B48F85B656B32CFA94E6ECAB67CA55C27E3DCD
                  7A16314EE298944AD6F6715B02224080E3800700559C514527A949242D149450
                  3168A292818B45145001483AD2D1401FFFD9}
                mmHeight = 24606
                mmLeft = 37570
                mmTop = 7410
                mmWidth = 26458
                BandType = 7
              end
              object ppLine13: TppLine
                UserName = 'Line13'
                Weight = 0.750000000000000000
                mmHeight = 265
                mmLeft = 30162
                mmTop = 26195
                mmWidth = 45773
                BandType = 7
              end
              object ppLabel30: TppLabel
                UserName = 'Label30'
                Caption = 'JEFE DE PREVISION SOCIAL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3175
                mmLeft = 30163
                mmTop = 26724
                mmWidth = 45773
                BandType = 7
              end
              object pplbendepctacajnac: TppLabel
                UserName = 'lbendepctacajnac'
                Caption = 'Beneficiario: '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3175
                mmLeft = 95514
                mmTop = 26195
                mmWidth = 81492
                BandType = 7
              end
              object ppLine14: TppLine
                UserName = 'Line14'
                Weight = 0.750000000000000000
                mmHeight = 265
                mmLeft = 113506
                mmTop = 26195
                mmWidth = 45773
                BandType = 7
              end
              object ppldnidepctacajnac: TppLabel
                UserName = 'ldnidepctacajnac'
                Caption = 'DNI: 09733891'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3175
                mmLeft = 113506
                mmTop = 29106
                mmWidth = 45773
                BandType = 7
              end
              object ppLabel132: TppLabel
                UserName = 'Label132'
                Caption = 
                  'Firmo en se'#241'al de conformidad, No teniendo reclamo alguno al res' +
                  'pecto, recibo copia de mi liquidaci'#243'n y el deposito en su cuenta'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3239
                mmLeft = 14023
                mmTop = 34133
                mmWidth = 162412
                BandType = 7
              end
              object ppLabel134: TppLabel
                UserName = 'Label134'
                Caption = 
                  'del Banco de la Naci'#243'n se realizar'#225' a las 48 horas (*) de aproba' +
                  'da la liquidaci'#243'n. '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3239
                mmLeft = 14023
                mmTop = 37572
                mmWidth = 101918
                BandType = 7
              end
              object ppLabel135: TppLabel
                UserName = 'Label135'
                Caption = '(*) dias h'#225'biles lun-vie'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 14023
                mmTop = 41012
                mmWidth = 30163
                BandType = 7
              end
            end
            object ppLine12: TppLine
              UserName = 'Line12'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 12700
              mmTop = 794
              mmWidth = 181240
              BandType = 7
            end
            object ppShape39: TppShape
              UserName = 'Shape202'
              Pen.Style = psInsideFrame
              mmHeight = 794
              mmLeft = 12700
              mmTop = 0
              mmWidth = 265
              BandType = 7
            end
            object ppShape40: TppShape
              UserName = 'Shape40'
              Pen.Style = psInsideFrame
              mmHeight = 794
              mmLeft = 193675
              mmTop = 0
              mmWidth = 265
              BandType = 7
            end
            object ppLabel29: TppLabel
              UserName = 'Label29'
              Caption = ' V. B. DE LA OFICINA '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 12700
              mmTop = 1852
              mmWidth = 29464
              BandType = 7
            end
            object ppanula: TppLabel
              UserName = 'anula'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 5027
              mmLeft = 0
              mmTop = 55298
              mmWidth = 203200
              BandType = 7
            end
            object pplimppor: TppLabel
              UserName = 'lblUsuario1'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 12700
              mmTop = 47890
              mmWidth = 45773
              BandType = 7
            end
            object ppSystemVariable1: TppSystemVariable
              UserName = 'SystemVariable1'
              VarType = vtDateTime
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 48948
              mmTop = 51329
              mmWidth = 32279
              BandType = 7
            end
            object ppLabel37: TppLabel
              UserName = 'Label37'
              Caption = 'Fecha y hora de impresi'#243'n :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 12700
              mmTop = 51329
              mmWidth = 35719
              BandType = 7
            end
          end
        end
      end
      object ppSRRetJud: TppSubReport
        UserName = 'SRRetJud'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = SRForPago
        TraverseAllData = False
        DataPipelineName = 'BDEPRetJud'
        mmHeight = 5556
        mmLeft = 0
        mmTop = 18785
        mmWidth = 203200
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport3: TppChildReport
          AutoStop = False
          DataPipeline = BDEPRetJud
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'ARCH B'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 279401
          PrinterSetup.mmPaperWidth = 215900
          PrinterSetup.PaperSize = 134
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'BDEPRetJud'
          object ppTitleBand4: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 1588
            mmPrintPosition = 0
            object ppShape29: TppShape
              UserName = 'Shape29'
              Pen.Style = psInsideFrame
              mmHeight = 1588
              mmLeft = 12700
              mmTop = 0
              mmWidth = 265
              BandType = 1
            end
            object ppShape30: TppShape
              UserName = 'Shape30'
              Pen.Style = psInsideFrame
              mmHeight = 1588
              mmLeft = 193675
              mmTop = 0
              mmWidth = 265
              BandType = 1
            end
          end
          object ppDetailBand5: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3440
            mmPrintPosition = 0
            object ppShape31: TppShape
              UserName = 'Shape31'
              Pen.Style = psInsideFrame
              mmHeight = 3440
              mmLeft = 12700
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppDBText9: TppDBText
              UserName = 'DBText9'
              DataField = 'DESC'
              DataPipeline = BDEPRetJud
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'BDEPRetJud'
              mmHeight = 3175
              mmLeft = 16404
              mmTop = 0
              mmWidth = 144727
              BandType = 4
            end
            object ppDBText10: TppDBText
              OnPrint = ppDBText10Print
              UserName = 'DBText10'
              DataField = 'MONTO'
              DataPipeline = BDEPRetJud
              DisplayFormat = '#,###0.#0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEPRetJud'
              mmHeight = 3175
              mmLeft = 163777
              mmTop = 0
              mmWidth = 15611
              BandType = 4
            end
            object ppShape32: TppShape
              UserName = 'Shape32'
              Pen.Style = psInsideFrame
              mmHeight = 3440
              mmLeft = 193675
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
          end
          object ppSummaryBand5: TppSummaryBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 8731
            mmPrintPosition = 0
            object ppLine11: TppLine
              UserName = 'Line11'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 12700
              mmTop = 3704
              mmWidth = 181240
              BandType = 7
            end
            object ppLabel28: TppLabel
              UserName = 'Label28'
              Caption = 'TOTAL RETENCIONES'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 117475
              mmTop = 0
              mmWidth = 43391
              BandType = 7
            end
            object ppDBCalc5: TppDBCalc
              UserName = 'DBCalc5'
              DataField = 'MONTO'
              DataPipeline = BDEPRetJud
              DisplayFormat = '#,###0.#0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold, fsItalic]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEPRetJud'
              mmHeight = 3175
              mmLeft = 180182
              mmTop = 0
              mmWidth = 12436
              BandType = 7
            end
            object ppShape33: TppShape
              UserName = 'Shape33'
              Pen.Style = psInsideFrame
              mmHeight = 3704
              mmLeft = 12700
              mmTop = 0
              mmWidth = 265
              BandType = 7
            end
            object ppShape34: TppShape
              UserName = 'Shape34'
              Pen.Style = psInsideFrame
              mmHeight = 3969
              mmLeft = 193675
              mmTop = 0
              mmWidth = 265
              BandType = 7
            end
            object ppLabel33: TppLabel
              UserName = 'Label33'
              Caption = 'S/.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 169334
              mmTop = 0
              mmWidth = 3440
              BandType = 7
            end
          end
        end
      end
      object SRForPago: TppSubReport
        UserName = 'SRForPago'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppSRDescuentos
        TraverseAllData = False
        DataPipelineName = 'BDEPForPag'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 14023
        mmWidth = 203200
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = BDEPForPag
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'ARCH B'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 279401
          PrinterSetup.mmPaperWidth = 215900
          PrinterSetup.PaperSize = 134
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'BDEPForPag'
          object ppTitleBand3: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 5556
            mmPrintPosition = 0
            object ppLine8: TppLine
              UserName = 'Line8'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 12700
              mmTop = 3440
              mmWidth = 181240
              BandType = 1
            end
            object ppLabel23: TppLabel
              UserName = 'Label23'
              Caption = ' FORMA DE PAGO '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              mmHeight = 3387
              mmLeft = 16404
              mmTop = 2117
              mmWidth = 25654
              BandType = 1
            end
            object ppShape22: TppShape
              UserName = 'Shape22'
              Pen.Style = psInsideFrame
              mmHeight = 1852
              mmLeft = 12700
              mmTop = 3704
              mmWidth = 265
              BandType = 1
            end
            object ppShape23: TppShape
              UserName = 'Shape23'
              Pen.Style = psInsideFrame
              mmHeight = 1852
              mmLeft = 193675
              mmTop = 3704
              mmWidth = 265
              BandType = 1
            end
          end
          object ppDetailBand4: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3440
            mmPrintPosition = 0
            object ppDBText7: TppDBText
              UserName = 'DBText7'
              DataField = 'DESC'
              DataPipeline = BDEPForPag
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'BDEPForPag'
              mmHeight = 3175
              mmLeft = 16404
              mmTop = 0
              mmWidth = 144992
              BandType = 4
            end
            object ppDBText8: TppDBText
              OnPrint = ppDBText8Print
              UserName = 'DBText8'
              DataField = 'MONTO'
              DataPipeline = BDEPForPag
              DisplayFormat = '#,###0.#0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEPForPag'
              mmHeight = 3175
              mmLeft = 163777
              mmTop = 0
              mmWidth = 15611
              BandType = 4
            end
            object ppShape24: TppShape
              UserName = 'Shape24'
              Pen.Style = psInsideFrame
              mmHeight = 3440
              mmLeft = 12700
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppShape25: TppShape
              UserName = 'Shape25'
              Pen.Style = psInsideFrame
              mmHeight = 3440
              mmLeft = 193675
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
          end
          object ppSummaryBand4: TppSummaryBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 9260
            mmPrintPosition = 0
            object ppLine9: TppLine
              UserName = 'Line9'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 12700
              mmTop = 3704
              mmWidth = 181240
              BandType = 7
            end
            object ppLabel24: TppLabel
              UserName = 'Label24'
              Caption = 'TOTAL PAGADO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 117475
              mmTop = 0
              mmWidth = 43391
              BandType = 7
            end
            object ppDBCalc4: TppDBCalc
              UserName = 'DBCalc4'
              DataField = 'MONTO'
              DataPipeline = BDEPForPag
              DisplayFormat = '#,###0.#0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold, fsItalic]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEPForPag'
              mmHeight = 3175
              mmLeft = 180182
              mmTop = 0
              mmWidth = 12435
              BandType = 7
            end
            object ppShape26: TppShape
              UserName = 'Shape201'
              Pen.Style = psInsideFrame
              mmHeight = 3704
              mmLeft = 12700
              mmTop = 0
              mmWidth = 265
              BandType = 7
            end
            object ppShape27: TppShape
              UserName = 'Shape27'
              Pen.Style = psInsideFrame
              mmHeight = 3969
              mmLeft = 193675
              mmTop = 0
              mmWidth = 265
              BandType = 7
            end
            object ppLabel32: TppLabel
              UserName = 'Label32'
              Caption = 'S/.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 169334
              mmTop = 0
              mmWidth = 3440
              BandType = 7
            end
          end
        end
      end
      object ppSRDescuentos: TppSubReport
        UserName = 'SRDescuentos'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppSRDevoluciones
        TraverseAllData = False
        DataPipelineName = 'BDEPDetDes'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 9260
        mmWidth = 203200
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = BDEPDetDes
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'ARCH B'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 279401
          PrinterSetup.mmPaperWidth = 215900
          PrinterSetup.PaperSize = 134
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'BDEPDetDes'
          object ppTitleBand2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 6615
            mmPrintPosition = 0
            object ppLine6: TppLine
              UserName = 'Line6'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 12700
              mmTop = 3440
              mmWidth = 181240
              BandType = 1
            end
            object ppLabel21: TppLabel
              UserName = 'Label21'
              Caption = ' DETALLE DEL CALCULO DE DESCUENTOS '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              mmHeight = 3387
              mmLeft = 16404
              mmTop = 2117
              mmWidth = 59796
              BandType = 1
            end
            object ppShape16: TppShape
              UserName = 'Shape101'
              Pen.Style = psInsideFrame
              mmHeight = 3175
              mmLeft = 12700
              mmTop = 3440
              mmWidth = 265
              BandType = 1
            end
            object ppShape17: TppShape
              UserName = 'Shape17'
              Pen.Style = psInsideFrame
              mmHeight = 3175
              mmLeft = 193675
              mmTop = 3440
              mmWidth = 265
              BandType = 1
            end
          end
          object ppDetailBand3: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3704
            mmPrintPosition = 0
            object ppDBText3: TppDBText
              UserName = 'DBText3'
              DataField = 'DESC'
              DataPipeline = BDEPDetDes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'BDEPDetDes'
              mmHeight = 3175
              mmLeft = 16669
              mmTop = 0
              mmWidth = 111125
              BandType = 4
            end
            object ppDBText4: TppDBText
              UserName = 'DBText4'
              DataField = 'MONTO'
              DataPipeline = BDEPDetDes
              DisplayFormat = '#,###0.#0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEPDetDes'
              mmHeight = 3175
              mmLeft = 163777
              mmTop = 0
              mmWidth = 15611
              BandType = 4
            end
            object ppShape18: TppShape
              UserName = 'Shape18'
              Pen.Style = psInsideFrame
              mmHeight = 3704
              mmLeft = 12700
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppShape19: TppShape
              UserName = 'Shape19'
              Pen.Style = psInsideFrame
              mmHeight = 3704
              mmLeft = 193675
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
          end
          object ppSummaryBand3: TppSummaryBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 17992
            mmPrintPosition = 0
            object ppLine7: TppLine
              UserName = 'Line7'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 12700
              mmTop = 3704
              mmWidth = 181240
              BandType = 7
            end
            object ppLabel22: TppLabel
              UserName = 'Label201'
              Caption = 'TOTAL DESCUENTOS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 117475
              mmTop = 0
              mmWidth = 43391
              BandType = 7
            end
            object ppDBCalc3: TppDBCalc
              UserName = 'DBCalc3'
              DataField = 'MONTO'
              DataPipeline = BDEPDetDes
              DisplayFormat = '#,###0.#0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold, fsItalic]
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'BDEPDetDes'
              mmHeight = 3175
              mmLeft = 180182
              mmTop = 0
              mmWidth = 12436
              BandType = 7
            end
            object ppShape20: TppShape
              UserName = 'Shape20'
              Pen.Style = psInsideFrame
              mmHeight = 3704
              mmLeft = 12700
              mmTop = 0
              mmWidth = 265
              BandType = 7
            end
            object ppShape21: TppShape
              UserName = 'Shape21'
              Pen.Style = psInsideFrame
              mmHeight = 3969
              mmLeft = 193675
              mmTop = 0
              mmWidth = 265
              BandType = 7
            end
            object ppShape28: TppShape
              UserName = 'Shape28'
              mmHeight = 6350
              mmLeft = 12700
              mmTop = 6879
              mmWidth = 181240
              BandType = 7
            end
            object ppLabel25: TppLabel
              UserName = 'Label25'
              Caption = ' SALDO DISPONIBLE DEL BENEFICIO '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              mmHeight = 3387
              mmLeft = 16404
              mmTop = 5821
              mmWidth = 50800
              BandType = 7
            end
            object ppLabel26: TppLabel
              UserName = 'Label26'
              Caption = 'SALDO DISPONIBLE DEL BENEFICIO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 117475
              mmTop = 8467
              mmWidth = 51329
              BandType = 7
            end
            object pplSalDis: TppLabel
              UserName = 'lSalDis'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold, fsItalic]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 180182
              mmTop = 8467
              mmWidth = 12436
              BandType = 7
            end
            object ppLabel6: TppLabel
              UserName = 'Label6'
              Caption = 'S/.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 169334
              mmTop = 0
              mmWidth = 3440
              BandType = 7
            end
            object ppLabel31: TppLabel
              UserName = 'Label31'
              Caption = 'S/.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 169334
              mmTop = 8467
              mmWidth = 3440
              BandType = 7
            end
          end
        end
      end
      object ppTotbenAsi: TppLabel
        UserName = 'TotbenAsi'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 177007
        mmTop = 0
        mmWidth = 15621
        BandType = 7
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object BDEPDetCalLiq: TppBDEPipeline
    DataSource = DM1.dsDetCalLiq
    UserName = 'BDEPDetCalLiq'
    Left = 286
    Top = 2
    object BDEPDetCalLiqppField1: TppField
      FieldAlias = 'DESC'
      FieldName = 'DESC'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object BDEPDetCalLiqppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'MONTO'
      FieldName = 'MONTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object BDEPDetCalLiqppField3: TppField
      FieldAlias = 'GRABAR'
      FieldName = 'GRABAR'
      FieldLength = 1
      DisplayWidth = 1
      Position = 2
    end
    object BDEPDetCalLiqppField4: TppField
      FieldAlias = 'TIPDES'
      FieldName = 'TIPDES'
      FieldLength = 2
      DisplayWidth = 2
      Position = 3
    end
  end
  object BDEPDetDev: TppBDEPipeline
    DataSource = DM1.dsDetDev
    UserName = 'BDEPDetDev'
    Left = 147
    Top = 2
    object BDEPDetDevppField1: TppField
      FieldAlias = 'DESC'
      FieldName = 'DESC'
      FieldLength = 60
      DisplayWidth = 89
      Position = 0
    end
    object BDEPDetDevppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'MONTO'
      FieldName = 'MONTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object BDEPDetDevppField3: TppField
      FieldAlias = 'TIPO'
      FieldName = 'TIPO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 2
    end
    object BDEPDetDevppField4: TppField
      FieldAlias = 'GRABAR'
      FieldName = 'GRABAR'
      FieldLength = 1
      DisplayWidth = 1
      Position = 3
    end
  end
  object BDEPDetDes: TppBDEPipeline
    DataSource = DM1.dsDetDes
    UserName = 'BDEPDetDes'
    Left = 257
    Top = 2
    object BDEPDetDesppField1: TppField
      FieldAlias = 'DESC'
      FieldName = 'DESC'
      FieldLength = 90
      DisplayWidth = 89
      Position = 0
    end
    object BDEPDetDesppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'MONTO'
      FieldName = 'MONTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object BDEPDetDesppField3: TppField
      FieldAlias = 'TIPO'
      FieldName = 'TIPO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 2
    end
    object BDEPDetDesppField4: TppField
      FieldAlias = 'CREDID'
      FieldName = 'CREDID'
      FieldLength = 15
      DisplayWidth = 15
      Position = 3
    end
    object BDEPDetDesppField5: TppField
      FieldAlias = 'GRABAR'
      FieldName = 'GRABAR'
      FieldLength = 1
      DisplayWidth = 1
      Position = 4
    end
    object BDEPDetDesppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'SDOACT'
      FieldName = 'SDOACT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
  end
  object BDEPForPag: TppBDEPipeline
    DataSource = DM1.dsForPag
    UserName = 'BDEPForPag'
    Left = 175
    Top = 2
    object BDEPForPagppField1: TppField
      FieldAlias = 'DESC'
      FieldName = 'DESC'
      FieldLength = 150
      DisplayWidth = 89
      Position = 0
    end
    object BDEPForPagppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'MONTO'
      FieldName = 'MONTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object BDEPForPagppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'PORCENTAJE'
      FieldName = 'PORCENTAJE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object BDEPForPagppField4: TppField
      FieldAlias = 'FORPAGID'
      FieldName = 'FORPAGID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 3
    end
    object BDEPForPagppField5: TppField
      FieldAlias = 'BANCOID'
      FieldName = 'BANCOID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 4
    end
    object BDEPForPagppField6: TppField
      FieldAlias = 'AGENBCOID'
      FieldName = 'AGENBCOID'
      FieldLength = 8
      DisplayWidth = 8
      Position = 5
    end
    object BDEPForPagppField7: TppField
      FieldAlias = 'PVSLDNIBEN'
      FieldName = 'PVSLDNIBEN'
      FieldLength = 8
      DisplayWidth = 8
      Position = 6
    end
    object BDEPForPagppField8: TppField
      FieldAlias = 'PVSNOMBRE'
      FieldName = 'PVSNOMBRE'
      FieldLength = 90
      DisplayWidth = 90
      Position = 7
    end
    object BDEPForPagppField9: TppField
      FieldAlias = 'PVSLNCTA'
      FieldName = 'PVSLNCTA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 8
    end
    object BDEPForPagppField10: TppField
      FieldAlias = 'APENOMTUT'
      FieldName = 'APENOMTUT'
      FieldLength = 90
      DisplayWidth = 90
      Position = 9
    end
    object BDEPForPagppField11: TppField
      FieldAlias = 'DOCIDETUT'
      FieldName = 'DOCIDETUT'
      FieldLength = 8
      DisplayWidth = 8
      Position = 10
    end
    object BDEPForPagppField12: TppField
      FieldAlias = 'FECNACMEN'
      FieldName = 'FECNACMEN'
      FieldLength = 10
      DisplayWidth = 10
      Position = 11
    end
    object BDEPForPagppField13: TppField
      FieldAlias = 'GRABAR'
      FieldName = 'GRABAR'
      FieldLength = 1
      DisplayWidth = 1
      Position = 12
    end
    object BDEPForPagppField14: TppField
      FieldAlias = 'APEPATCOB'
      FieldName = 'APEPATCOB'
      FieldLength = 30
      DisplayWidth = 30
      Position = 13
    end
    object BDEPForPagppField15: TppField
      FieldAlias = 'APEMATCOB'
      FieldName = 'APEMATCOB'
      FieldLength = 30
      DisplayWidth = 30
      Position = 14
    end
    object BDEPForPagppField16: TppField
      FieldAlias = 'NOMCOB'
      FieldName = 'NOMCOB'
      FieldLength = 30
      DisplayWidth = 30
      Position = 15
    end
    object BDEPForPagppField17: TppField
      FieldAlias = 'CODRELCOB'
      FieldName = 'CODRELCOB'
      FieldLength = 2
      DisplayWidth = 2
      Position = 16
    end
    object BDEPForPagppField18: TppField
      FieldAlias = 'APEPATTUT'
      FieldName = 'APEPATTUT'
      FieldLength = 30
      DisplayWidth = 30
      Position = 17
    end
    object BDEPForPagppField19: TppField
      FieldAlias = 'APEMATTUT'
      FieldName = 'APEMATTUT'
      FieldLength = 30
      DisplayWidth = 30
      Position = 18
    end
    object BDEPForPagppField20: TppField
      FieldAlias = 'NOMTUT'
      FieldName = 'NOMTUT'
      FieldLength = 30
      DisplayWidth = 30
      Position = 19
    end
    object BDEPForPagppField21: TppField
      FieldAlias = 'DIRDOMCOB'
      FieldName = 'DIRDOMCOB'
      FieldLength = 250
      DisplayWidth = 250
      Position = 20
    end
    object BDEPForPagppField22: TppField
      FieldAlias = 'CODZIPCOB'
      FieldName = 'CODZIPCOB'
      FieldLength = 6
      DisplayWidth = 6
      Position = 21
    end
    object BDEPForPagppField23: TppField
      FieldAlias = 'TELFIJCOB'
      FieldName = 'TELFIJCOB'
      FieldLength = 15
      DisplayWidth = 15
      Position = 22
    end
    object BDEPForPagppField24: TppField
      FieldAlias = 'TELMOVCOB'
      FieldName = 'TELMOVCOB'
      FieldLength = 15
      DisplayWidth = 15
      Position = 23
    end
    object BDEPForPagppField25: TppField
      FieldAlias = 'APECASCOB'
      FieldName = 'APECASCOB'
      FieldLength = 30
      DisplayWidth = 30
      Position = 24
    end
    object BDEPForPagppField26: TppField
      FieldAlias = 'EMAILCOB'
      FieldName = 'EMAILCOB'
      FieldLength = 20
      DisplayWidth = 20
      Position = 25
    end
    object BDEPForPagppField27: TppField
      FieldAlias = 'MOVCOB'
      FieldName = 'MOVCOB'
      FieldLength = 20
      DisplayWidth = 20
      Position = 26
    end
  end
  object BDEPRetJud: TppBDEPipeline
    DataSource = DM1.dsRetJud
    UserName = 'BDEPRetJud'
    Left = 230
    Top = 2
    object BDEPRetJudppField1: TppField
      FieldAlias = 'DESC'
      FieldName = 'DESC'
      FieldLength = 150
      DisplayWidth = 150
      Position = 0
    end
    object BDEPRetJudppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'MONTO'
      FieldName = 'MONTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object BDEPRetJudppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'PORCENTAJE'
      FieldName = 'PORCENTAJE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object BDEPRetJudppField4: TppField
      FieldAlias = 'FORPAGID'
      FieldName = 'FORPAGID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 3
    end
    object BDEPRetJudppField5: TppField
      FieldAlias = 'BANCOID'
      FieldName = 'BANCOID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 4
    end
    object BDEPRetJudppField6: TppField
      FieldAlias = 'AGENBCOID'
      FieldName = 'AGENBCOID'
      FieldLength = 8
      DisplayWidth = 8
      Position = 5
    end
    object BDEPRetJudppField7: TppField
      FieldAlias = 'PVSLDNIBEN'
      FieldName = 'PVSLDNIBEN'
      FieldLength = 8
      DisplayWidth = 8
      Position = 6
    end
    object BDEPRetJudppField8: TppField
      FieldAlias = 'PVSNOMBRE'
      FieldName = 'PVSNOMBRE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 7
    end
    object BDEPRetJudppField9: TppField
      FieldAlias = 'PVSLNCTA'
      FieldName = 'PVSLNCTA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 8
    end
    object BDEPRetJudppField10: TppField
      FieldAlias = 'GRABAR'
      FieldName = 'GRABAR'
      FieldLength = 1
      DisplayWidth = 1
      Position = 9
    end
  end
  object BDEPObs: TppBDEPipeline
    DataSource = DM1.dsObs
    UserName = 'BDEPObs'
    Left = 202
    Top = 2
    object BDEPObsppField1: TppField
      FieldAlias = 'DESC'
      FieldName = 'DESC'
      FieldLength = 250
      DisplayWidth = 250
      Position = 0
    end
    object BDEPObsppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'MONTO'
      FieldName = 'MONTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object BDEPObsppField3: TppField
      FieldAlias = 'GRABAR'
      FieldName = 'GRABAR'
      FieldLength = 1
      DisplayWidth = 1
      Position = 2
    end
  end
  object pprdesdev: TppReport
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297127
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = False
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 264
    Top = 32
    Version = '7.02'
    mmColumnWidth = 0
    object ppHeaderBand4: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 43392
      mmPrintPosition = 0
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 157957
        mmTop = 10054
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel63: TppLabel
        UserName = 'Label63'
        Caption = 'Fecha  '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 143140
        mmTop = 6085
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel64: TppLabel
        UserName = 'Label64'
        Caption = 'Hora    '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 143140
        mmTop = 10054
        mmWidth = 10848
        BandType = 0
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable4'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 157957
        mmTop = 6085
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel65: TppLabel
        UserName = 'Label65'
        AutoSize = False
        Caption = ': '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 155575
        mmTop = 10054
        mmWidth = 1323
        BandType = 0
      end
      object ppLabel66: TppLabel
        UserName = 'Label66'
        AutoSize = False
        Caption = ': '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 155575
        mmTop = 6085
        mmWidth = 1323
        BandType = 0
      end
      object pppvslbennr: TppLabel
        UserName = 'pvslbennr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 42333
        mmTop = 27252
        mmWidth = 19845
        BandType = 0
      end
      object ppasoapenomdni: TppLabel
        UserName = 'asoapenomdni'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 42333
        mmTop = 36248
        mmWidth = 137848
        BandType = 0
      end
      object ppLabel94: TppLabel
        UserName = 'Label94'
        Caption = 'FECHA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 10583
        mmTop = 31750
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel95: TppLabel
        UserName = 'Label95'
        Caption = 'LIQUIDACION N'#186
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 10583
        mmTop = 27252
        mmWidth = 28046
        BandType = 0
      end
      object pppvslfecbe: TppLabel
        UserName = 'pvslfecbe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3979
        mmLeft = 42333
        mmTop = 31750
        mmWidth = 19845
        BandType = 0
      end
      object ppLabel96: TppLabel
        UserName = 'Label96'
        Caption = 'ASOCIADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 10583
        mmTop = 36248
        mmWidth = 19050
        BandType = 0
      end
      object pptipobenabr: TppLabel
        UserName = 'tipobenabr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 63500
        mmTop = 27252
        mmWidth = 37042
        BandType = 0
      end
      object ppLabel97: TppLabel
        UserName = 'Label97'
        Caption = 'Pagina'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 143140
        mmTop = 14023
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel98: TppLabel
        UserName = 'Label98'
        AutoSize = False
        Caption = ': '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 155575
        mmTop = 14023
        mmWidth = 1323
        BandType = 0
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable5'
        VarType = vtPageNo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 157957
        mmTop = 14023
        mmWidth = 22225
        BandType = 0
      end
      object ppLine27: TppLine
        UserName = 'Line27'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 10583
        mmTop = 42598
        mmWidth = 169863
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'Label47'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 40217
        mmTop = 27252
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel48: TppLabel
        UserName = 'Label48'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 40217
        mmTop = 31750
        mmWidth = 1058
        BandType = 0
      end
      object ppLabel50: TppLabel
        UserName = 'Label50'
        Caption = ':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 40217
        mmTop = 36248
        mmWidth = 1058
        BandType = 0
      end
      object ppLine28: TppLine
        UserName = 'Line28'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 10583
        mmTop = 43127
        mmWidth = 169863
        BandType = 0
      end
      object ppImage2: TppImage
        UserName = 'Image2'
        MaintainAspectRatio = False
        Picture.Data = {
          0A544A504547496D61676543290000FFD8FFE1001845786966000049492A0008
          0000000000000000000000FFEC00114475636B7900010004000000640000FFE1
          036F687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F003C
          3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043
          656869487A7265537A4E54637A6B633964223F3E203C783A786D706D65746120
          786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B
          3D2241646F626520584D5020436F726520352E332D633031312036362E313435
          3636312C20323031322F30322F30362D31343A35363A32372020202020202020
          223E203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F7777
          772E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E
          7323223E203C7264663A4465736372697074696F6E207264663A61626F75743D
          222220786D6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E
          636F6D2F7861702F312E302F6D6D2F2220786D6C6E733A73745265663D226874
          74703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F
          5265736F75726365526566232220786D6C6E733A786D703D22687474703A2F2F
          6E732E61646F62652E636F6D2F7861702F312E302F2220786D704D4D3A4F7269
          67696E616C446F63756D656E7449443D22786D702E6469643A38384242323139
          413845363945333131393530364335414333303344354330382220786D704D4D
          3A446F63756D656E7449443D22786D702E6469643A3442453033434441363939
          3831314533383235463846314639373642313741362220786D704D4D3A496E73
          74616E636549443D22786D702E6969643A344245303343443936393938313145
          33383235463846314639373642313741362220786D703A43726561746F72546F
          6F6C3D2241646F62652050686F746F73686F7020435336202857696E646F7773
          29223E203C786D704D4D3A4465726976656446726F6D2073745265663A696E73
          74616E636549443D22786D702E6969643A384642423231394138453639453331
          3139353036433541433330334435433038222073745265663A646F63756D656E
          7449443D22786D702E6469643A38384242323139413845363945333131393530
          36433541433330334435433038222F3E203C2F7264663A446573637269707469
          6F6E3E203C2F7264663A5244463E203C2F783A786D706D6574613E203C3F7870
          61636B657420656E643D2272223F3EFFEE000E41646F62650064C000000001FF
          DB00840001010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010202020202020202020202030303030303
          0303030301010101010101020101020202010202030303030303030303030303
          0303030303030303030303030303030303030303030303030303030303030303
          0303030303FFC00011080040010403011100021101031101FFC4009C00000102
          070101000000000000000000000007080103040506090A0B0201010101010000
          0000000000000000000000010203100000060200040207030808030901000002
          03040506070108001112091314215394D415161731180A516191222393193941
          D192242556B778A133957181D336274768C81A8A110100030002000602030000
          0000000000000111213141516171810212B1D1F0A132FFDA000C030100021103
          11003F00D6A7E21FEE59B05B49BCB7D6B9993691C5B5B75BAC97FA8E255233BB
          2D6E8DBFC9600B4D8FCAAC49B22467109659227893A35996E1AC01806B6AC924
          A7000625672AC7CA76BA573BD938DFE830CE5F9CC167FE3E8E203C537973F14C
          FC9FF305CFF473E7C047C51FAE3BF4E7FF001389A1CE6A76E3EC5E91DB91DBAF
          5BACC9157F30625E894AD4685C570A2D336A4AA4B52A6293F8C96AD3B74BE26E
          982BA54A25411079F234B116704A3408B891EC67AC774A5D8FD70A1360D1340E
          3C96F0A6EB4B64A8F9AA32B06C3F5061ACF2A1B30966494DE732D237411193BC
          3060DE8EAC631CF971D50BA70070070070070070070070070070070070070070
          070070070070073E5F6F006338CFD9C01C01C01C019CE31F6F010E78FCB8FD38
          E0239CE31F6F00701E379DD8FF0099E7703C7FF30F617FD5092FF5F1CE79564C
          D5D9E7B9BBD51A1D8D6AD30B9555526C7C32C4AE38696B2E5CBE28680B3CA933
          65567BA956B3B47D421330A8A5A9990E4C721CF9A00B24733787D64380DA2EDC
          D3FB7F6E6ADA1740F5C2452D7179D22D3BB9A4D18871CB0E6C6D76B0F5F6BF95
          CEA7B2E94CCDE4A6486373E4BA42664C39C57A240158A42495D22180AE131738
          1B3C7BB4D771C945FD26D5F66D44B6CCBB218CC9E49288C383735B332B2C5D71
          AB486A942BB15EDD9B6B60C59FD537A925B5CC0EF940E67A730A4A69C60041E1
          5F2B4B34DBCE83B97596CC91D377E56D2BA9ECE8A8C803E43E62D8636B9A6256
          1385081C1319FB448EACEE89861391AE4661C89610209849A60058CE64DF6AF5
          F3ED63FCB47403FD9BEB7FFA4713E3AA15CD91DC8D57D4065677FD9DBF6AEA49
          048CF3D3470B9F4A9BD9DD64A6A31A62D7E238C19198FD202DB32B89CAB1A34C
          781284D088DC8022C6780E6E7B8B7766D848C774DED5F59E98ECE449EB4E76BC
          DA2332C360CC356D8D12B18A95ECD3FD6B3B0229DAD8FC81E111E18EA029B8F2
          9BD7A339B14807D41028EAE52E6E23A1D19EC86F0EA169FE1903B37B1B52D28B
          24850D4C7D9E75306D6C913E2228FF002C738B5468261EFEBDAD3A9FD99CA8A4
          C24E519E818F19E28CC59368F5BE4B492FD948EDED53BFEBFB4B4B9BF3ADCACF
          3C8E39D6ED6D2CBCC2F2B1CA5C8DC0E666F0B38B190AB01A680C4E6632033011
          6338E013A6FDFDD27776DA7DE1A369E8E776BBFE4B248852CE0D161C7DCD2597
          228764E2E5C82247205AA0B732E307938257A80E7CB235261449A600D3C900C2
          CE4771DD0B575D116DA0DBCD7F74AD1559CD34BA39B345971A76605F6C3EA546
          E2D75E372D6D5CA42E12A52D2B8B5B9484E0C38A41D4A8CC05380668428AD8EE
          65DBDE8D992CAEEDBDD0D6C824EDB1C4E697A883DDB90E2E431E744E6E0950DD
          26694EE8A164656A737D0616BC29C60F4F3FB33C2E02CB2BDABD6783D3683626
          5B7F53EC5423AFC33E15732EB0E2C1AC9D7E34B3E1CD196B9A96E638F38FC457
          872493E0A81F5998C871CF38CF2045275DCDFB7BD66E155B5CF37275EA28AEEC
          8DB24D2B0CBC5971E4E92530B9264F047A665AFC2B13735441F4C4C6811BA2E3
          52A152324C096688458B1860BCDD3DC5744F5CACA69A76F5DB2A22ACB39E7084
          C221732B0D81A9E9B53B9929D5362C93146AAC950E40E8955166A550EC344428
          273D650840C67385C0576E3D9BD74D798AB5CE6F6BDAA3A7E22F981E58243645
          83168735C8BA1312AC408E297C74440901D84AA0B33A11F8C3F0CCC67972CE39
          8615AF5BC1A7FB60ADDDB75AF65A97BADE581265C9EE3F5F5811F90491A1AF0A
          4A47F17728DA559F1D46CE258A0B282AC69829C468F01C0F22CE31C0393757A6
          763253287A756C674EB5CDB19519EE8B933792ADE1ED7A76B666A4C6AB34A01E
          E6ECE4A8A4C9480E7269E79812CBC6442C632090C4F67B5B27B66C9293836C25
          2133B961C27404BAA58A5AD0490D99171B12B290BD824304687E572765133AD3
          824ABC294A5E539A2C00CE916718E0257DE9759BEB07DDEBEF1345FD7DF13C2F
          A21F56A05F56FC6F85FC77C0FA6FF1FF009BFCC7C17FBEF4793EBF2BFB6FF97F
          ADC065D695CB50D1D191CD6EBB52B7A7E185282519B2CB46731880468B58A39F
          974837D9639B4B60551DD39E8064DEA172CF2C7A380ABAD2D6ABEE788A29F53B
          6440AD782399AA486D9A56B308F4EA26BCF446E49584229145DC5D1A151C90EC
          640680B3B392C58E42C633C02713FDB9D53AA27ED754DA5B35AF95B5A0F7F0DC
          B356F3EB9ABA87CF1DB0F4779766136C4243236E7F5B876521C969725A717981
          E3917D59F47011BF5DA54F9584FD8E97BEEB5A4AD1607B81B71F614D98D92C36
          180295F2588BC2B639642D64A230501C6750B5F942DE050B529A131D932A2B06
          67C3098178B8B6575D35DCB6036FFBF295A34A961EAD34587705A507AD012552
          8029B2B93B00A66FACD8783908561393829FAF2560C07572C0B1CDC721A36F07
          710AEF519669C165CD693588F66B66AB3AB9ED5CCECC636029828F98C7A6CE72
          2BB580D03984A5EC51C72626D4D95E6FF84604E2009A703232F3C27390F322D7
          DD173A823F5A508BA2A798D611513C065163C5AC587C86071B1479116E2FC17E
          97B4BC2C8F34098DBCE09EB3CC282FCB102C0CCE90E719E028A9CD8CD7DD8940
          F0EDAFF7AD3B79354755A640FEE5505990BB29031AE5648D42346F0AE1CF4F49
          DB152A20191940384011810E738C6718CF017B925D14F43A3C8E5D2EB5EB58B4
          4DC6505C1DBA51239D461963ABE686BDA88C950F44F4E4E899B55CA4C91A435B
          F0DE59B95795A5893E0BF14390E0304AB9F64505AEA7724BEAFAACE789186C5B
          71D0EB19B5B186B788C12048666F6264834A148A44E6D25BC556CC461A5DDC94
          A84E61CA51983505966E079C85EA9ED95D73D882DF0EA06FDA56F12A306A6224
          86D3F69C1ECC0478F59E2F9325EC70B7D7AC3518AF040F2584FF000F23C005CB
          9F2CF2723493F7E5DA7F9E3E0FF53D3FC3FF00FD0E7DC73CBFC990CE5F75AFA0
          9F39FD31F17E0FD5E3FCC3FDE3E33CFE33D5FB3F31D3FA9C66FF002AE49ABB8A
          54F38FC5053E8C5D28232F10D71EE19B2C63630CC4CC971591DA0DEF567B951F
          197E2C61196B50492EA471F4262234224EBBCC796342228D163333EDA34E33EB
          CF73D56E2C86E19ACFAEB6DDD9496DAF29D5FF000B648CF71305B089F8C65322
          6D881064878605ECAE85E5A53322524A4E8C90010129C050024E33737E63A4BE
          F756258276AB6D54B5CDDDBA3767DBDBF1A574DED486BD7A270D52495D37DAFE
          B9944CE997C5CC0E2A50BC452A5BC642E8689A4C11C991BFF50841F1D28041DC
          F1EE9DB55B71EC0DDEF9D8AB506B277B5664E55FFDF7B66A1A289AA785236F3E
          235CD67414A60316579CE7CCAC8E4364964BEAD6F4261B94898E71C6405F3208
          C932E7EB4AB4EF33B39CDFB54F66AB0A62B5649E78595BE353E66AFC70DD2527
          D61565BD5CE2B3811EFCACC35CD744EBD2654E44332238D114D49D5984A60964
          F2070F97108F4B3ED65FCB4BB7F7FB38D6FF00F48A29C6C71F554D055D7774FC
          48FBBB03DEC74779657FAF38B85A6B9A754C99E638DD268D5253D8ED57078337
          9ADAE8DAF6D51B21BA42AE5AB9334284A6B839E4F54663251EB303C73F2D5255
          BD3A0BAD7A19F883FB66567ACA4AB8B571675CDA9168AEAA8E91BBC952D71207
          2D8DC4517A38FB83F383B3EA6649395152D7929D6293CC214987E0B1052F9624
          A4C57CA2836FD7A9AB5EDDF707EE13B15B63DB6769BB9FCD49B25C18982B2AB1
          C24C38B514D2AE5B35606B699CB74690AA7DCFCBD1589A4648C1423F089214DE
          B44612729C90A533B9B80BB6B9D2DB49AEB56F7BF89675276E3547B7E5C5A2D7
          85935B41B63A36FE04B12B3236E90D4B01650CBDE9A1B1B5548871C91BDA1F0C
          A18DC96B6A44BE74C586A009F8B1DF852161EC25DAB20D61E9EBDF744B7E7D3D
          7F9BD1C9EF42F562B442FE14D5EC353D7516952B707D942434A39C1C82ED61BE
          B8292DA129EDC80224E250ABCE79E30B25F18EE4379FC397DA72AEDF262B1F63
          F65ACEB09AE9CD5CB59914D775AC2A5638B369D6990DB1F9BCAE712774392AA1
          3333A08F32B3261E1B7095C1767908C5840111403DF18B0BE3995A15DC9EF5DC
          3B4751BB116C46E5C49FECC993F595B4ECFB672DA31CC12B95962717C9455D59
          2F20E830E48E6E869B2142C4A0D5AEAA3CE80C5A8892D47920327881ABCD7E97
          CB55762AEEB74EBC2F7CC426A7DA9D3392C2A2B200E32BA29229ECE65D1F9AE0
          E2F00F0D02C7043016E0AA28BF08B0A94E316318C9A2EA91FE654F97623B476A
          0407F0E9555DC01A1A2666ED5AD8DD2D623D58ABA66FEB913EA1B3AC563829F5
          F2A87A970510F6F8A45E3D242F0DE6244699CB0A5BCAC9AA46030D2449F8C447
          9A24583DA7F5213FE1BE67EE306B6CE5CF6F14A18858ABED1709BC855A67142F
          97FB7D359AF15C416AE5116C445AA20BC034E781281DF2E290B37CDF96C891E5
          51F5B9E57B2BCB766F4E65DDB0BB2F6B1ED0E9DDABDC736C9E22D60BF5194A43
          EC496560E08602A6DDB3E978832BF587174EE331358DF1140D1266E666D4E615
          92E2851AACC4A993100536E2AA790D74EAF1FF004CFBD276C87EAD341EDAED78
          ED60DD550C5A4355492F73360215316699D9AD35DCED6C02C3C80F5CA9AA4105
          981ADEF4D872C5004A79A1C00B27AB1812AA611DA877A189027FA8509800A432
          487FCFBB9BA310CC4C616E8730CD622193ED4D5AD0A2450D90251056B04A1B12
          2B306897119C9A94FE430E3D19E353C0493BA16976B0D37DB6AEE9BD174EC128
          5B1B542B270B875DAD3A7630C705B32ACB0AB74E43C333E304E5A1127921A6BE
          650E52BDF985270DE922A3C2A846986789874156BC3B7169AC4BB7F5AF5A4729
          383B19D0EA3671358D5B0963CCE3BBD92DA8EC35CA52D17B916C9A9899B1D742
          198A229EC4FE6AEC2D3DC03911A664B1081C2434F8F6C1C5F682BFD2B465E834
          1BB916F3B568C6BADD36D496C32EA286D6F41336C3D78C4FE15533B52C68E4A1
          3C5665713F30AD5CDF1C8F3139399ADE8CE527012A1C1461D2EE3CCECD7E773F
          BE34FF00622EDB5E0FA391AEDF1389876B0DF6B15643AB9B3AAFB5E87BF2DBD5
          56DAF26F4CCDDA20F59B142D3FD54ABBE747125C1C5F18122A756277C202B278
          53E3207E86DFB50340B4753EAA55C23296A7360C57056B13B1ACBBBADA84C4EE
          19E6C74A2C98F249649AD6B1E7F356F90BD4E1CA7AE2FA7B875A8546A44E4A90
          A7480252964940540D06DDB4ED7146EB5F7EBA76AE7A769556F01DB5EDB2C314
          1CA256E13E5F13694CE5A98E096A1264AF2A97BA2A8CD2C62BF979911A95071E
          CED6853B78CCC89264594F1EFF00A1B54BDA939A515B9BB2DB4169E8187B8FD2
          37DC72B61314B610DB5C599B0FABF1AACA008E24EF45B051375485A1B26155CB
          E5197095A61C10E4EECA1D5E9C00EADEBC6044A30F30D7F64229DBE2DDA9FB53
          BD6ACD275423AB3F8C0D795BC86BA72A81244DEAB190BE365F2F778D2136ACA6
          4C091EAB1569A748CB54F1133D2236FF001C84EA0A4E34F94868A4D4D7A9050F
          73D35511DDFBD7CD2945A6330B4754607AED3ADE0956AE6A756951A48A5C578A
          9B722B52C22457A575207BAD227308055E992A972291E559E05F235EDE7AF4C7
          94DE4745EEBA1779B237496EC6EA3DC7A8BDB3B6AB542F1825F159C46CCB257D
          45425555CCEF50A70FE8A33B055B5D47C06F45A54A6311A891C549E3C156D2F0
          B1AE4AC2886D6024472918931DF62FDDA9B47EA99F47671B297AB430DE8BE29B
          81BB51FD418D4FD81A1FA17AC558B16E25AEA1C1657713716CCB337DB93BB39A
          DC1E9E260328D90284816C401525266F015956DC84AAABB268866D67514B595A
          B09B76EDBBBFBA0F71C7CD79D603D8A04E044CE6355ECF5C92091D92FEF16AAC
          455E4361D5B3439872E6F6E061DE586E24904A75279E12B2C18BDECCB74D636C
          697DD62ED5B5CE8F4C229BA5AC75B636335B6FBA3658CA3AAEF9B6E3F51D9D55
          5D3148B55F59CC65D059FB2CC7CB224A4A25C5B7C8468DC42A52E538C2A4132F
          FDC9FF00FACAFF00EAEF13F6BD7B3895EEB0A0F45DD0F7F55A434E4AAD36E4EC
          2284CA539A610A139E45AB2334A3C838192CC24D2860EB00C3E9E7CB38E333C8
          5BD277BFDEE4CD891C8E74A19DEF36E654B1A6BDC27ED6EA65E770DB98914771
          144C98BBF1C2207CA95BB96C18C9187C5383E442E79332BFC6CF5F0FB4FB8634
          FF00B6175CAB5DD7EB149A484C86B777D8F78DAF795EF8930E93B7ABAA45082E
          BF7C92BCCDD79C7BE3A16EAC24F59E51E60B272B165408591E79F12F28634F77
          FD86FDAF903D635EA5A05575736958570C69281A8A29F0B995991D83C5A4E6AC
          7AC0B2A16379AD75EB77809FA71828CF133CF3D58C05782BE79B296859342D03
          ADF275ACC755FAD2E5703B55A89131A342F08965E0FCC1249F09E9E4BC655BEE
          153A4692E5378B91652978C8439E9E58C3781EBA9DAC7F968E807FB37D6FFF00
          48E27C7546AA7B93FE1F449B6BB52DFBCFA95B472FD2BDA23BE1C6CCE4D176B7
          A5AD9267A69662632DF3561758ACBA172880CC0C8C17842E4626395A37720A2F
          232083C6B142B931737D86E711FC30F2763DAAD5ADC296F707B12DCBA2A4B36B
          8B86F6975AF03719A3FDCF33AEEC16D94B6258E3DBAD946BA4218088A3221642
          42B8D7F3CBC939521100BC948899F5DB0B9EDE7E1F6964AB6D26DBB1DBB375EC
          1D09B9ADA39DD6DBED3186F7C5D1796BCC95612E72A796E708D4B62CECD29E52
          F69C0E4E4D4B0B766F52EBCD493E544108316B6C2A543F648B56BAD3ADEAA0ED
          EEE0773EC25BDBDF1871679AD916323757DAEA0CF6A9A0D6804B2395B3ECD1DD
          E9CA5CE080C2923AB99AFA9C4B903737272C84C0420C8D101D976FAEDA2E1A39
          DBB1FB44155D24D8CB1ED1DD494168A481662A5377D5D29D40030B889F2B91E5
          665806E7E2721B863CCE71CBF678E5CAC64504FF00B3D7691FE169415D744C96
          E76FD836CB92C23266B96975D1D5EA540DAAA16D10D5EC0A1BCD99CC86E21584
          3708623707138E91F2E9FB73C48C81AEAA43F0ECECFEAA4D2CE836A97764BA68
          3D3AB7E5637A985590E81220DAA9D80C30297E171DB1954A543446E7D88E124B
          77CE0DAD88169A020919E8CD012023844570319AC7F0C038D6BA65BA7A869773
          D3B991B5D636BE4CDA66CAA8E3427419B284934BDFC86F766705A81F9ADC64E4
          4AC25187814A02D29A9BC4C16678990855514365D6FF0069176B53B3AC3FB55E
          2FD4AC8E31783D470F36EF156827146BFE974F23F37F1C35F066880F4A4BA858
          B09318F8C08C2702C1B91199C64194C5C50A594F685739276626FED318D814A9
          5C5144A2F1ACDED9ACF26243B31CBB1BAE2F17E9D026A518020F021C36631F19
          C998C67CC6739CF32F85650D7DCF3F0D34A0751E8AAAA4F77DF6A5DBCD1D88BD
          C1983601AAB7529DA2671B576DCFED88B1208B249DFC5226E5075D63B8212D46
          17B994E680CC92A53F40B1802BCF4642BFF0F0DF7626DAEA3EEAEC3F7359FDFD
          7650762D713E9E9B39A7DAC11A90A1AC2C96B9F4760952B0B1CD199BEA68B9C4
          A4509D607C1710295EACE70C12508D191956C48DF96DBEB8A8DA0AF60D054F32
          0C1870DD82D77BCB2EA362C487E200A1EE1885AC28CE11E5D1A7CA8A4DF2B791
          F37E20FCAF8DE2F846F4F40A8AFDC8D7C3B6C355AFED6B4F2D0C0CEBBAAF94D7
          209989971230C685246F310FC544C427167F8AE12E0CCE72479A23ABECEB0FDB
          C029B65400760D453FAB30EF968366D5BCAABFC3F811855E5AC5258C2E8EE1E0
          0DA23C90A9CA3CADF1F04E4D0E07D3D1D78E7CF80D5840BB726C76AA0AB49BE9
          7EC6D60D76421D56D6ED62D858A5FB4F482594D5F8A358A189E0D5A5CED24422
          C58B5875158AD51E50E0DE71299D5E1A1C5B54272D425F3288B58395E033EAF3
          47F611B36AE09BD5B25B479BA6CB83D2973552EB4A56F531709A39AA273D3E02
          FCD4C149C41E66F2992B34802F90B506BDBD3F3C3DB9CA047214DD4D889BC94D
          C581AC788583DB6E2512B0239587761DA4EDA75AAF54F0E73FD0B9A4A6BDA3EC
          6A09F5D917C624F01A52B9D81A764F775325FC756AB51F0C812E706513929370
          C022C9F0318990142D6FEDD8D9B2FAAFBF8CD5AB34AF52E89DCED87D7F986BA2
          39FC2A40EB612AA9F598749AA1DDD398CCDDF9A2C25524DA39AD6EF6F9955283
          8A931E9DDC97571C9C7A8E9139C1B41B2A99EE22C1674EE63AD7B7B4DB857D3F
          7148E69A9EDADD7D79B05254AB8A6D2D02FF00A596053B6853724511A723CA02
          ACB44813BBE493C02C10B4A09A3C714226F1DAD1D57EBF25602F6157AADB749B
          92C9DC2F3B26F3014CAA22E5B5AC68D247083D6D288E4E8884F4CE2B34818827
          8E92F785691A0051F85E6AE2F2A061994CB4D76AAE68FD5D6D593B2155D6DBDB
          424DE64ED4A5DBAFD4CCB1BAA143584F5BE30D538A2ADCA76C9B7662BADE80D8
          A4C6CB54E66E1E58D7A0704EDCADA8D46A9B8472C0CBEBFA3FB844CACAAFA5FB
          45B655430C02B279CC88AA874F2A29656A8EDE7D293F9441F59A7D6C58D69C8D
          4405016238FF009658D3B5815283C3956BD4812961182F7A81AE86EABD2D8A8D
          44C713C37EAADFD65E6421610C6F19C5DF7B58B74059F0D20747700331B0CF7E
          1FE360EC614F96F1B0593E27840062C776C09EC4D92BD9CD31B229E19B4147EC
          86E25EF5258D20AD8E9155EE110DCAB3DEAC2B3686B66AC4B3567512985BAA55
          0DC984EA81D9B1D5138B592E2872467034A30F99FE87EE86D43D52D2CDB8DBAA
          E19F1AFBB1D436C157950EAFD32F710A91EDEE9BB11B258E4AADC72B2AC09D58
          53F7290C6D3AA6F694C8D7313447D6A80389C95D8F20809705D7F85BABF99FE6
          3FAE41FE6E1FC517CB7D3F2BAFCA7D2CFA69F43FC7F9ABA79F2FEF3F30747574
          FECBC8F3FDAF0A2DC1B7E21AEDD57E6AB6FA5FD7ABAC3248FDAF7B2B67C86DE8
          1DBADCD0B15C512BED8ABD5C96475DC8DD12967A38F4B23D213D7149922B34B3
          17B6145AB2422C64D093998DB573F5E09BEA8CFEC0BFAB880F04DF5467F605FD
          5C01E09BEA8CFEC0BFAB8070DAC9AA57FEE2DB719A4B5DAB4935913E93B82342
          048CCDAACC6B6144AD5149CE92CC5F7C2C35C5228D7E2F8AADC57984A54E5079
          885F663323C207B236ADD2C5EB76B56BFEBE14F19910690A5EB2A98520C94626
          F8E9B5FC319E2C7BC0131861C6242DCCF6B11C127231F8201E03CF3CB9F1D50B
          CF007007007007007007007010E78E7CB9FA78039E3D3F9BEDE023C01C01CF1F
          6F3F47E5E00E021CF1E8CFA3F3678039E33F6671C04780B32C6162725CDEE6E2
          CCD2E0E4D23198D4E0B5BD1AA5CD860F1C8C31BD59E418A118861F467258C39C
          E3EDE02F18CE33E9C7FDF9FF00B3F2F0073C63F37FC38039E3F2E3F4E3808F00
          7010E78FCB8FD38E00E78FCB8FD38E00E78FCB8FD38E023C0483882541432541
          452824D0E4269271603493039F4F2194308806633F9F80B4FCAD19FF002E317A
          3ECFF086FF0077E00F95E33FE5D62FFA437FBBF007CAF19FF2EB17FD21BFDDF8
          0AE46D8DEDD8185BD022420333D46051244E97060B1CB964CC12006062E5FD39
          E02BF803803803803803803803806A3BAB6ACEA95D739C58B5BC8AAA89CAD955
          C54848FD73BEA48CC1D1A07495B3363D832F8EAB9A230DD2A5ACCA8F21846F8B
          DB5872F6624C38AB4E8F271980D5CC1FB8E6CBD9578D13128D06AC87C2A6708D
          5392461A76023E5D2F3FDB263B88996E2F19856B1E74B09C1FA2721AAD4C54B4
          ACCC4CA8E5C854293BCE2E72C33B835ADE084F1A3BA6ED1331E49D292600E6BC
          9A0E617C5DF5DB96B5DED0191EAAB8D75B35ADF5A5A95F3B3939C9958ED266AA
          2A5B5244BDD5D1B508CD129610BC031F0854427C94E3A09BD9B05B0BB028E154
          AA8A7566BA7D54DB0CACB5C503B45D575814BEB8C2B574E6947523D96FCC9177
          67B9C59572BFB51928C094320D035E4E6A2959A4F59CF40D49CF742EA9842A80
          AB7167C728A75766AED6618E6BF278BDEAED7DDE712BB9F684975A364D7D71BA
          CA472922230B3CD7C893818AD24970980C6E7F35AB00DD527868919A19DD36F4
          717FBDC88A3B57E2AF123143A5EDB61CCAAE78CBEE9CC75E36C7341D82B364EB
          F88CFD500D056D5B182941CD4E8E71D91203DBD51CF0991B5E0E3108F5391D50
          D80B79EF58FB8ADBA8EE8ABAD09440761EF82E9CB927E82D2866B6393241290A
          97E55907975E075746AA6913F27526BC2D8A28718F2A561725CD4A8E20EC0F87
          21A93F7744D8322ABAE64245974DD759328EBC2C268B3AD0A85D2511EDACD8BA
          82CC570E2B532976EAA2D2768C3D94B5A028D4259244DEA46B27253C27531A6F
          CFC39E1190BF00A04E77B2F297B4EECB4CD9F2B1A767D5AD2B7C8619DBD5F639
          3951B18FCCF14D7D69B0582E5597656D68C71E011D7E90BCA80015455A8684B6
          F2C2853399520214E490C17603B81DD53498EC5D215CAD93B6445D284DD36442
          CADF0C90C2B63A84B075A2AC873DC6275E6D82412597A5895BEFCF8B7E5F58FE
          D6C4E0F284E6D5ECD937193BC57907C7BFDB892DD73B4E8CAE51DE548EB4422C
          BA7B656C590DCD7557B26B252A0945203A6D443E1CD0D0C5348721201292276E
          425C154689638929028DAB2072389CE41AEB47739D87739A51E078AFD04064B2
          18A415A6F2D5C974294A7B42212C99EAE58F7EAAB0A17E4E62A67E7D72C3248D
          B3350D73C30236FC0D63835283487B4232CB781AB149FB93ED141A0BA82E9255
          B5A2FB96C6AF3576EFB56AB4153BDC4E2F634436CADC8A404359D0A091D9CF36
          EBE4EA848D2F705EF8AD1B53B14947F0F54EC4A14EB3CB168F3E4397DD9DCED8
          FA6F6B6B2A16A66CA922CCD25AAE3D62C524D79BB1313876C0D94E773B7D72FB
          AECC33A72746FF0096DFA39075817917C09049E4662F786A330D796E25778EEE
          859E2B7B5F95876F8B42CD852D324D7213BBB73D6513537737D83602065659DF
          72C90526800E0D6D2AD9E62F71D80C124B9C33109141294099BD30402C230F2E
          1FCFEC2647EEE6E952F207074BACF855955C466C3DBCA3DF08A975C2D14B632C
          2F5D68F7EBAA0D7C31B4AA982F657F7898099C6CAEB1821427683C632D436B90
          324AB24208BB87740DAD470BCB5065DAE0535A6D83B32B8FBE5B894C04D085B3
          C7B576BEBFEA98CC85C4CB45055E6BED913A992B8DAC766A93188B0DCC8AC86F
          24D7C116103F0335D94DEBDA56F6DDACAB489EC1ABEB61B7481D6E8ACD16BBC5
          0EBDD55353588D5B57CFEC2576CBDA9589A53165987292BB62307AF89931A934
          7CF6E1A071F8E275ADA638F50A74F77776C18CEBD65B1894D16F7AE755834EA0
          11EBF1155B377F40B526C744EAD9959FBA92F31B67E9232B687A9E392A3CE42C
          D1F355832352254F0EC81B1B8F52308FF101BD7EEB1F3F7CDB527CBDF7D1FBAF
          FDFF007E9ECCBEEE9F427E17E77EF7FF004F3E29FF0097FE77FF00D37F3FF1FF
          00913E71FF001BF8A7CBBFB3E16378DC01C01C01C01C01C01C01C01C01C01C01
          C01C048388215146A752494790780651E41E580D24F28C0E4232CD2478100C28
          C0E738CE058CE33C07C0D2A530D4EA069881A849834294E112588D4A13C2101C
          14E3C872611834000E07D3CB9E3973E011CAEB5CA8CA9251299B57157C4E272E
          9A0069A45236D6FEA7656DA6B9AA7B1B1245AACC506B3C644F6B8F5BF0B4794E
          DD85A78CFC13E28C43C82D05145905964905809289000A28A28012CB28B2C380
          0005803C8002C00C63A438C72C6380F911040CF2D408A2B2A092CD24A3F25832
          71651E328679459BCBC401678C806461C6790B20C73FB31C07C052A50E140429
          8808558C662A08492C21546180C1660D407A3183CC30A06022C8B9F3C6397013
          0A20924A2C828A2CB20A2C24964960080A2CA007A00500B0F2000B0031D380E3
          1CB18E02461020C14953851A409084448D11384C56094834E1C8091A42BA3C34
          E32422E40C83974E3ECE0277974F83FCDE0827CD785E5FCCF860F31E5FAFC5F0
          3C5E9F13C2C0FF005BA39F2E7E9E000A720B34E3CB20901EA3C3F30700B004E3
          FC10F413E31B80E0667860CF20F5673D3FD1C0634BA0B0C749732CF5CA2CC4BA
          6B1C617F8B304A55B62550FACD1C94B9471DE46C8DCE269425291B1EDD21ED4A
          14921160069ADE40858E65879064BE027F1FCD7805799C93E5FC7F0C3E3797EB
          F13C0F17A7AFC3EBFD6E8E7CB9FA780049C819A51E324A19E9F0660838658447
          1383B0109D824C107232F07746302E9E5D5CBD3C07C1C95328C902509C83C494
          FC294C238A2CCCA652001A585427C8C23C94A0251A30F58790B96738FB339E02
          AB80380A2CB720CA5020CA2499425F8382D1E5313E50BF00C01A47869FA3C007
          8269781079071D22C6338E5C04EC2720078D4849282A0D2CB28C3F0583071851
          4230451433718EB196588D16421FB319CE7F2E78002412124298049414C12B04
          848096109212301E8F070560382F05747EAF4F2E5CB8097E451F93F87F944DE4
          3CB792F23E017E4FC9785E0793F2BD1E0795F0BF53A3A7A3A3D1CB97012BA9D7
          D537FEFD4FBB704D1D4EBEA9BFF7EA7DDB81A3A9D7D537FEFD4FBB7034753AFA
          A6FF00DFA9F76E068EA75F54DFFBF53EEDC0D1D4EBEA9BFF007EA7DDB81A39B9
          FAA43ED4ABDDB81A8F53A7A941ED2A3DD781A87373F5487DA957BB70347373F5
          487DA957BB70351EA74F5283DA547BAF034753A7A941ED2A3DD781A87373F548
          7DA957BB70347373F5487DA957BB70347373F5487DA957BB70347373F5487DA9
          57BB70347373F5487DA957BB70347373F5487DA957BB70347373F5487DA957BB
          70347373F5487DA957BB7034753AFAA6FF00DFA9F76E068E6E7EA90FB52AF76E
          068E6E7EA90FB52AF76E068E6E7EA90FB52AF76E068E6E7EA90FB52AF76E068E
          6E7EA90FB52AF76E068E6E7EA90FB52AF76E068E6E7EA90FB52AF76E068E6E7E
          A90FB52AF76E068EA75F54DFFBF53EEDC0D1CDCFD521F6A55EEDC0D1CDCFD521
          F6A55EEDC0D439B9FAA41ED4A7DDB81AFFD9}
        mmHeight = 16934
        mmLeft = 8731
        mmTop = 6350
        mmWidth = 72230
        BandType = 0
      end
    end
    object ppDetailBand7: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 25135
      mmPrintPosition = 0
      object ppsrdevapo: TppSubReport
        OnPrint = ppsrdevapoPrint
        UserName = 'srdevapo'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppsrnivapo
        TraverseAllData = False
        DataPipelineName = 'ppbdepdevapo'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 13758
        mmWidth = 197379
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport6: TppChildReport
          AutoStop = False
          DataPipeline = ppbdepdevapo
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297127
          PrinterSetup.mmPaperWidth = 210079
          PrinterSetup.PaperSize = 9
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppbdepdevapo'
          object ppTitleBand6: TppTitleBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 25135
            mmPrintPosition = 0
            object ppLabel86: TppLabel
              UserName = 'Label86'
              Caption = 'DEVOLUCIONES DE APORTES EFECTUADA POR BENEFICIOS'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 10584
              mmTop = 6086
              mmWidth = 106098
              BandType = 1
            end
            object ppShape63: TppShape
              UserName = 'Shape501'
              mmHeight = 13494
              mmLeft = 10584
              mmTop = 11641
              mmWidth = 106098
              BandType = 1
            end
            object ppLabel87: TppLabel
              UserName = 'Label87'
              Caption = 'A'#241'o al que'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 12435
              mmTop = 12965
              mmWidth = 19578
              BandType = 1
            end
            object ppLabel89: TppLabel
              UserName = 'Label89'
              Caption = 'Monto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 83079
              mmTop = 12965
              mmWidth = 26194
              BandType = 1
            end
            object ppLabel91: TppLabel
              UserName = 'Label91'
              Caption = 'Mes al que'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 45773
              mmTop = 12965
              mmWidth = 21696
              BandType = 1
            end
            object ppLine19: TppLine
              UserName = 'Line19'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 13494
              mmLeft = 37835
              mmTop = 11641
              mmWidth = 3175
              BandType = 1
            end
            object ppLine21: TppLine
              UserName = 'Line21'
              Position = lpLeft
              Weight = 0.750000000000000000
              mmHeight = 13229
              mmLeft = 75406
              mmTop = 11906
              mmWidth = 3175
              BandType = 1
            end
            object ppLabel43: TppLabel
              UserName = 'Label43'
              Caption = 'corresponde'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3662
              mmLeft = 12435
              mmTop = 16404
              mmWidth = 19578
              BandType = 1
            end
            object ppLabel44: TppLabel
              UserName = 'Label44'
              Caption = 'el aporte'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 12435
              mmTop = 19844
              mmWidth = 19578
              BandType = 1
            end
            object ppLabel45: TppLabel
              UserName = 'Label45'
              Caption = 'corresponde'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 45773
              mmTop = 16404
              mmWidth = 21696
              BandType = 1
            end
            object ppLabel46: TppLabel
              UserName = 'Label46'
              Caption = 'el aporte'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 45773
              mmTop = 19844
              mmWidth = 21696
              BandType = 1
            end
            object ppLabel49: TppLabel
              UserName = 'Label49'
              Caption = 'registrado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 83079
              mmTop = 16404
              mmWidth = 26194
              BandType = 1
            end
            object ppLabel51: TppLabel
              UserName = 'Label51'
              Caption = 'del aporte'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 83079
              mmTop = 19844
              mmWidth = 26194
              BandType = 1
            end
          end
          object ppDetailBand13: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppDBText21: TppDBText
              UserName = 'DBText21'
              DataField = 'APOANO'
              DataPipeline = ppbdepdevapo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppbdepdevapo'
              mmHeight = 3969
              mmLeft = 12435
              mmTop = 265
              mmWidth = 17198
              BandType = 4
            end
            object ppDBTmes: TppDBText
              UserName = 'DBTmes'
              DataField = 'MESDESL'
              DataPipeline = ppbdepdevapo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppbdepdevapo'
              mmHeight = 3969
              mmLeft = 45773
              mmTop = 265
              mmWidth = 26458
              BandType = 4
            end
            object ppDBText23: TppDBText
              UserName = 'DBText201'
              DataField = 'DEVMTO'
              DataPipeline = ppbdepdevapo
              DisplayFormat = '#,###0.#0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppbdepdevapo'
              mmHeight = 3969
              mmLeft = 83079
              mmTop = 265
              mmWidth = 17198
              BandType = 4
            end
          end
          object ppSummaryBand13: TppSummaryBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 6879
            mmPrintPosition = 0
            object ppLine25: TppLine
              UserName = 'Line25'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 10584
              mmTop = 0
              mmWidth = 169863
              BandType = 7
            end
            object ppLabel93: TppLabel
              UserName = 'Label93'
              Caption = 'TOTAL :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3768
              mmLeft = 25929
              mmTop = 1058
              mmWidth = 12467
              BandType = 7
            end
            object ppDBCalc17: TppDBCalc
              UserName = 'DBCalc17'
              DataField = 'DEVMTO'
              DataPipeline = ppbdepdevapo
              DisplayFormat = '#,###0.#0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppbdepdevapo'
              mmHeight = 3768
              mmLeft = 83079
              mmTop = 1058
              mmWidth = 17198
              BandType = 7
            end
            object ppLine30: TppLine
              UserName = 'Line202'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 10584
              mmTop = 6085
              mmWidth = 169863
              BandType = 7
            end
            object ppLine26: TppLine
              UserName = 'Line26'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 10584
              mmTop = 6614
              mmWidth = 169863
              BandType = 7
            end
          end
        end
      end
      object ppsrnivapo: TppSubReport
        OnPrint = ppsrnivapoPrint
        UserName = 'srnivapo'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = srFonSol
        TraverseAllData = False
        DataPipelineName = 'ppbdepnivapo'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 8996
        mmWidth = 197379
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport5: TppChildReport
          AutoStop = False
          DataPipeline = ppbdepnivapo
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297127
          PrinterSetup.mmPaperWidth = 210079
          PrinterSetup.PaperSize = 9
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppbdepnivapo'
          object ppTitleBand7: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 26194
            mmPrintPosition = 0
            object ppLabel78: TppLabel
              UserName = 'Label78'
              Caption = 'NIVELACIONES DE APORTES EFECTUADA POR BENEFICIOS'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 10848
              mmTop = 6086
              mmWidth = 104511
              BandType = 1
            end
            object ppShape60: TppShape
              UserName = 'Shape60'
              mmHeight = 14023
              mmLeft = 10848
              mmTop = 11642
              mmWidth = 89429
              BandType = 1
            end
            object ppShape61: TppShape
              UserName = 'Shape61'
              mmHeight = 13758
              mmLeft = 71173
              mmTop = 11642
              mmWidth = 265
              BandType = 1
            end
            object ppLabel79: TppLabel
              UserName = 'Label79'
              Caption = 'A'#241'o al que'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3662
              mmLeft = 11377
              mmTop = 12435
              mmWidth = 21166
              BandType = 1
            end
            object ppShape62: TppShape
              UserName = 'Shape62'
              mmHeight = 13758
              mmLeft = 34396
              mmTop = 11642
              mmWidth = 265
              BandType = 1
            end
            object ppLabel81: TppLabel
              UserName = 'Label81'
              Caption = 'Monto registrado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3662
              mmLeft = 73025
              mmTop = 12435
              mmWidth = 25928
              BandType = 1
            end
            object ppLabel83: TppLabel
              UserName = 'Label83'
              Caption = 'Mes al que'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3662
              mmLeft = 35983
              mmTop = 12435
              mmWidth = 25400
              BandType = 1
            end
            object ppLabel58: TppLabel
              UserName = 'Label58'
              Caption = 'corresponde'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 11377
              mmTop = 16404
              mmWidth = 21166
              BandType = 1
            end
            object ppLabel59: TppLabel
              UserName = 'Label59'
              Caption = 'el aporte'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3662
              mmLeft = 11377
              mmTop = 20373
              mmWidth = 21166
              BandType = 1
            end
            object ppLabel60: TppLabel
              UserName = 'Label60'
              Caption = 'corresponde'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 35983
              mmTop = 16404
              mmWidth = 25400
              BandType = 1
            end
            object ppLabel74: TppLabel
              UserName = 'Label74'
              Caption = 'el aporte'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3662
              mmLeft = 35983
              mmTop = 20373
              mmWidth = 25400
              BandType = 1
            end
            object ppLabel77: TppLabel
              UserName = 'Label77'
              Caption = 'del aporte'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 73025
              mmTop = 16404
              mmWidth = 25928
              BandType = 1
            end
          end
          object ppDetailBand9: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppDBText14: TppDBText
              UserName = 'DBText14'
              DataField = 'TRANSANO'
              DataPipeline = ppbdepnivapo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppbdepnivapo'
              mmHeight = 3969
              mmLeft = 11377
              mmTop = 265
              mmWidth = 19578
              BandType = 4
            end
            object ppDBText15: TppDBText
              UserName = 'DBText15'
              DataField = 'MESDESL'
              DataPipeline = ppbdepnivapo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppbdepnivapo'
              mmHeight = 3969
              mmLeft = 35983
              mmTop = 265
              mmWidth = 34397
              BandType = 4
            end
            object ppDBText20: TppDBText
              UserName = 'DBText20'
              DataField = 'TRANSMTO'
              DataPipeline = ppbdepnivapo
              DisplayFormat = '#,###0.#0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppbdepnivapo'
              mmHeight = 3969
              mmLeft = 71967
              mmTop = 265
              mmWidth = 24605
              BandType = 4
            end
          end
          object ppSummaryBand9: TppSummaryBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 15875
            mmPrintPosition = 0
            object ppLine23: TppLine
              UserName = 'Line23'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 10584
              mmTop = 0
              mmWidth = 169863
              BandType = 7
            end
            object ppLine24: TppLine
              UserName = 'Line24'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 10584
              mmTop = 5556
              mmWidth = 169863
              BandType = 7
            end
            object ppLabel85: TppLabel
              UserName = 'Label85'
              Caption = 'TOTAL :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3768
              mmLeft = 25665
              mmTop = 529
              mmWidth = 12467
              BandType = 7
            end
            object ppDBCalc16: TppDBCalc
              UserName = 'DBCalc102'
              DataField = 'TRANSMTO'
              DataPipeline = ppbdepnivapo
              DisplayFormat = '#,###0.#0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppbdepnivapo'
              mmHeight = 3768
              mmLeft = 71967
              mmTop = 529
              mmWidth = 24605
              BandType = 7
            end
            object ppLine31: TppLine
              UserName = 'Line31'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 10584
              mmTop = 6085
              mmWidth = 169863
              BandType = 7
            end
          end
        end
      end
      object srcreditos: TppSubReport
        OnPrint = srcreditosPrint
        UserName = 'srcreditos'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppbdepcreditos'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 197379
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport9: TppChildReport
          AutoStop = False
          DataPipeline = ppbdepcreditos
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297127
          PrinterSetup.mmPaperWidth = 210079
          PrinterSetup.PaperSize = 9
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppbdepcreditos'
          object ppTitleBand9: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 21431
            mmPrintPosition = 0
            object ppLabel67: TppLabel
              UserName = 'Label67'
              Caption = 'CUOTAS DE CREDITOS PAGADAS POR BENEFICIO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 13229
              mmTop = 15875
              mmWidth = 78317
              BandType = 1
            end
            object ppShape54: TppShape
              UserName = 'Shape54'
              mmHeight = 8996
              mmLeft = 10848
              mmTop = 11642
              mmWidth = 169863
              BandType = 1
            end
            object ppLabel68: TppLabel
              UserName = 'Label68'
              Caption = 'Cuota'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 43392
              mmTop = 14288
              mmWidth = 9260
              BandType = 1
            end
            object ppLabel69: TppLabel
              UserName = 'Label69'
              Caption = 'Amortizaci'#243'n'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 78052
              mmTop = 14023
              mmWidth = 18256
              BandType = 1
            end
            object ppLabel70: TppLabel
              UserName = 'Label70'
              Caption = 'Interes'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 98161
              mmTop = 14023
              mmWidth = 18256
              BandType = 1
            end
            object ppLabel71: TppLabel
              UserName = 'Label71'
              Caption = 'Gastos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 141288
              mmTop = 14023
              mmWidth = 18255
              BandType = 1
            end
            object ppLabel72: TppLabel
              UserName = 'Label72'
              Caption = 'Monto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 161396
              mmTop = 12700
              mmWidth = 18256
              BandType = 1
            end
            object ppShape55: TppShape
              UserName = 'Shape55'
              mmHeight = 8996
              mmLeft = 56886
              mmTop = 11642
              mmWidth = 265
              BandType = 1
            end
            object ppShape56: TppShape
              UserName = 'Shape56'
              mmHeight = 8996
              mmLeft = 76994
              mmTop = 11642
              mmWidth = 265
              BandType = 1
            end
            object ppShape57: TppShape
              UserName = 'Shape57'
              mmHeight = 8996
              mmLeft = 117211
              mmTop = 11642
              mmWidth = 265
              BandType = 1
            end
            object ppLabel73: TppLabel
              UserName = 'Label405'
              Caption = 'Cr'#233'dito N'#186
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 12171
              mmTop = 14288
              mmWidth = 14552
              BandType = 1
            end
            object ppShape58: TppShape
              UserName = 'Shape58'
              mmHeight = 8996
              mmLeft = 42598
              mmTop = 11642
              mmWidth = 265
              BandType = 1
            end
            object ppShape59: TppShape
              UserName = 'Shape59'
              mmHeight = 8996
              mmLeft = 160338
              mmTop = 11642
              mmWidth = 265
              BandType = 1
            end
            object ppLabel76: TppLabel
              UserName = 'Label76'
              Caption = 'Cobrado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 161396
              mmTop = 16140
              mmWidth = 18255
              BandType = 1
            end
            object ppLabel99: TppLabel
              UserName = 'Label99'
              Caption = 'CUOTAS DE CREDITOS PAGADAS POR BENEFICIO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 10848
              mmTop = 6086
              mmWidth = 87577
              BandType = 1
            end
            object ppLabel41: TppLabel
              UserName = 'Label41'
              Caption = 'Fecha de '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3662
              mmLeft = 57944
              mmTop = 12435
              mmWidth = 14097
              BandType = 1
            end
            object ppLabel42: TppLabel
              UserName = 'Label42'
              Caption = 'Vencimiento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 57944
              mmTop = 15875
              mmWidth = 18256
              BandType = 1
            end
            object ppShape1: TppShape
              UserName = 'Shape1'
              mmHeight = 8996
              mmLeft = 97102
              mmTop = 11642
              mmWidth = 265
              BandType = 1
            end
            object ppLabel88: TppLabel
              UserName = 'Label701'
              Caption = 'Desgravamen'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 118269
              mmTop = 14023
              mmWidth = 21167
              BandType = 1
            end
            object ppShape2: TppShape
              UserName = 'Shape2'
              mmHeight = 8996
              mmLeft = 140229
              mmTop = 11906
              mmWidth = 265
              BandType = 1
            end
          end
          object ppDetailBand8: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppDBText16: TppDBText
              UserName = 'DBText2'
              DataField = 'CRECUOTA'
              DataPipeline = ppbdepcreditos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppbdepcreditos'
              mmHeight = 3969
              mmLeft = 43392
              mmTop = 0
              mmWidth = 6879
              BandType = 4
            end
            object ppDBText17: TppDBText
              UserName = 'DBText3'
              DataField = 'CREAMORT'
              DataPipeline = ppbdepcreditos
              DisplayFormat = '#,###0.#0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppbdepcreditos'
              mmHeight = 3969
              mmLeft = 78052
              mmTop = 0
              mmWidth = 18255
              BandType = 4
            end
            object ppDBText18: TppDBText
              UserName = 'DBText4'
              DataField = 'CREINTERES'
              DataPipeline = ppbdepcreditos
              DisplayFormat = '#,###0.#0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppbdepcreditos'
              mmHeight = 3969
              mmLeft = 98161
              mmTop = 0
              mmWidth = 18255
              BandType = 4
            end
            object ppDBText19: TppDBText
              UserName = 'DBText5'
              DataField = 'CREFLAT'
              DataPipeline = ppbdepcreditos
              DisplayFormat = '#,###0.#0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppbdepcreditos'
              mmHeight = 3969
              mmLeft = 141288
              mmTop = 0
              mmWidth = 18255
              BandType = 4
            end
            object ppDBText36: TppDBText
              UserName = 'DBText36'
              DataField = 'CREMTOCOB'
              DataPipeline = ppbdepcreditos
              DisplayFormat = '#,###0.#0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppbdepcreditos'
              mmHeight = 3969
              mmLeft = 161396
              mmTop = 0
              mmWidth = 18255
              BandType = 4
            end
            object ppLabel39: TppLabel
              OnPrint = ppLabel39Print
              UserName = 'Label39'
              Caption = '(D)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3598
              mmLeft = 51065
              mmTop = 0
              mmWidth = 4403
              BandType = 4
            end
            object ppDBText22: TppDBText
              UserName = 'DBText22'
              DataField = 'CREFVEN'
              DataPipeline = ppbdepcreditos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppbdepcreditos'
              mmHeight = 3704
              mmLeft = 57944
              mmTop = 0
              mmWidth = 18256
              BandType = 4
            end
            object ppDBText24: TppDBText
              UserName = 'DBText24'
              DataField = 'MONCOBDESGRAV'
              DataPipeline = ppbdepcreditos
              DisplayFormat = '#,###0.#0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppbdepcreditos'
              mmHeight = 3969
              mmLeft = 118269
              mmTop = 0
              mmWidth = 18255
              BandType = 4
            end
          end
          object ppSummaryBand7: TppSummaryBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 11906
            mmPrintPosition = 0
            object ppLabel75: TppLabel
              UserName = 'Label75'
              Caption = 'TOTAL :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 63765
              mmTop = 265
              mmWidth = 12435
              BandType = 7
            end
            object ppDBCalc12: TppDBCalc
              UserName = 'DBCalc12'
              DataField = 'CREAMORT'
              DataPipeline = ppbdepcreditos
              DisplayFormat = '#,###0.#0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppbdepcreditos'
              mmHeight = 3704
              mmLeft = 78052
              mmTop = 265
              mmWidth = 18256
              BandType = 7
            end
            object ppDBCalc13: TppDBCalc
              UserName = 'DBCalc13'
              DataField = 'CREINTERES'
              DataPipeline = ppbdepcreditos
              DisplayFormat = '#,###0.#0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppbdepcreditos'
              mmHeight = 3704
              mmLeft = 98161
              mmTop = 265
              mmWidth = 18255
              BandType = 7
            end
            object ppDBCalc14: TppDBCalc
              UserName = 'DBCalc14'
              DataField = 'CREFLAT'
              DataPipeline = ppbdepcreditos
              DisplayFormat = '#,###0.#0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppbdepcreditos'
              mmHeight = 3704
              mmLeft = 141288
              mmTop = 265
              mmWidth = 18255
              BandType = 7
            end
            object ppLine22: TppLine
              UserName = 'Line22'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 10584
              mmTop = 4233
              mmWidth = 169863
              BandType = 7
            end
            object ppDBCalc15: TppDBCalc
              UserName = 'DBCalc15'
              DataField = 'CREMTOCOB'
              DataPipeline = ppbdepcreditos
              DisplayFormat = '#,###0.#0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppbdepcreditos'
              mmHeight = 3704
              mmLeft = 161396
              mmTop = 265
              mmWidth = 18255
              BandType = 7
            end
            object ppLabel40: TppLabel
              UserName = 'Label40'
              AutoSize = False
              Caption = 
                '- (D):CUOTAS DIFERIDAS, AL SER PAGADAS SE APLICARA LOS INTERESES' +
                ' REPECTIVOS.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 17727
              mmTop = 5556
              mmWidth = 142082
              BandType = 7
            end
            object ppLine20: TppLine
              UserName = 'Line20'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 10584
              mmTop = 10848
              mmWidth = 169863
              BandType = 7
            end
            object ppLine29: TppLine
              UserName = 'Line201'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 10584
              mmTop = 11377
              mmWidth = 169863
              BandType = 7
            end
            object ppDBCalc18: TppDBCalc
              UserName = 'DBCalc18'
              DataField = 'MONCOBDESGRAV'
              DataPipeline = ppbdepcreditos
              DisplayFormat = '#,###0.#0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppbdepcreditos'
              mmHeight = 3704
              mmLeft = 118269
              mmTop = 529
              mmWidth = 18255
              BandType = 7
            end
          end
          object ppGroup1: TppGroup
            BreakName = 'ppDBText13'
            BreakType = btCustomField
            KeepTogether = True
            OutlineSettings.CreateNode = True
            UserName = 'Group1'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = ''
            object ppGroupHeaderBand1: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 3969
              mmPrintPosition = 0
              object ppDBText13: TppDBText
                UserName = 'DBText1'
                DataField = 'CREDID'
                DataPipeline = ppbdepcreditos
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppbdepcreditos'
                mmHeight = 3969
                mmLeft = 12171
                mmTop = 0
                mmWidth = 29633
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand1: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 4763
              mmPrintPosition = 0
              object ppLabel38: TppLabel
                UserName = 'Label38'
                Caption = 'TOTAL CREDITO :'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 48683
                mmTop = 529
                mmWidth = 27517
                BandType = 5
                GroupNo = 0
              end
              object ppLine15: TppLine
                UserName = 'Line15'
                Weight = 0.750000000000000000
                mmHeight = 265
                mmLeft = 10584
                mmTop = 0
                mmWidth = 169863
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc6: TppDBCalc
                UserName = 'DBCalc6'
                DataField = 'CREAMORT'
                DataPipeline = ppbdepcreditos
                DisplayFormat = '#,###0.#0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = []
                ResetGroup = ppGroup1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppbdepcreditos'
                mmHeight = 3704
                mmLeft = 78052
                mmTop = 529
                mmWidth = 18256
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc7: TppDBCalc
                UserName = 'DBCalc7'
                DataField = 'CREINTERES'
                DataPipeline = ppbdepcreditos
                DisplayFormat = '#,###0.#0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = []
                ResetGroup = ppGroup1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppbdepcreditos'
                mmHeight = 3704
                mmLeft = 98161
                mmTop = 529
                mmWidth = 18255
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc8: TppDBCalc
                UserName = 'DBCalc8'
                DataField = 'CREFLAT'
                DataPipeline = ppbdepcreditos
                DisplayFormat = '#,###0.#0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = []
                ResetGroup = ppGroup1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppbdepcreditos'
                mmHeight = 3704
                mmLeft = 141288
                mmTop = 529
                mmWidth = 18255
                BandType = 5
                GroupNo = 0
              end
              object ppLine16: TppLine
                UserName = 'Line16'
                Weight = 0.750000000000000000
                mmHeight = 265
                mmLeft = 10584
                mmTop = 4498
                mmWidth = 169863
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc9: TppDBCalc
                UserName = 'DBCalc9'
                DataField = 'CREMTOCOB'
                DataPipeline = ppbdepcreditos
                DisplayFormat = '#,###0.#0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = []
                ResetGroup = ppGroup1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppbdepcreditos'
                mmHeight = 3704
                mmLeft = 161396
                mmTop = 529
                mmWidth = 18255
                BandType = 5
                GroupNo = 0
              end
              object ppDBCalc10: TppDBCalc
                UserName = 'DBCalc10'
                DataField = 'MONCOBDESGRAV'
                DataPipeline = ppbdepcreditos
                DisplayFormat = '#,###0.#0'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = []
                ResetGroup = ppGroup1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppbdepcreditos'
                mmHeight = 3704
                mmLeft = 118269
                mmTop = 529
                mmWidth = 18255
                BandType = 5
                GroupNo = 0
              end
            end
          end
        end
      end
      object srFonSol: TppSubReport
        UserName = 'srFonSol'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = srcreditos
        TraverseAllData = False
        DataPipelineName = 'ppbdepfonsol'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 4763
        mmWidth = 197379
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport8: TppChildReport
          AutoStop = False
          DataPipeline = ppbdepfonsol
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297127
          PrinterSetup.mmPaperWidth = 210079
          PrinterSetup.PaperSize = 9
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'ppbdepfonsol'
          object ppTitleBand10: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 21431
            mmPrintPosition = 0
            object ppShape45: TppShape
              UserName = 'Shape45'
              mmHeight = 9525
              mmLeft = 10848
              mmTop = 11906
              mmWidth = 26723
              BandType = 1
            end
            object ppLabel52: TppLabel
              UserName = 'Label52'
              Caption = 'N'#250'mero de'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 11377
              mmTop = 12700
              mmWidth = 24077
              BandType = 1
            end
            object ppLabel53: TppLabel
              UserName = 'Label53'
              Caption = 'MONTO DEVUELTO AL FONDO SOLIDARIO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 10848
              mmTop = 6085
              mmWidth = 73553
              BandType = 1
            end
            object ppShape46: TppShape
              UserName = 'Shape46'
              mmHeight = 9525
              mmLeft = 37306
              mmTop = 11906
              mmWidth = 27781
              BandType = 1
            end
            object ppLabel54: TppLabel
              UserName = 'Label54'
              Caption = 'Importe devuelto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3662
              mmLeft = 37835
              mmTop = 12700
              mmWidth = 25664
              BandType = 1
            end
            object ppShape47: TppShape
              UserName = 'Shape47'
              mmHeight = 9525
              mmLeft = 64823
              mmTop = 11906
              mmWidth = 32279
              BandType = 1
            end
            object ppLabel55: TppLabel
              UserName = 'Label55'
              Caption = 'Usuario que realizo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3662
              mmLeft = 65881
              mmTop = 12435
              mmWidth = 28840
              BandType = 1
            end
            object ppShape48: TppShape
              UserName = 'Shape48'
              mmHeight = 9525
              mmLeft = 96838
              mmTop = 11906
              mmWidth = 52388
              BandType = 1
            end
            object ppLabel56: TppLabel
              UserName = 'Label56'
              Caption = 'Estado de la deuda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              WordWrap = True
              mmHeight = 6879
              mmLeft = 97896
              mmTop = 12700
              mmWidth = 49742
              BandType = 1
            end
            object ppLabel80: TppLabel
              UserName = 'Label80'
              Caption = 'deuda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 11377
              mmTop = 16669
              mmWidth = 24077
              BandType = 1
            end
            object ppLabel82: TppLabel
              UserName = 'Label82'
              Caption = 'al fondo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 37835
              mmTop = 16669
              mmWidth = 25664
              BandType = 1
            end
            object ppLabel84: TppLabel
              UserName = 'Label84'
              Caption = 'la devolucio'#243'n'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 65881
              mmTop = 16933
              mmWidth = 20108
              BandType = 1
            end
          end
          object ppDetailBand11: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object ppDBText29: TppDBText
              UserName = 'DBText29'
              DataField = 'NUM_DEU'
              DataPipeline = ppbdepfonsol
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppbdepfonsol'
              mmHeight = 3969
              mmLeft = 11377
              mmTop = 265
              mmWidth = 23813
              BandType = 4
            end
            object ppDBText30: TppDBText
              UserName = 'DBText30'
              DataField = 'IMP_COB_DEU'
              DataPipeline = ppbdepfonsol
              DisplayFormat = '##,###0.#0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppbdepfonsol'
              mmHeight = 3704
              mmLeft = 37835
              mmTop = 265
              mmWidth = 24341
              BandType = 4
            end
            object ppDBText31: TppDBText
              UserName = 'DBText31'
              DataField = 'USU_COB_DEU'
              DataPipeline = ppbdepfonsol
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppbdepfonsol'
              mmHeight = 3704
              mmLeft = 65881
              mmTop = 265
              mmWidth = 28575
              BandType = 4
            end
            object ppDBText32: TppDBText
              UserName = 'DBText32'
              DataField = 'EST_COB_COD'
              DataPipeline = ppbdepfonsol
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppbdepfonsol'
              mmHeight = 3704
              mmLeft = 97896
              mmTop = 265
              mmWidth = 6350
              BandType = 4
            end
            object ppDBText33: TppDBText
              UserName = 'DBText33'
              DataField = 'EST_COB_DES'
              DataPipeline = ppbdepfonsol
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppbdepfonsol'
              mmHeight = 3704
              mmLeft = 105569
              mmTop = 265
              mmWidth = 42598
              BandType = 4
            end
          end
          object ppSummaryBand8: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 6879
            mmPrintPosition = 0
            object ppLabel57: TppLabel
              UserName = 'Label57'
              Caption = 'TOTAL :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 23548
              mmTop = 1323
              mmWidth = 12435
              BandType = 7
            end
            object ppLine33: TppLine
              UserName = 'Line33'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 10584
              mmTop = 6085
              mmWidth = 169863
              BandType = 7
            end
            object ppLine34: TppLine
              UserName = 'Line34'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 10584
              mmTop = 6614
              mmWidth = 169863
              BandType = 7
            end
            object ppLine35: TppLine
              UserName = 'Line35'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 10584
              mmTop = 265
              mmWidth = 169863
              BandType = 7
            end
            object ppDBCalc11: TppDBCalc
              UserName = 'DBCalc11'
              DataField = 'IMP_COB_DEU'
              DataPipeline = ppbdepfonsol
              DisplayFormat = '##,###0.#0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppbdepfonsol'
              mmHeight = 3704
              mmLeft = 37835
              mmTop = 1323
              mmWidth = 24341
              BandType = 7
            end
          end
        end
      end
      object srCCI: TppSubReport
        UserName = 'srCCI'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppsrdevapo
        TraverseAllData = False
        DataPipelineName = 'dbeCCI'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 18521
        mmWidth = 197379
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport7: TppChildReport
          AutoStop = False
          DataPipeline = dbeCCI
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297127
          PrinterSetup.mmPaperWidth = 210079
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Version = '7.02'
          mmColumnWidth = 0
          DataPipelineName = 'dbeCCI'
          object ppTitleBand8: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 23548
            mmPrintPosition = 0
            object ppShape43: TppShape
              UserName = 'Shape43'
              mmHeight = 9525
              mmLeft = 77258
              mmTop = 14023
              mmWidth = 32544
              BandType = 1
            end
            object ppShape49: TppShape
              UserName = 'Shape49'
              mmHeight = 9525
              mmLeft = 47625
              mmTop = 14023
              mmWidth = 29898
              BandType = 1
            end
            object ppShape42: TppShape
              UserName = 'Shape42'
              mmHeight = 9525
              mmLeft = 12965
              mmTop = 14023
              mmWidth = 34925
              BandType = 1
            end
            object ppLabel1: TppLabel
              UserName = 'Label1'
              Caption = 'Fecha de '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3598
              mmLeft = 55993
              mmTop = 14552
              mmWidth = 14224
              BandType = 1
            end
            object ppLabel2: TppLabel
              UserName = 'Label2'
              Caption = 'APLICACIONES CON CARGO A CUENTA INDIVIDUAL'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Draft 17cpi'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4191
              mmLeft = 12965
              mmTop = 8202
              mmWidth = 88308
              BandType = 1
            end
            object ppShape44: TppShape
              UserName = 'Shape44'
              mmHeight = 9525
              mmLeft = 109538
              mmTop = 14023
              mmWidth = 32279
              BandType = 1
            end
            object ppLabel61: TppLabel
              UserName = 'Label61'
              Caption = 'Monto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 122238
              mmTop = 14817
              mmWidth = 8731
              BandType = 1
            end
            object ppLabel92: TppLabel
              UserName = 'Label801'
              Caption = 'Cr'#233'dito'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 88106
              mmTop = 18785
              mmWidth = 10319
              BandType = 1
            end
            object ppLabel100: TppLabel
              UserName = 'Label100'
              Caption = 'CCI'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 26988
              mmTop = 19050
              mmWidth = 5556
              BandType = 1
            end
            object ppLabel102: TppLabel
              UserName = 'Label102'
              Caption = 'N'#250'mero de'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 19050
              mmTop = 15081
              mmWidth = 24077
              BandType = 1
            end
            object ppLabel3: TppLabel
              UserName = 'Label3'
              Caption = 'N'#250'mero de'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 81227
              mmTop = 14817
              mmWidth = 24077
              BandType = 1
            end
            object ppLabel62: TppLabel
              UserName = 'Label1001'
              Caption = 'CCI'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 60061
              mmTop = 19050
              mmWidth = 5556
              BandType = 1
            end
            object ppLabel103: TppLabel
              UserName = 'Label103'
              Caption = 'Cobrado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 120650
              mmTop = 18785
              mmWidth = 12171
              BandType = 1
            end
          end
          object ppDetailBand10: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5027
            mmPrintPosition = 0
            object ppDBText25: TppDBText
              UserName = 'DBText25'
              DataField = 'MONAPL'
              DataPipeline = dbeCCI
              DisplayFormat = '###,###.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'dbeCCI'
              mmHeight = 3969
              mmLeft = 117211
              mmTop = 1058
              mmWidth = 22225
              BandType = 4
            end
            object ppDBText26: TppDBText
              UserName = 'DBText26'
              DataField = 'CREDID'
              DataPipeline = dbeCCI
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'dbeCCI'
              mmHeight = 3979
              mmLeft = 79111
              mmTop = 1048
              mmWidth = 29104
              BandType = 4
            end
            object ppDBText27: TppDBText
              UserName = 'DBText27'
              DataField = 'CODAPLICA'
              DataPipeline = dbeCCI
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'dbeCCI'
              mmHeight = 3979
              mmLeft = 15610
              mmTop = 794
              mmWidth = 30427
              BandType = 4
            end
            object ppDBText28: TppDBText
              UserName = 'DBText28'
              DataField = 'FECOPERA'
              DataPipeline = dbeCCI
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'dbeCCI'
              mmHeight = 3969
              mmLeft = 52123
              mmTop = 794
              mmWidth = 21167
              BandType = 4
            end
          end
          object ppSummaryBand10: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 6615
            mmPrintPosition = 0
            object ppDBCalc19: TppDBCalc
              UserName = 'DBCalc19'
              DataField = 'MONAPL'
              DataPipeline = dbeCCI
              DisplayFormat = '###,###.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'dbeCCI'
              mmHeight = 3704
              mmLeft = 117211
              mmTop = 1323
              mmWidth = 22225
              BandType = 7
            end
            object ppLine17: TppLine
              UserName = 'Line17'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 12965
              mmTop = 265
              mmWidth = 128852
              BandType = 7
            end
            object ppLine18: TppLine
              UserName = 'Line18'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 12965
              mmTop = 5556
              mmWidth = 128852
              BandType = 7
            end
            object ppLine32: TppLine
              UserName = 'Line32'
              Weight = 0.750000000000000000
              mmHeight = 265
              mmLeft = 12965
              mmTop = 6085
              mmWidth = 128852
              BandType = 7
            end
            object ppLabel101: TppLabel
              UserName = 'Label4'
              Caption = 'TOTAL :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 96838
              mmTop = 1323
              mmWidth = 12435
              BandType = 7
            end
          end
        end
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageSetDesc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Draft 17cpi'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 142346
        mmTop = 794
        mmWidth = 22225
        BandType = 8
      end
    end
  end
  object ppbdepcreditos: TppBDEPipeline
    DataSource = DM1.dsQry20
    UserName = 'bdepcreditos'
    Left = 203
    Top = 32
  end
  object ppbdepnivapo: TppBDEPipeline
    DataSource = DM1.dsQry21
    UserName = 'bdepnivapo'
    Left = 175
    Top = 32
    object ppbdepnivapoppField1: TppField
      FieldAlias = 'CODIGO'
      FieldName = 'CODIGO'
      FieldLength = 12
      DisplayWidth = 12
      Position = 0
    end
    object ppbdepnivapoppField2: TppField
      FieldAlias = 'MODULOID'
      FieldName = 'MODULOID'
      FieldLength = 20
      DisplayWidth = 20
      Position = 1
    end
    object ppbdepnivapoppField3: TppField
      FieldAlias = 'NTABLA'
      FieldName = 'NTABLA'
      FieldLength = 32
      DisplayWidth = 32
      Position = 2
    end
    object ppbdepnivapoppField4: TppField
      FieldAlias = 'USERID'
      FieldName = 'USERID'
      FieldLength = 20
      DisplayWidth = 20
      Position = 3
    end
    object ppbdepnivapoppField5: TppField
      FieldAlias = 'CHK'
      FieldName = 'CHK'
      FieldLength = 1
      DisplayWidth = 1
      Position = 4
    end
    object ppbdepnivapoppField6: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 5
    end
  end
  object ppbdepdevapo: TppBDEPipeline
    DataSource = DM1.dsQry22
    UserName = 'bdepdevapo'
    Left = 147
    Top = 32
  end
  object IdFTP1: TIdFTP
    MaxLineAction = maException
    ReadTimeout = 0
    Host = '10.10.10.41'
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 310
    Top = 29
  end
  object ppbdepfonsol: TppBDEPipeline
    DataSource = DM1.dsQry23
    UserName = 'bdepfonsol'
    Left = 232
    Top = 32
  end
  object dbeCCI: TppBDEPipeline
    DataSource = DM1.dsQry26
    UserName = 'dbeCCI'
    Left = 117
    Top = 32
    object dbeCCIppField1: TppField
      FieldAlias = 'CODIGO'
      FieldName = 'CODIGO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object dbeCCIppField2: TppField
      FieldAlias = 'MODULOID'
      FieldName = 'MODULOID'
      FieldLength = 20
      DisplayWidth = 20
      Position = 1
    end
    object dbeCCIppField3: TppField
      FieldAlias = 'NTABLA'
      FieldName = 'NTABLA'
      FieldLength = 32
      DisplayWidth = 32
      Position = 2
    end
    object dbeCCIppField4: TppField
      FieldAlias = 'USERID'
      FieldName = 'USERID'
      FieldLength = 20
      DisplayWidth = 20
      Position = 3
    end
    object dbeCCIppField5: TppField
      FieldAlias = 'CHK'
      FieldName = 'CHK'
      FieldLength = 1
      DisplayWidth = 1
      Position = 4
    end
    object dbeCCIppField6: TppField
      FieldAlias = 'CIAID'
      FieldName = 'CIAID'
      FieldLength = 2
      DisplayWidth = 2
      Position = 5
    end
  end
  object pprcarrec: TppReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297127
    PrinterSetup.mmPaperWidth = 209815
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 530
    Top = 629
    Version = '7.02'
    mmColumnWidth = 0
    object ppDetailBand12: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 231511
      mmPrintPosition = 0
      object ppImage5: TppImage
        UserName = 'Image5'
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          0A544A504547496D61676543640000FFD8FFE000104A46494600010101012C01
          2C0000FFE110784578696600004D4D002A000000080003876900040000000100
          00083E9C9E0001000000120000105EEA1C00070000080C00000032000000001C
          EA00000008000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000001EA1C00070000080C00000850000000001CEA00
          0000080000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000530065006C006C006F002000560042000000FFE10C
          70687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F003C3F
          787061636B657420626567696E3D27EFBBBF272069643D2757354D304D704365
          6869487A7265537A4E54637A6B633964273F3E0D0A3C783A786D706D65746120
          786D6C6E733A783D2261646F62653A6E733A6D6574612F223E3C7264663A5244
          4620786D6C6E733A7264663D22687474703A2F2F7777772E77332E6F72672F31
          3939392F30322F32322D7264662D73796E7461782D6E7323223E3C7264663A44
          65736372697074696F6E207264663A61626F75743D22757569643A6661663562
          6464352D626133642D313164612D616433312D64333364373531383266316222
          20786D6C6E733A64633D22687474703A2F2F7075726C2E6F72672F64632F656C
          656D656E74732F312E312F222F3E3C7264663A4465736372697074696F6E2072
          64663A61626F75743D22757569643A66616635626464352D626133642D313164
          612D616433312D6433336437353138326631622220786D6C6E733A4D6963726F
          736F667450686F746F3D22687474703A2F2F6E732E6D6963726F736F66742E63
          6F6D2F70686F746F2F312E302F222F3E3C7264663A4465736372697074696F6E
          207264663A61626F75743D22757569643A66616635626464352D626133642D31
          3164612D616433312D6433336437353138326631622220786D6C6E733A4D6963
          726F736F667450686F746F3D22687474703A2F2F6E732E6D6963726F736F6674
          2E636F6D2F70686F746F2F312E302F223E3C4D6963726F736F667450686F746F
          3A4461746541637175697265643E323031352D30382D31345431343A32313A31
          312E3236373C2F4D6963726F736F667450686F746F3A44617465416371756972
          65643E3C4D6963726F736F667450686F746F3A4C6173744B6579776F7264584D
          503E3C7264663A42616720786D6C6E733A7264663D22687474703A2F2F777777
          2E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E73
          23223E3C7264663A6C693E53656C6C6F2056423C2F7264663A6C693E3C2F7264
          663A4261673E0D0A0909093C2F4D6963726F736F667450686F746F3A4C617374
          4B6579776F7264584D503E3C2F7264663A4465736372697074696F6E3E3C7264
          663A4465736372697074696F6E207264663A61626F75743D22757569643A6661
          6635626464352D626133642D313164612D616433312D64333364373531383266
          31622220786D6C6E733A64633D22687474703A2F2F7075726C2E6F72672F6463
          2F656C656D656E74732F312E312F223E3C64633A7375626A6563743E3C726466
          3A42616720786D6C6E733A7264663D22687474703A2F2F7777772E77332E6F72
          672F313939392F30322F32322D7264662D73796E7461782D6E7323223E3C7264
          663A6C693E53656C6C6F2056423C2F7264663A6C693E3C2F7264663A4261673E
          0D0A0909093C2F64633A7375626A6563743E3C2F7264663A4465736372697074
          696F6E3E3C2F7264663A5244463E3C2F783A786D706D6574613E0D0A20202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          0A20202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020200A2020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020200A202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020200A20202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020202020200A2020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020202020202020200A202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020200A20
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020200A20202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020200A2020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020200A202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020200A20202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020202020202020200A2020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020202020202020202020200A202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          200A202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020200A20202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020200A2020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020200A202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020200A20202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          20202020202020202020202020202020202020202020202020200A2020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          202020202020202020202020202020202020202020202020202020202020200A
          202020202020202020202020202020202020202020202020202020203C3F7870
          61636B657420656E643D2777273F3EFFDB004300080606070605080707070909
          080A0C140D0C0B0B0C1912130F141D1A1F1E1D1A1C1C20242E2720222C231C1C
          2837292C30313434341F27393D38323C2E333432FFDB0043010909090C0B0C18
          0D0D1832211C2132323232323232323232323232323232323232323232323232
          32323232323232323232323232323232323232323232323232FFC00011080120
          012003012200021101031101FFC4001F00000105010101010101000000000000
          00000102030405060708090A0BFFC400B5100002010303020403050504040000
          017D01020300041105122131410613516107227114328191A1082342B1C11552
          D1F02433627282090A161718191A25262728292A3435363738393A4344454647
          48494A535455565758595A636465666768696A737475767778797A8384858687
          88898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3
          C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6
          F7F8F9FAFFC4001F010003010101010101010101000000000000010203040506
          0708090A0BFFC400B51100020102040403040705040400010277000102031104
          052131061241510761711322328108144291A1B1C109233352F0156272D10A16
          2434E125F11718191A262728292A35363738393A434445464748494A53545556
          5758595A636465666768696A737475767778797A82838485868788898A929394
          95969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9
          CAD2D3D4D5D6D7D8D9DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C
          03010002110311003F00F7FA28A2800A28A2800A28A2800A28A2800A293239E7
          A552BFD52CB4C80CD797090A0EEC7AFE1401773514F7305B46649E6489075676
          0A3F335E65AE7C51690B5BE890B0249026950B16F70A39AC4B1F0AF8ABC50CB7
          57334D144C48335E96DD9EBC267A671E9D296A4B91DEDF7C44D0AC9C08E67B91
          83B8C4BD31F5C67F0AE75FE2C493CC62B2D277B9E5232DB99BDF8FE5FAD68E97
          F0AF4BB6447D4679EF6653CE0EC423D3039C7E35D6E9FA169BA5E3EC5630407F
          BC89F373EFD4FE34EC2BC8E01B54F1FEB01BC8B192CC0048CA88B1F8B649A83F
          E114F1C6A53C73DCDF084E72435DB6411C13F28F61FA5777E2DD5E5D07C3F35F
          4088D229545DFF007573C6715CFF0081BC7337882F67D3F5058D6EA35F323641
          80EB9C11F51C1A5642D4C287E1AEB77B19377AD44B2A90B8C33E083EF8ED8A0F
          C26D40DC81FDAD07920E449E536F1EBC6EAF4BD53528F4CD3AEAF65C058232DC
          FF0011C703F302BCB7C23E36D5EF7C63656F7F7CF24170CD1B45B400095E3F51
          4F41FCCBB37C2FD594A8B7D66374501417465C0E07A9EDFE7BD46BE05F16D960
          DB6AC09546E16775CE0F03F11CFB57ACE4015C4F8EFC5AFA15BC56963222DF4A
          7793B4308D077C1E327D2934876312D747F885A55A178F5113EDC318A49BCD7C
          67A0DC0E3D300D325F1D78B748891B55D12331B2E43BA14E4FB8247E18CD74DE
          01F125C788F489A5BA2AD3C12F96CEA9B41180471D3BD754F12C8A55C654F623
          23F5A1242F43CFB4BF8B3613AEDD4AD1EDA51D5A23E60FE86BB1B0F11E93A9C1
          E75A5F432AF71BB047B62A95EF83B42BE88C72E9D00F999C346363293D4F1DEB
          90D57E16AC6E25D2AFCA16627CA9DB8F6C11CD3B798B99ADCF500C38E7AD3B35
          E4169A978CBC1A5BFB42D64BBB152048C58CBEF90DDB8EDD2BB0D27E21E83AA2
          A86B836B211F72E38FD47143D0A52475F45315D5D432B6E53C820E734FA0A0A2
          8A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A33400669AC4004
          9358DAE78974ED062CDD499988CAC49CB1AE2FED9E26F1DC6CFA73C7A7695E61
          4F30B9CCA338E08193DFDA9584E4916FC41F108C576DA76850BDD5D02577C6BE
          673E8A3BFD6B3F4BF026ABAF8FB67892F2EA12D2730160CEC318E4F200CFF08F
          4ED5DEE93A169FA3C091D9DAC71B2AAA34810067C0C658F7AD51814D682D5991
          A5787349D1D5459584313018DFB72DF893CD6B818A5A29DC120E9452D148672F
          E3C289E0CD419E312615768233824800FEB5E1BA5EA12E91AB5B6A501FDE5BBE
          E000FBC3A11F8D7B9F8F63F3BC15A8AEEC7C8873FF0003535E45A0786535ED1F
          589D25617562A8638C1EA0E59B3EF81FA51622477DE39D7A1BCF00457368098F
          50D9B371C103EF11F5C800E7DEBCC7C31726D3C59A54DB72A2EA3E4FF77904F1
          F5AAAAD797B1DAD82CD3796B204811989442CD8F97F135B3E33D222F0C6BB145
          66F2910C292EF7E7738E491F95249B13699EFB34F1DB5BC93CCE1638D4BB31EC
          0578969B02F8F7C7D7125E4F2456CC8F30556C315042AA2FA1C107F035BDF12F
          C4D245636FA4C1279666884D74C3B29E8A7F53F9562693F0DB5BBFD3E3BE1710
          DA975DD1C4ECD92A7D71D29D98E4CB7F0FF531A2F8C6EB4557596D2E6568D5D4
          8015D7255871C8238FCABD94B2842C48000CE735F39DEE9DA978375CB57BA555
          9EDDD2E1761DC0807279C7D457B0F8C35B10F81E7BCB59306EA3558CF5243E33
          F9293F951EA117A1C77887C75AA6AFAAAE97E1C320467DA8D08FDE4A7D73D877
          CD501E16F1D6993AEA514D2CB3C658EE173BD88190490C70D9F41EB5ABF0874C
          0CBA8EACE4162CB6C831F742E59B1E9F780FC2BBBBFF0013E8BA65F0B1BCBD48
          6E76EE2AC0F00F3C9028B24B50B37A9C7F81FC7175AB6A2DA3EB00493BA9F29F
          60192012CA7DFB7E0735A5E29F87B67AB234FA6470DA5EB1CB10308FF503BD54
          97C2535CFC40B4F1058CB6F2581904AEC8E090769C8F7F6C7AD761ADEB16DA16
          932DFDD13B1000A8A705DBB0146C3B268F2982EBC57F0F92149551ECE7C158E4
          7DCB9C0CA0E855BF4AF45F0FF8D349F1011143234575804C320DA73EC7BD47E1
          8D6A3F18E88F35DD822012344D1B10EA78EC7D31FAD733E29F875224CDA86804
          A4ABC9B756DA41F543FD286AFB0AEE3E68F51C8F5A2BCCBC27F10584C74CF10B
          F972A9C25CC8A579C0F95C763C9E6BD25245911595832919041C834B6DCB4EE4
          94519A298C28A28A0028A28A0028A28A0028A2909E0D001915C7F8D3C670F872
          0FB340435FCA84AE7A463FBCD4BE32F18C5E1FB66B7B6656BF6FBAA79083D4FF
          0085727E08F0AB6BB76FAF6B225922F34342920FF5CC39F31BD876EC6A512E56
          645E1CF0BEA7E2F9D755D76698D8339758DFEFCDDBF01FD31DABD46583EC7A54
          915842A8D1C4C208D4606E00E3F5A6D96ABA6DF4F35BD9DE413C901024489C36
          C3E9ED5A0483557EC249753C274BF1E6B3A5EA2669AE64BB8D8FEF6191B218FA
          A9ED5EABE1BF1869BE25801B67315C0FBD6F27DEFA8F51F4AF28B67B3F0FFC44
          997538E37B259A68E5DF16E015810AC07E43E9543519ADA2F104AFE1992E044A
          E1EDC229DEBEA5475DB9CF5E71536B31733EA7D100D2D796F853E25B3CD169DA
          E2FCCC76ADD8F5E8038F5F522BD3D581E41E2A8A4C7D07A526690918A5743286
          B1A72EAFA45DE9EEE556E2368CB0ED9E95CF782FC1EDE195BE79E64966BA7507
          68E0228207F3ADFD475CD334B4CDF5F4107B33F24FD2B99BBF8A1A0C591079F7
          0C3B2A607E669A90AC167F0E6C2D7C4A75749A431090CB1DBED1B439F53D5802
          3A56CEAFE16D2B5DBAB7B9BFB7323DBFDDF9F83FEF7AD71F27C5A324816CF449
          A556FBBB9F25BF000D44DF153505E0F875D5B3D0BB8F97FEF9F734EEFA12F951
          D4EA9E05D1F59D71755BB1399832128B26158AF4C8F4C76AE980C003000ED8AF
          35FF0085B2D1C8A6E3419A38B1C93291F90DB8ABF67F15F479D88B9B7BAB7520
          15254386FC052BBEA3B2EE4DE3EF085DF88C5A4F61E51B984953BD8A8DA4E41E
          3AD68DFF0086FCEF020D1061A582D95636EA0BA0C8EBEA47EB5674EF18E83A9B
          05B6D4E1DE780927C849F4C1ADB122C8859082BEA0E453B89A3C67C0BE2A8BC2
          D7B73A76A68E904F2AFCF8E629318C30F4E9935A3E3FB7F0EDE58C9AC5A6A30B
          5FB320C432EEF3003CF4E9D8E7DABB0F1278234DF11665915A0BBC604D18C7E6
          3BD7176FF08EF048A2E3558C44B91FBB8B2D472DC1DED62C7C2459A28356BC76
          096036A73D03AEE271F4047E9595E31D7E5F16788A0D1F4B71716C87645B7859
          A5C64B67DB1FFA15753E254B7F067C3E3A75A619E7C40ACE39727EFB1F7C03FA
          5637C2BD11A4BAB8D6A4561145FB980F186FEF363D3A0FCE862B9E8BA36996DE
          1FD121B488A2C50479773C64E39626B94BDF8ADA4DADD9861B59EE2356DA6418
          5DDF407AD6B78B3FE273E0BBE1A64C27DCA1BF74C0EE504123F215C6FC36B7D1
          755B3BFB1BFB3825BADC186FF98BC78C6467A1CE7F4A92969B1ADAAE99A378FE
          C9AF349B848F53893A38DA48F4917AF5EF5CE787FC5FABF856FE3D33578E56B2
          4CA18D97E641BBAA93D40E401D0F1549A26F067C47B78E2B82D1433C6ACD9C13
          14800DA7FEFAFCD6BD5BC45E17B2F11D988EE014B84CF93301F329FEBCD3B5F7
          16CF4362CEEE1BDB58AE6DE45961957723AF423D6AD578E683ADDFF8135A6D1F
          56576B277072C73B33FC6BE83D6BD7E39124457560548CA907AD1B6E5A7724A2
          8A2818514514005145140066B9EF1678921F0EE94D202AD77202B0467B9F5FA0
          AD5BEBE834DB29AF2E1B6C512EF73DFF000AF1A985EF8F7C5B1463CC8EDD9B6C
          8554B082319EE38048E9EF412DD897C21E1EB9F16EAE754D458C9648F9695B3F
          BF7CE4A8F61D0FBF15EB5A958BDCE8F73676D2181DE1648D947DC24718AE6751
          F14E8FE0B4B7D1E080B0895159232008D4F73EA48E7F1ADBD23C59A3EB6AA2CE
          FA3694FF00CB263B5FF23CD1A2D094783D9DFDEE85ACFDA6176B79E2936C8376
          791FC247715EE1E15F1559F89EC449132A5CC6313424F2BEE3D56BCE7E27787D
          EC35AFED48500B7BCE5DBD241D78F71FD6B0B4FB4D6742B2B1F13583FEE24DC1
          5D3E60B8620AC831DF9FA52B5B6127DCD8F89FA69B5F12FDA32596E63128E318
          EA31EFD17F3AF44F07F8774AD274AB6B9B34124D3C28CF72DCB4808C8E7A77AE
          626807C4FD22DAEA075B3BFB297CA99645DC002324F1FA57A2697629A66976B6
          51BB3A5B42B12B3770001CFE54D0ED7662EA7E04D0356BB5BAB8B4DB26417F24
          EC121FF6B1D6BA2262822258AA468392C7181D2B275FF1369DE1CB612DE4B990
          8F9225E5DCFF008579FCADE26F8898F2E3163A433020B64023D71D5CD0DDC774
          8EA759F88BA3E9ABE5DA937D72490A911E33FEF1E2B9898F8E7C5FB99636B3B1
          63F2A13E4F7FFBE8F4EF5DA681E0BD1F4055686DC4D7400DD7330DCC4FB761F8
          62BA30A07E1C74A2C2D59E6BA67C2787CD59B57BE7B8723E68E205467DDBA9FD
          2BA8B6F03F872D23089A4DBB638CC8379FD735D20A4C63934EE1C88AF6F6505A
          C6B1DBC291228C05450054DB10F247278A7D2138ED45D8D45113C08E0028A7D3
          22B2EEBC2DA2DD97F3B4BB572E7258440127D735B201239A5F6A7762714CE1F5
          1F863E1FBC05ADE192CDF8FF0052D90707AE0E6B0DFC09E25D0E6F3745D65E64
          50C423B3291C71C1C83FA57A985A42BCD20B34793C3E3BF12787E65875CD38BC
          4C060BA794DC75C11F7BF1AED7C39E2FD33C49137D9DDA1B84FBF6F2E032FB8C
          7DE1C7515BB736B05DC2F05C449244C30CAE320D79B6B7F0CA64BE6BBF0FCAB0
          8186489988DADCE769F4E9D680BF73BCD6B43B1D7ACFEC97F1178B258618A953
          8C718FAD64789AC8E95E01BBB3D282DBC36F0055009F96307E623BE704F35C86
          8DF10F53D12EC693E22B77731B6D7949C48809EADD88F4C735E9F6D716BA9D8A
          CF6F2473DBCCB90C39073EB40FD0F39F851731FD9B54D3A597E6F303A465BA2E
          369233EF5CEF8BB499BC17E2882F74A984513169EDCF38523EF29F51FD18D747
          E21F87F7B637A354F0D48C8EBF30855F0C0E73F29E847B1AE73FB07C59E2BBD8
          ADF5386E435AA05592E46D55F7FF0068E0734ADA5847A358693A3F8A1F4BF144
          B67FE9451655E4E37818191DF0718FA569F89B589341D125BE8A0133290A431C
          28CF76F6FF001AB7A4D847A5E956D62872B046101E99C753597E31D66C34AD02
          E96F1E32F342CB144C325CE3038F4CE39A6F40E86624BA4FC45F0D3ED012ED54
          2BEE5CB42E4640E7B1AE57C35E28BFF096AA746D6C91668C5189EB01CF0C0F74
          C75F4E3E95C9681AD5E685AA8D4AC9649220E12655C8128FEE67A67D2BD17C53
          6765E31F0C26B9A4C5E6DCC6BF3AA8F9B68192AC07248CF1E84E696FB8AFD8F4
          7475650E1815600820FAD495E67F0D7C54F76BFD877526E785336D213CB28E36
          7BED18E7D2BD2F34169A62D1482968282909183CD2D739E31D73FB0741927424
          5C4A7CA840FEF11C9FC064D026CE17E206B573AB6B29A1E9E7CC45755DA983E6
          4A4E31CFA703F3AEFF00C39E1FB5F0FE98B6D002F239DD2CACA373B7BFF2AE1B
          E19E846F2F66F10DCB3C9B1DA383CCE72DDDBF0E9F5CD7AAEE51DFF0A1684AD5
          DCF3FF001FF8365D623FED2D3D73771A6248F1CCCA3A7E38CFE95E3C567826C6
          5A1915B1DD483E95F501C115C0F8DFC089ADEFD4AC404BE51F3C7B7E5980E47D
          1BDFBD1626499E69AA5FF891B48B7B5D55EE25B17DB3C0655CEE014853BBD0E7
          38F6AEA7E18EA1F6892EBC3F76826B2B88D9C239C8046370C7BE7350F813C42F
          0DE47E1AD4E2FB45ACB2948E39577185C64E08F43E9D8035E95A5F85B47D22F5
          AF2C6C5219D976965C9C0E3200E8A381D00A6B6122CE8FA269FA1C1245616E21
          591CBBFCC58B374EA79E2B17C5DE36B6F0FA1B5B60B71A9C836A420E7613D370
          FE9D6AB78EFC5C346B5FECEB362DA8DC2E3F7632D103DFEA7B0A83C17E085D38
          26A7AA47E66A2E4BAAB124459CF3CFF11C8CD1B97B6C51D17C0D79AD5E0D63C5
          33C92990E56D49E587A3FB7A2D7A4450A451AC688151400140C014F031D071DA
          9C2804BB89D28A5C5140C0521A5A28013146326968A00292968C5031334B4521
          3484068C0C5377A9E334D69511955DD01638033D698191ADF8674BD76161796A
          865C616603E7538E307BD79B4536B1F0DF5868E557BAD3266CFDF2038FEF03D9
          FDABD8430604E47155AFAC2D752B47B6BC852585C72AC3A7D3D2825F915B47D7
          2C75DB21736328707865EEA7D1AB480041C0CD7925DE8BA97C3BD522D4ECE596
          EB4C2713A6EC6E078C38F5C1E2BD334AD52D357B08AF2CE40F149D33D41EE08E
          C7DA80462F8CBC570F876C5A38DB7DFCC87CB5047C9C7DF3E98F4EF5E71A3E89
          AC7C41D5E4BFD426912D9080F3B26030CF08807EA6BB9F107C3D875FF108D466
          BE956091544B10EBC0E02B76CD761696B059DB476F046B1431285445E1547A0A
          61AB338F86F4BFEC43A47D8905991B7CB031D075CFAFBFE14DF0EF86AD7C396B
          3DBDABC8E934A6460E7B918C7E95A37FA9D9E97079D7B711DBC59C0676C67F0A
          F38D77E2AE59E1D12DF247FCBC4CBDBBE16A5B2AC8A5E3DF0F4FA0EB316BBA6B
          986191FE6318C08A4EC4FB1E95E8BE15D6D7C41A05B5E90165394957D1D7AD73
          3E15F11DB78E345B9D275654FB5AE55D54637AE7875FA5735E16D4E4F0878C65
          D26EE52B68F218661BB2AAE7051FF1E01FAFB53E84AB267B4514C0D9EFCE69F4
          8B1BD8D79A7C41F375CD734CF0FDB27CC5C333EDDC17771B881D80CD7A674155
          0595BADEB5DAC09F686508650BF36D1D89F4A04D18379A45C69BE039B4CD38B1
          9E1B5D8AC8B8673FC447FB4DCFE26BC4E25D46E7538EC2DDA63732C9F2C4242B
          97F7CF435F4A11C1F4C57997C43F07C6F136B9A7C4C9708774EA9C03FF004D38
          E72391C7273435725A6B6392BDBFF18F85444B7B737506FDC519A6F3010303A6
          4F7A9CFC44F16C7147279ABE5B0CAB3DB0C363AE0E39ACDD385D78ABC43A658E
          A7A8492A12B199257C9DAA32473DC85C7D5B35EF71DA4096F1C0224F2A301510
          AE42803000A60B538EF04B8F1024BAC5FE976697B04E6386E604DBBC606E38CF
          5C9209ADEF14EBD1681A3C970CEA27752B029EEF8FE95ACEF15ADBBC8C5228A3
          52CC4FCAA07524D79569D1DD7C40F16B5D5EA2B58587400111B10D951F8F04FB
          5202E780BC37717F7C9E26D559A4DC0F92253B8BB67FD61F4EF81EF9E8057A80
          005448AC8A01C1C7A71ED530A634828A28A061451450014518AC5F11788AD3C3
          5A69BCBB059721422E32C7BE052036A8A82DE74B8B78E64CEC9143AE7D0D4F4C
          028A292818B9C5715F107C4B7BA059DB45618492E377EF4AE7601B7A0F5E6BB3
          62075AF3BF10CF677FAFCFA9DE3BBE9BE1E519418C4B724E420FFC7411F4A44B
          661F84E0D535EF105EDA6A7AC6B10BC3002C82668DBEF71BB8F9719E00C1EBCD
          76EDE04D05E6599EDE79251FC6D73212C7DCE6A3F054177776F3EBFA944A97DA
          8B02001F7215E2303EA324FD6BAC193E8299293671C7C016D684BE91A9EA1A6B
          E491E54DB97FEF93511B7F1A6896C3C9BAB7D5C062ECB247E5C9B40076820E32
          704576EC38EB47B914156391D3FC4DA4F8984FA3DDDACB6F70C18359DCA61881
          E99E32073F4E6B8EB79A5F873E3492194BBE91760063C818EA1BD3239045753E
          3ED0CCD6075AB26F2350B006449178DCA3D7D48ED4B341078FFC0D14CBB05DB4
          595207FAB980C30FA678FC6811D843224D0A488728CA194FB1E95C778DFC5F77
          E1E78EDACE04F31E3DFE739E0738C01DEB3BE1BEBF31337876FCBADD5B64C3E6
          1C9283829F553FA56A7C46D18EA5E1EFB4C6A5AE2CDBCC03FBC87861F8707F0A
          013D0F3A4D1F5EF1659DEEAFE7BCFE4E02461B73B9383851E983B89F6ADBF853
          2D88BCBCB29E1417C4168D8AF44E8CBF5CD687C2BD650C173A3C8AAB2C6DE723
          01F7D480083EE08FCAA3D67C23A8699E3AB1D5B46B5796DE4B85965546DA1304
          061F420E7F034217430FC57653F83BC631DFE9A0C11CBFBC8767DD3EA87F5FD2
          B53C7DA7C3A9693A778A6CC652644F37031C372ADF504907EB5E83AEF87AC7C4
          762B697A8DB51832B2360A91E86A47D0EC8E83FD8AB1EDB410792ABD703A03F5
          14058CCF026B7FDB3E1D8FCC72D736A7CA949EF8E87FEF9C57535E4FF0ECBE8B
          E2ED4F469F70327CA9CE46E424F3F55271EC2BD63341716154EFAFED74DB392E
          EEE511C11804B1F7E0003B9AB67A5794FC58D6B6C9069A8495897CE9154FF111
          F28F7EE7F1A43B9D11F899A08BA580FDA9149C091A21B4FE20E47E22BABB7BAB
          7BEB28EE2091258255DC8CBD187A8AF2ED67E1FE9BA5F82DAF9DE71A8C51A33C
          85BE52C5B95C76196FD2B93D27C6DAC683A73D8D94D1246CDB93CC8F26263D40
          FAFA76A64731D0F8DBC1F268373FDB3A6EEFB18937B04054DB367208C76CE719
          EE715E9BE1CBABCBED034FB8D462F2AF258434AA077EC7D89001C76CE2BC86CA
          D7C5FE309D7CC92F1AD1D82B4B236C8D5377DE038C9009C60735EDCEEB6D6C5E
          460123425D88E800EBFA500ADD0E13E257888DB5A268964C4DDDD150FB3F8549
          C01F89E2BAAF0DE890E81A3C361110CCBF34B277773C93FA62BC92DEDB58F18F
          8B2E6FAC1118C33890C92B1554C10138E79C2E31ED9ADFBFF1B78BB409CC1A96
          9B6EF81B8BEC620AFB3020763DA8D6C17573D54609C77A5E3D6BCCF4BF883AFE
          AD2BC567A14172F185691239B0501E075F706B65BC5BAEC6E43F83B502A33929
          229FCA96A55D58ECCD15C4A78EB50FB379F2F84F55540B962AB9FE951C7F126C
          15952F34DD4ADCB9E034391D71C53D42E8EEA8AE49FE21E831C65E692EA25071
          992D9D47F2AB7278DBC3B1A02DAA45C9C1F95891F862803A1270335E6FA9447C
          5FF10A1B00049A66979FB4FF0075981C95C7FBC00FA29A4F12FC4DB58ADE4B7D
          155A699D302E0F017DC77349F0D359B08F48BA4BABC823BBFB433CBE6BED2471
          F364F5E4E3F03EB4AE84DA67A42A8450AA3E5180001D074A7D528B54D3EE0131
          5F5B4817A95954E3F5A92D2FAD6FA3325ADCC53A0382D1B8600FA7145C659A0F
          4A89E68E2467775545192CC7005721A978F20178BA6E896CDAADFB8202A1C463
          1D4963C501737F5CD561D1746BABF98AED8109019B019B1C293EF5E6DE0ED0AF
          B5D5867D4E451A1C53BDC7924E0CF3B104EEFEF2E71D7A9AEC2DFC2A2FEE4DFF
          0088E45BDB9651B6DBFE58DBFA851DFDC9F7AC5F896B7AD65A7E99A75ACAD148
          C5CAC51EE00AE368C0F4EB4C93D091551142E02818000C7D29FD0D7836987C61
          F67365A7FF0068E23732154DE00F6CB71F874AEBFC3BA678D2D3598754D454DC
          472A18E5864B9C10A4FDEC723F0A577D42F13D33231D68AC3D11B588A1B91AE3
          41BFED0DE4187BA1E83F33C559D4F5ED3347B7335FDEC7127605B2C4FA003AD3
          1926AB25B43A5DD3DD0CDBAC2C645EE571D3EB5CDFC358258FC2492CBB556795
          E48C2765381FCD4FE75957B79A87C40B88AD34879AD7425502EAE1D0A79D9619
          45E79F947D39EFD2BBEB3B68ACED62B6B78D6286250A88A3EEA8E8280B1E69F1
          03489347D66DBC4D64DB5CCC19F03215C74FC08E0D7A1697A85BEB5A34179100
          629E3195F7C60AD47E23D2975BD0AEEC4805DD098CFA38E57F5AE2BE176A72C7
          25EE873A60464CC9FEC9CE197F3FEB413B31DA7781B50D23C7705FD934634F47
          66C93CEC6046CC77C6457A14D756D6CA7CE9E34DA32773018AC7F16D96A9A868
          325BE912B4574CEA432C9B0900F2335C0D87C33D66F59CEABA8AC08790AAC646
          3EF9CD1B8D68763A97C41F0F69D218BED4F3CA3AAC09BB1F89E2A968FF00126C
          B59D660B08ECE5896662A923B0E78CF6AE23C1BA2D83F8E6E74BD4905C2C6B2A
          46AE301D9580C919F63C56C7C41D16DF403A7EA5A45B2DB6242AC215DA377553
          ED8C1E3BD017627C4169343F17E9FACDB290EFB64651C0731B0C8FC54815EA96
          D3A5D5B453C64149555D48F422B84F88D6F1EA7E10B4D4963626378DC30EAAAE
          003FFB2D6A7C3BD41EFBC236CB20F9ED98C0493D40C107F22281ADCEB0F4AF06
          F1B49763C617773343B424E0C69283B5D5785181D8E07E75EF44641AAF736B05
          E4463B8863963FEEC88187E4680699E33E24F888FAFE8B1D84766F0EE2A66766
          043118E98E8339E2B73E185AE852E8EEF2ADB4BA9B4ACB279A4160A4E14007A0
          2318C56C6ADF0C746BEDCD6BBAC9D9B2FB0EE5C7FBA78AE4EFBE136AB6DB9AD2
          EADEE973C263CB623F2238A56645FC8F62545550170060631C573BE39D4974CF
          0A5D311B9AE3FD1D31EAC3FC01A93C2167AAD8E8890EB33B4B765C91B9F7945E
          00527BF426B85F8B1AB09AEADB4F8240C6DC179113A97230ABFE7D68BB2B448E
          93E1869B1DAF8596ED5CB4B7923C8E48F42547E833F8D755AADABDE695776D16
          37CD03C6A5BA64A9009FC68D26D23D3F4BB5B58D3624512A818C76E73EF9ABAD
          F3034C12D0F3FF0086370534DBAD3AE1228EE2CE531E0A6D9190F3CE79C06661
          F8D7A0F15C46BFE15D446B0BAF787E648AFD7868A450164CF5C9F4E99FA53E4F
          18EABA65AA1D53C357BE6F467B621D09F6C1C8A0134B73B3C1EBDB1EB4D65070
          48076F72335C3FFC279A9CF32ADA784B539011B8965DA73F88E956F678CF560C
          4CF69A340E06D554F3A500F5CF6CD03BA343C45E21B0D0EDB33A7DA2E98622B5
          8F05DFE8315CC7F606B7E30BE2DADC434ED2633986D61C076247249EBEC49C7B
          015D8E97A0D9E9419D15A6B990832DCCBF349237A927FA56B63140ACCE557E1F
          786D4B13A6464326C2092401EA3DEA0B3F873E1F82CBC99ED45CCACA15E6919B
          2718CE0678E4576549F85171F2A3859BE16E80CC5A1FB4C276328024CA824FA1
          06B9A3F0CB5EB5BDC595EC42227FD6895931CF52A3AD7AF6297140AC79D45F0E
          6F6FAC1A3D635BB99262D9558D8B46AB9C9E0F538CD258FC316D3E68AE2DF5EB
          B86E173BA48634538239C71EB8AF46C0A38A02C71EFA0789D2F8DC45E2890C7B
          91444D6CA404046E247427E8052DE687E2A7BB125AF8982464B1C496AB940482
          000383C7AD75F8A08A0394E1A3D23C74669C49E21B658640DB596004A9ED818E
          3F3A593C3FE309ED9A36F148196C065B7084AFD4722BB7DB93ED46DA770E5671
          171E02BBBF895351F12EA770170760C2AE7D80A9AC3E1BE8366DBE6865BB93B9
          9D890C7DC0AEC738A504633DA90EC436F0476F0AC312048D06155780054B8A5C
          8A4CE78C7EB400671DEBC92F2297C3BF156DE48BE58EE660DF37465909040FF8
          1122BD68A8C579AFC568CDB9D37508462642EA1BD082197F5068133D281C8CD7
          3BE28F14DAF86EC8B3E64B961FBB840EA7D4FA0ADAB1BA179A7DBDC81C4D12C9
          8FA8CD79AEB5E0DD575EF1B5C7DA19D74F69558CCC78F2F1F754763C6DFC6903
          D8E2E09B568A45F11A2485C4E5FCD11931972C4B0C8E9EBCFAE2AD788BC5DA87
          8BFECB6496C8843E160872774846339F4ED5EE16DA7DB59D9259C5122DBA2ED0
          9818C77CD430E9FA4D83B4B0DB5A5BC9C29655553F9D5585666749A248FE01FE
          C7972D28B11163A9DC14607E62B93F84BA81FF004FD39D8EE2567419E830030F
          D457A32DD5BDD4130B5B88E42A0AE6370707A7F3AF2AF85DE5C5E29BC4C61BEC
          C55415E7861C67F0A4C7D51EB77330B7B796661F2C6A5C8FA0CD784DF6A9E24F
          165DDD5D5AC776D1DBFCF22C1210B08E46000793D4F4CF19E95ED7AD5CC767A2
          5ECF29F91207CE3BF04579C7C30D5F4DB0B3D46D6EAEA282E1A559B323850C9B
          78C64F38C1FCC521B660683E3ED63C3AB3D95D87BB4466558A7C8789F278DC72
          7AFAE78F4AB37BE3FF00107882E459E9E861677CC715A29DED83C64F5C7D3158
          73436BAF78E9E18A4315BDEDFB224883254331E40FF3D6BDCF47D074CD121F2F
          4FB286DC30192AB8661EE7BD0AE1A8787EDAF2D341B1B6D464325DC7084998B6
          EC9EFCF7FAD79A6BF68355F8AF059C71AAE6E23763D4ED50AC48FCABD80E00E9
          5E5F6C824F8D6E4B7DC591B3EFE5E31F91FCE9899E9EA334EE2907159973E22D
          1ECEE7ECD71A95B473F4D8D20CE7E940D6C6A52119EA3A735CF4DE38F0E42A4F
          F6A44E41036C79639F4E055293E23F87500C5C4AC7A10B11A570BA3AE2A3834B
          815C349F1474042760B9603186118C1CFE3DAA94FF0016ACA1B858BFB3A760C3
          3B84838A61747A3714B5E5777F174ABFFA369AA00E089A4C1FD2ABCFF15B5199
          02DA69B1063C163B9CFD428A05CC8F5BA323D6BC69FC61E35D4544705B4E9B8F
          063B6DADFAD1FF00170EE42A8FED105B395F9578CFA9E29598731ECB91EB4D2E
          AA092C001CF26BC9C786BC797717937178522037006ECE59B3D4919C1A745E03
          F13DC28B7BDD597C9656C83233679FBA47E6DDFF000A760E667A68D4AC9A3320
          BB83CB1D5B78E2A03AF692B2344DA95A8917AAF9C2BCEE0F85376BBC4BAAC4A7
          AA3246723EBCD3EC7E18DB1BC9A3935EF31940DF1C280302DC65B9EF86A41767
          692F8C7C3D1052FAADB60AEE1CE722A84BF123C330BE0DEBB0F5485B1FCAB253
          E12E9AB1053A95E9C367202AF1E9D2AE2FC2ED000E1EF338C67CD1D7F2A0351D
          27C50F0EAB611AE9CE71F2C06A9DCFC56D2E3E2DACAE66C8272DB540FC09ABD0
          FC31F0E450EC6867933DDE76CFE845681F02F869A1584E916DB17FD9393F53DF
          F1A63D4E464F8BF9C793A46411CEE9FBFE5551FE29EB52B30B7D2EDB00E0905D
          981F4E473F857A747A369D08411D85B2ECE53110E3E9528B1B646056DE152393
          FBB1D6803C91FC57E35BED863B59E219C1F2ADF1C7A723F5A73C3F1175053BBE
          DA8920391B963CFE1C62BD840E39A5C7B50079E783743F15E9FAA7DA755B926D
          4C7B5A179CB93E9EB822A6F8AB007F0D4126788EE3047D54FF008577B8F6AE4B
          E22DAFDA3C1D3B9F9BC9923723D7E60A7F46A04CB7E08BA7BAF0769923672B17
          97CFA212A3F90AE73C717DE2A83578E0D245CADA14DCA6DD012C472D93DAB77E
          1E4663F03E9A08C1224EBFEFB565F8FEF3C4562F0CFA4B4AB682322568937156
          27A9F6E94C2F64722DA678F754812375BE0B8C7EFA5DA0E7F1FE94F83E19788E
          4399EEADE30FB99B1216F9B1818E3F1ADFF0F7C4E82544B7D6D3C99C706E107C
          8DF51D8D77561ABE9FAA26EB1BC8A7180C446F9201F5145C1338CF0B7C3BB9D0
          6EE3BB7D6255718F321B75DA920FEE9279C67D31581E0311DAFC44BB863930A4
          4D185ECFB5B83FCF1FF02AF61C0C578F6896E2DFE2FC8830A91CF3E01EE18363
          F9FE9481A67A96B1A70D5749B9B1673189936EF033B4E735E4BA8FC2BD6A3903
          5ACB693A9CB60B1439FA6319AF6AED4CC0FAD0368F0397E1F78AACA4574B177D
          A772B4328CA9EC41CD5DD37FE13FD3E64FB3C1AA15565CC520257DC1C8231EF5
          ED1F6CB5373F6533C7F68C67CBDE3763D715CF78DBC492F8674B8A7B689249E6
          976AEFFBA303273F952E564DBCCE9A36631A6FE1C81BABCB2C9C8F8BD34B2939
          8E4940F64F2CF3F962BD03C3DABAEBBA0D9EA4A9B3CF8F2C9FDD6070CBFF007D
          035C25FA1B0F8C1693B61629D863038F9936E73EED9FCE98DEC7A3D85FDB6A56
          30DEDAC81E0997746C38C8AE164F8536B25C4B23EA73ED724ED58C03C9CF27DA
          BD0218A386358E240A8A30AAA30147B54DC503DCF3BFF854BA617DCDA85E6300
          6005EBEBD2AD47F0ABC3E80177BC91F3CB1987F857754940591C8C1F0DFC3700
          19B26971DE4958FF00222AC0F01786C4CB28D2E3DEA49FBCDCFB75AE98714679
          A2E2B2326DBC39A3D993E469B6C849CFFAB07F9D5F4B58633F2431AFA15502A7
          241A381DE81D90DC75FA5721E21F154BE1EF1369D6F3247FD977119DF21EB1B6
          719FA723F3AEC31EFD6B92F1F689FDB7E1F730C3E65CC0774631F311FC400FA7
          F2A034398F1C78CAFD3593A669170D1C70AE6478796673D81F6AE56F3C55E299
          F49F2E7B9B910A4BB4CDB5958B91F74B0E3B1AEE3E19E83259DA5D6A17D69E5C
          D348A2159530C8807500F4073FA56D78EB44975CF0FF00916AA5A686512AA2F5
          6E186073D79CFE149A62B3B9E7126B5F63BDB383C3DAC6A0CF310921B97C2076
          1B471D3AB1E7AE4FB56C7813C3DE23D23C58935D5B4F05A14712B970438E7683
          EBC9EB54B48F873ADCFAA4125DC4969044E92B1660DBB043600078E95EC4668D
          4952CBB80C919E714EC2B93039147190055792EA08A069E5963489012CECC005
          006793F4ACFD5BC49A56896D14F7B76AAB2FFAB2B972C319C803AD3B02923631
          9A5C0FCEB0349F16E91AC492A59DD65E252EF1BA6D200EFCF6ABF69ABD95FE97
          FDA3693ACD68519B7A1C8C2F5A452923409C527535E7979F15F4EB7204165713
          82090DBC0A4D2FE215FEA835190690B1450C0ED03B39DAD20C6109C753B8501C
          C8F45DC338A3AF4AF1FB9F89DAFC3A87D95B4EB7865F3163F25D58B67763D6BD
          754960095C66804C90D72FE3E765F065FE08F982827FE06B5D39E95C3FC4FB8F
          27C2BE56EC19E745FCB27F9E2806697805597C11A50720B345BB8F7626BA4600
          839E7B5617836036FE0DD2118FCDF6643CFB8CFF005AC1F1878EA5D0EFA4D3ED
          21469D50334921F94679C63E94C57B6E72FE23D121D47E232E99037D992E5806
          2983D1093C76E47EB5977705CF8275B0B63AAC73EE4C99623CEDCB00AC33ED9F
          CAA3B4D2BC43E30BC6D4EDD1C33B92D3E70324638F6AEB34DF84E19F7EAD7ECC
          C4F2901C6F1CF563CE7A516158D9F03F8BAEBC4325C5BDD2A3B42370950633EC
          7D2B93D28349F19A5D8BB825CCFBB83D30715EA1A3E83A7E856BF67D3EDD6253
          8DCDD4B7D6BCD3C2AC24F8A771204650CD70D927DFBD20D4F5F638AF34F08F8A
          66FF0084B751D26FE795C5C4CED6E642582956C6C03B0DA33FF01AF4A22BC7B5
          FBA3E0EF88936A8B64B32CCBE620DC46770C361BF3FCE81B21F1CDDC9A57C458
          2F7253CB6866539E028C06C0F4E0D76BF11AD3EDBE1095D42B790EB37FC07952
          73FF0002AF29F17788CF8AB544B95B5FB32246218D4B6E2C324FA7BD49278A7C
          45A968F1E885DA7840550123FDE301823247F938A5726FADCF43F855A909F44B
          9D3D8FCF6B3165FF0071B91FAEEAA5F12A4FB0F88347D411D84B17CC3D00470D
          93F5CFE1537C2BD1B52D323D4AE2FED64B68E768C4424E0E1436703D3E61F8E6
          B57E24694350F0CBDCA90B35A37980E3A8E857F91FF80D31AD8EBE1956689244
          3F23A8607DAA5AE57E1FEA4BA8F846D307E7B606DDC7A15E9FF8E915D50A0684
          2715526D46CEDED5AEA6B9896DD7832171B7352DD7369360E1BCB6C7E55F3EE9
          856F353D3F4D9EE592CDEE143EE72573DCE3B1FE1CFF00B54033DAB4EF1868BA
          A5D7D9AD6EF329FBA1D4A6FF00F773D6A8EB9E3ED2343B96B5732DC5CA1DAEB1
          01853EE4F02B0FE21E8DA4E9FE178E6B7B58ADE78A4510EC1C904E48E39ED5C4
          699A2DC5F34379A66A964F78430920B8214A7047718618E87AE4F6EB40B53D1A
          FF00E2469D068F6B7D6D0CB23DC3B22C2C7695DBF789EA0F51507863C7F75E21
          D6D6CC69812DD90B09237DDB31CE5B23EEF41C7F7ABC7EE64932D6ACEDB22662
          AA186327EF63B63815D8F8062D3EC758B5D4AF35AB780ED644B64243B16046D7
          247033C81EB81DA9095CF42F1A78AE4F0D25B086D96596727EF9E001FD79AE6B
          FE13ED6348D6D2DB5BB6B6303005FEC841280E70C39C3738CFD2A6F8B16D27D9
          AC2F1492BB8C4500CFCC48231FAFE55C96A5E18BDF095EDADEEA36F15ED9E4B3
          85058371C823A8E09A63EA74B67AF78ABC637F78BA45C456569071C81904F2B9
          EB92707BF158FAAF8F35AFECF934AB92F05DC52959258D806E382AC3A6739E9D
          8557D16EAEFC0FE279927B7B89612A46C562AA41FBAF9E84E33D47527D2A9EA3
          A56BBAFBDCEBE34A9BC8B990BA8033C1C72AA4EE231DC639FAD17B0AC51B3F14
          EAF657EB7515FCE651FF003D24254FD41E2A3D4358BAD4B52B9BCBB1203720B8
          8C485369FBA3047F748E9ED56B4EF0A6ADAA8B2860D2A580CD21F32E64C85DBC
          65883D3039F7CE0722BB9D27E1D0B1F13EFBB2971A4C36EC0194FF00AC66E0E5
          7B6304E7B678A425138CD32E2F2E7C29AE2C923BDAC6D098C03C0977F07D86D0
          473C1257BD54D2C1D6756B382EEE0A43830C1C92030070A06785CE0647AD7709
          F0EEEEDB56D46DADA78174CBE82441BCF3BC90CA08F6207E02947C278CE9702B
          EA4EB7C993238505091C803B8C631924E7AD3D476B1C1EA10DDE87A8988C53D8
          4FE515746E4156186DBD8A11D3E95D4F857C530E9DE0AD6AC5A68E2B88C33DB8
          66059CB83C7FB4C304FE2B57ACFC03677D2EDD5FC442EEFCC676245206080772
          09C9C66B1C683E0B86E62B79BC4B34AC705D962CA93D396ED46A16B1C5EE3BD7
          68632173C93D0D77DE16D534EF0F58DC5CCDAE8BD2E8CE9A5C485834A76FCCC5
          8751B47A7D4D74977E16F03EE3653324135BC425902CC43B21E858F7E9C62B98
          B0D4FC0767A92C71E9F772DB2A95371312E18F04165EBD01FAD1663D0A1E1DD7
          34D5F14C9AD6BC642C58CA8634CA8949EA47A00DC7A62BDC6CEEA1BFB386EE06
          DD1CD1AC88D8FE16E95E571EBDE01B6D4502688BB198E66640CABFF013F4AEAF
          44F1FE97ACEB50E97690CE82443B19D40195192B8FA53B204D1D91E86BCC3E2A
          5CA4F73A5E98B9F35C9239E32E42AFE3906BD389E2BC9261FF00090FC5D1193B
          A1B260DC7FD32E49FF00BEE9147A95A402D6CA183242C51AA0C7B002BC9358F1
          76933789277BDD12DAEA13295F34B624DABF28E7A7403F3AF4EF11DFAE9BE1CB
          FBA240D90B0527FBC4607EB5E4DE02F0D597892F2F8DEAB7936C142A21DB82C0
          E39EF8028259D9E89F10BC36D1FD94674F8A362B1A3A6D423EA2BAEB3D574FBD
          DA6D6F2DE6C9C0092027F9D70EDF08F4CDB188F51BC47FE26E0EE3FD2B267F85
          3AB5A956D3F5184956241F991FF31C503D4F5992558E36727E551935E59F0D2D
          5AF3C4BAA6A92A7DD0C013D99DB711F95754EF7BE1FF00004C6FE7F3AF2281D4
          3E7249276AF3DFA8ACDF857148346BD9DC604B73F2FAFCAA01FD41A05ADCF403
          D2B1B58F0EE99AEA2ADFDB091971B5C70C06738DDE95B38A6B0C8F4A0B7A9CC8
          F0C785B4447BA7D3AC624030D24C81B1F8B13CD63DC7C4BF0DD80F2EDA2B8946
          EDA3C9842A923DF23F95735E33BDD43C47E2C8F45B60445E6186289861770CEE
          63F867F4AEAB4AF867A1DA5AA0BE8DEF6E02FCF2C8ECAA7E8A0F02925733EBA1
          3787FE22E91AE5DB5A90F693972B1ACA40120ED823BFB5759710C575049138DD
          1C885580EE2BCB7C67E02B5D334E9352D2FCC444C19200D9D8A7BA93D0035D1F
          C38D724D57416B59DE47B8B2711BBBF25948C83F9E57F0A6357D8C0F00DC1D03
          C577FA14F85499CECC9E9228E38F753FA57AA738AF32F893A6CF617B67E24B10
          DE742EA5C83DD7EE9FC7A1AEFF0049D4A0D5F4BB7BEB570D0CCB9047A8383FA8
          2281ADCE6BC6FA06A7AC0827D3AEC4662465789E531AB67DC7D7F9573CDF0D6D
          E3D18452EAB0A6A2CFB9D9CFC80607CBB73C723AD747F126465F09B246C177CE
          8AC4F231D4E7F2AF1FD36F74C8AF259758B59EF211196108976967E0658FD375
          2B833D0EDBC1F1A2DBCBE28F10C57165116F2E03361491938CF71D4E2A2D7341
          F06EA7733DDDB6B10D988937CE96C0307073D07AF1D0573FE289AD26D0B489F4
          FD32E2C2D95E4558A51C13C3647AF5C7E1ED54F58BFF00B7E8E5ADFC39069F1B
          32B7DA628080D91FDE3C6339C2FB556A49BB6BA4780679E3D3ADAFEE67B9BC95
          52372A7EF75C0E07A1C1208AD4BFF0BF863C17241ACDC2DEDC84942C3013BB2C
          01604E7A8C01D7BFB9AE77E1FDF6AAFAD416B636568F6E1C9959E250EAA4124E
          FF00BC4FF3E878AECBE2BC6CFE1885D47DDB9009F4F94FF85086896CFE22E81A
          84AB15D4525BA302F1B4F18D840CFCD5043E38BCD775092CF48D03ED90443F79
          23CC1475C0C6477AE67C597B637FE17F0D4366F1CD7CB0A2941F33AE514107D4
          EE1FA1AE6B4BB310EA33A6A5A94FA4A4795670ACC770232854107FFD5484D9EF
          17770D6BA2CD772420C90C0D2795F7C640C819C735E6A3C73AFC9A5CDAAC26CB
          EC50DC88846701DBE5E8A3D31EBDB3E95DCE8B3D95FF0085BC8D32F9AF23485A
          0129E58B6DEF9FA8FD2BCFBC1BE08B6D7C5D5D5FB5CC5145308FCA5C297207CC
          5987A1E3F0A76190E9FE36D5B54D78B5D6BBFD976922127116F44C7451EE71F7
          8FBD5183C5DAD3E91AE5BB5D4B3C0CA1BCF3C18CB49C9FA119AE8754F87CB3F8
          D60B382DA48B467803B491FF0006011B727DC03F8D73BAB783F5DD1AE6E2CED2
          1B9B8B3B8DB99614389403F2EE007073C91EB45BB06C4FE10B8D167D46DCEB5A
          8EA7F6D793CA8D119962049C01B94E7F90AB7078A350F07D96A9E1DBB8E49648
          DCADABC8C5B0A7392C7B820861EBDEA3F0CC3E2AD153FD0BC370CB217044B708
          55F19FBA1B76001D338F7F4AEBBC61E08B8F13BD9DE5BB436D75B152E4392463
          83907BE391EF459F50BDCF2DB559F4FB8B0B8937DA437C876CBB7A213B4B285F
          C3FC2A58B4FB8B5D0AE4CBA6A5DD8CA508D422CFC9838CA3763D720D7A86BFF0
          FA2D4AC74CB6B1B8FB3FD862F2412BBB2BEBF5CE7F3ACC3F0B6F90359C1AFCE9
          A7C8E1E4876900B7F13601C6720726803CFBC49AB5BEADA8C7736F0B4412DD21
          6566DC7E518C9381E82BA6D035AD02CFE1BDFE9B2DC2FF00684EB2FEED90E5A4
          23E5C6070071FAD75B0FC2AD1A39ADA49249E4587978C9E253EA7DBDA8BEF85D
          A2DE5EB4E92DC411B7DF862202F4C7071903E94ADE62B33C580DE42819DC7E50
          06493E82BA1F0A437563E33D2CCD1C90C893A8642A77F2083FA1AF66B4F08687
          A7DDC5776DA6C493C246C6E4E31C6EE4FDEC77AD46D3ED1AEC5DBC119B855C79
          A546E0282AC88359D4D349D2AE2F1C83E5A9DABEADDAB86F85DA63BC97BAD4AE
          AC65261561D490D973F9E3F5AAFF0013F5A967BAB6D0ADBE763B5DD5464990E4
          2AFF009F5AEF3C39A3A685A15A69E9826241E637F798F2C68E817D43C49A37F6
          F68935879C616720AB81DC1C8CFB554F0A785E2F0DD83C4A77CF34864924C7E4
          BF80FEB5D1919A05055840314BD79A5A42463AD0163CF3E29EA620D2ADAC1012
          F3BF9AC41E36A8FF00EBFE95D0F826C9B4FF000969D6EF8DFE5F984631CB12DF
          8F5AF3EF13CEFE27F1E4367095682291214CF5600FEF063B8CE79F6AF608D022
          AA8002A8C003B60628E825B925211918A5A42463AD033CA75671E1CF89F16A17
          431693162F215C801D48CE3D54EDCFA835D85E78EBC39670890EA70CB91F2AC3
          963F90E9F8D54F1CF872E35CB5B77B54592688B2EC66001071CE7F0AE674AF85
          534CE64D66E8C630098A020927BE5BB7E03F1A094ECCA9E22F88F36A96F358E9
          B6AD1DBCE7CB32B9CB9CF50147193C8EF8CF6ABBF0D344D5ECB559EF6E2D9EDE
          D64876B798BB4BB12082077C60F5F5AEEB4EF0AE8DA6146B5B085645181211B9
          FAFAD6CED03F2C50B40D6E55D42C62D46C2E2CEE0168A6428D8F718C8AF34F0C
          6A737847C493F87F53982594AD98E473808E49C11ECD9FCEBD58E7D6B88F1EF8
          4DB5BB55BDB38C7DBA05E98E645EC33EA0D00CC1F17F87BC557FAB5D792AF736
          3236F8D04C7E40074032067A8AC9B4F01F89B4AD5526B6B689A40BBD1D590A29
          EE08618079EC3F1AEC3C0BE2FF00ED68574DD424CDF463E466EB2007BFAB0033
          C75AEE783D29A25ABEC79B3F83BC49E20D1CDA6BBA8408C2E3CE8CC63715E082
          33E9C8C5769AC6890EAFA2CBA6B7C88CA046C467611D0FE95AC0018F618A5C51
          71D8F2BB4F84D7115C46D26AA11411BDA052AC463B1CD7A0EADA3DA6B3A6BD8D
          EAB491363A1E463BE7D78FD6B4F14878EF45C123811A37837C19776F717726DB
          A1F342F2969186063700071C54D2DB782B5FB5BCD6BC88AE16124CD27CCACAD8
          CF42473591E38D126BDF107DAACAF2DE79C227FA0C9CE4FB03C1070323BD705F
          68961B6D52CE0B368259995A611C8DB63552415D9939F998727E9DA8BC8763D1
          74FF00881E1DD260486CF49BAB7D38B90258E20101EBCF3C9C56C6B9E38D2B43
          82D8DAC7F6D9AE47991C56E704A9CFCC71EA7B75AC36D574197E183471188225
          BAC7E41701C4DC7F08EF9E775713A0DC4DA16B5A6EAF77137D8DDD991CC5C3A9
          18723DD7AE7EB4ACC49D8F405F89422BDBAB3D4B4B92C6E2281E48964973BD80
          DC14F1D4E300D5F87C6914DE0C9B5C687C874768843B8302F9C2807E9835CDF8
          97C6B69AB4F269BA3E9D16A2D3C2CAD71E510E38382808CF15C2D89D4B535B6D
          02DB7BA3DC6E54E8AAE4632DE80601FC3DE804EFB9E99A6FC4137DE11D4B5092
          28E2D46D546D42786240C30CF5E739ADFF00056BB27883C3B15DDC95FB48768E
          6C018660786F6C8C57916BDE12D57C38E8937EF21940559620769E7F31F8F6AE
          8FE1E6B37DA3B7F65FF644D3C53DC73244A418DF001C93C6DC018A61747AFE71
          DA8009A553950718C8E94B8A4506293B6053A93028189B700E6B23C47AC45A16
          8D3DE48C15C29110FEF391C55EBEBEB6D36D64BABB95638D07249C67D85793CA
          B7FF0012BC4CD1237D9B4DB55DAD8390A84FFE867F4A0342FF00803419F55D41
          BC4FA98766DEC61DFF00C6E7AB8F4038C7E35EA416ABDA5BC76B6F1DBC31848A
          250A8A3B01D07E156A814505145140C4E82B3F59BF1A668D79784FFAA8D881EF
          D07EB5A24D7947C53F1190FF00D910BAF9718F36720F5E3A7E1C1A018CF861A6
          B5EEAD73AC4A49FB39689723EFBB0CB1FC3FAD7AC818AC2F09690346F0EDADB3
          2E252BBE5E73973CFF00F5BF0ADFA05142555BD5B96B2996CD912E4A111338CA
          AB6382455AA43D2828E7F43D4AE048BA5EAD2DA0D5150B2A5BB121A2E007F6EB
          FA8F5ADFC7D2B8CF16BB787F3AFD8C5199DE445B8790E4320046C03B6EE39F6C
          D747A3EAD6FACE956FA85B92239941C31C953DD4FBD04234050453B348682AC2
          77E8690AE47E14FA4340AC79C78B7C0E58C9AC68CCD0DDA132C91C7C1739CE57
          D083923D6B4BC21E348B5948ECAF9922D4557BF025C6391EFCF22BB32323DBD3
          D6B84F16F8196FCFF686931AC57CA77145F943FBFB1E282763BC073D314A2BCE
          7C35E3C36F2FF65F8949B7BA43B5677180DECD8E95E8514B1CD1AC9132BA38C8
          23906829324EF4871E94A28340CE43C51E05B2F12DC25C99A4B69C70EE801DC3
          A73F4A7E87E06D2B468A65F28DCC93A84792600FCA3B01FC39CE7F0AEAB1818E
          B4B8E69DC938B4F869E1D4BD1746DA4628FBF6193E56FA8AE92EB47B0BEB65B7
          BAB2825853EE23460803D876ABE573F8D380345C2C64E9FE1FD2F4B7792CACA1
          85DCE4955E738C1EB56A0B1B4B5C182DA38C818055003F9D5BEBE946DCD171D8
          8CA2B2E0AE40ED8A72C61470303D00C0CD3C0C52D21D9094B49D68EDC50018E2
          AA5EDF5BE9D672DDDCC8238614DCCC7B0A8F54D5ECF47B36B9BE9D638C74C1E5
          8FA01DEBCA750D4356F88DAB2D9E9D13C3611724B0F9132792DEA71D05026EC1
          ACEA57FF0010B5F834ED2E278ED222412E3E551DDDC7AFA0FF00135E9FA0E856
          9E1ED352C6CE33B472F2372F237F798F7269BA068169E1ED392D2D972C466594
          8F9A46F526B63D281217A5145141414514139140CCAD7B588B43D226BE970C10
          61549C6E6EC2BCA3C1BA20F14F88E6BCD403CD0C67CC9370E1893951F5CE4D5B
          F1D6B5278875E8748D3B7C888FE50DBD1A427049FA57A3F86F438741D1E0B38C
          2F980032BA8C191FB9A08DDD8D80318E318F4A7527A52D22C5A422968C500432
          C31CF1949635753D9C64647B57975BDDDC7C3FF13DDC5749249A55E307474E04
          6371C1E4760707E99AF5622B1FC41A241AEE9725A4C143F58998642B763F4A09
          68D28678E789258DC346E372B03D454D5E61E0ED6E6F0EEA6DE19D653C92F266
          DDC9CFCCC7014FA03D47A723D2BD3430F5A609DC5A5A28A062114847069D4501
          6398F137842CFC47065879376A3E4980F4ECDEB5C0C57FE24F87F782DE6845CE
          9FB8E2324ED607A1563C29E9D6BD90F4AAD756705E42D0DCC093444E4A48BB81
          FC0D04D8C3D07C6BA46BA912A4E20BA719F225383F87AD7461B3D0E6B87D63E1
          9E93781A5B02D673E72028DC99FA76AC571E35F0823CAD225FD8A3743F38EFF3
          7AAD02BB3D505048F5AF39D37E2BD948E1350B29A0278DD17CCA3F0EB5D5D8F8
          AB45D4638E48352B721C6406902B0F620D055CDBA5A606046EC839F7A0382D80
          C323B5003B14B4DDC319CD579EFAD6DD37CB73146BEACE0500593466B9BBEF1B
          E8360997BF8E53FDD83F787F4AE5B50F8A7E6B98743B179A4C100CC18927B7CA
          BCFEB40B98F4A7956342CEC1547524E05717E24F88363A5C422D38ADF5CB2E72
          AD94503B923AD7310681E2DF164CB36A8EF6F6CCC495B81B47E083B7B1AECFC3
          FE03D274068A5447B9B98D76ACD39C95E73F28EDFE79A049B390B1F05EBBE2AB
          E4D47C453C91407E6F2C9F9CFF00B207F08AF4DB1D3AD74DB55B6B3B748615E8
          A831F9D5C0A14000718C0C52E3A5055808A5A28A06145145001D8D715E39F167
          F61590B6B4913ED9329C9CF312E386FAD6AF8A3C4D6BE1BB1DEE0497127FAA87
          3CB1F7F6AF3FF09E8F3F8C3599B57D554CB648C465810B337603D40FEB409BD4
          DEF873E1E36F66DAD5DA37DAAE79883725533D7EAC73F862BD040C5323411A2A
          28C2A80A0638000A9290D201C52D25140C2968A4A062D348F4A7521A04626B7E
          1CB1D6AD6459ED6379F6111C8C3041EA324738E99AE57C3FE2C9B47BA5D075E5
          6468A4F262BB0E5D49ECAC4F3F8D7A2D73FE25F0DDAEBF60D1CB1E274F9A2917
          860476CFA504B563741FE74FAF24D0BC677FE1CD40693AF2CB35BA1F2D652A4B
          C647739FBC0FBF35EA367776F7B6F1DC5B4AB2C52A875753C30F5A6172D628A2
          8A0614514503138A4650CB823208C60D2E29714058C6D43C35A3EA8ACB77A7C2
          E48C160BB4FE62B9ABDF859A2DC10609EE6DFF00BC03EF07F3AEF71462826C79
          84DF0C7538B7FD8FC412803042B061B88F5C1EBD2AA9F86BE23D923FF6CC61E5
          C798A247C1F5CFF7BF2AF59C518A42B1E591FC31D65AD951F5D58F03FD5A6FDB
          9FCC7F2A920F844AC83ED7AB3120F58E1193F8935E9F8A314058E2ED7E18F87E
          DD41952E2E1C2905A494F35D35869563A6C4B1D9D9C302A8C2EC4038ABF8A314
          0F94680074FC29D8A4A5A6505145148028A299BD77150C370EA33934C438F4AC
          7D7BC4365E1FB3FB45D372C088917EF39F41E950F88BC55A7F87ADDCCF3235C1
          5CC76E1BE663FD0579CD9695ACF8F7531A85DC863B3C9476CF08BFDD41FD6813
          63748D36FF00C79E2596F6F8B2D9A365CA1E14672231FA73E95EBD6967058DBC
          76F6D12C5120C2AA8E95169BA65AE9363159D9C42382300281DFDCD5EA4090B4
          94514142D14514005145140C28A28A04262908A751401CEF88FC2B65E22B6225
          063B8006C994E08F63ED5E6F18D77C05AA3482169206C210C4F9520CE7E5F43C
          E2BDA48AAF736B15DC4D14F1AC91B0C15619FC69912463E87E2DD275E422DAE0
          2CD9F9A097E5707E87AFE15BF9E6BCB35BF8633ADC9B9D1AE1463958DD8A95E7
          B1A4D3FC79ABE8920B0D7AD5A7302E6697A4AA338CE3A37AE7AD1A873773D572
          28ACAD2B5ED375A04D8DD24A530594020AE7B1FC8D6B50CB4252D2514802968A
          280128A28A005A28A2800A28A280129693345300A334D6608A4B1C01C935C6EB
          9F10F4BD1EEFECD1A9BB94292ED1380A9EC5BD695C57EE764CEA9197760AA064
          927000AF37F13FC495B677B7D19A29988DA6620E14FB6783DFB563DC6ADE28F1
          C4E2DEC627B7B173918CA809D8B3F7FA0F7AEBFC2FE00B2D065FB5CE45D5EE3E
          5765F962F50BDFF134C96EFB1CCF86BC117DAD5E1D4FC43E624664DC217C6E9F
          BFCDFECF6C57A9C16F15BC4B1431AC71A8C2AA8C6054A063A740318A5EF48A48
          31452D25030E9475A5A2800A4A5A2800A28A2818514525002D145140094B4525
          002119AC9D5340D3F5753F69814C854A8940C38183D0FE35AF463DFF004A7726
          C8F2CD63E1BDE5BB9B8D16EE40E00E37947C73D08E3FFD75059F8EFC43E1F95A
          DB5FB269C29C2B15D8D8FAF43F8D7ACF151490C732ED923571E8CB914C977471
          FA7FC4DD0AE9545C99ED24EEB2464A8FC4574961AE697A96D3677F6D333F4092
          024E3DAB0753F87BA36A04C9144D6B26771F2FEE93E856B9A97E176A0B7A2E6D
          75182370C4AB6C60541CFD7FCFA74A9B07333D577519AF2E7D1FC79A5844B4BE
          9674CE3E594305FC1A88BC4BE36D33115E696F7009382F0FCDD7D53E5EF4598F
          99753D437668DD9AF3393E25EA3001F69D11E37E72B93B71F5C54727C54B8467
          09A6ABAECC861231DA700E0E3A8E4F2314B50E647A9645266BC9E3F8A3AA98C2
          FF0063A19B001C6E273F41DAAB5878DFC55F6FBA94DBBDDA306F2ED96DC8F2CF
          1B4E7AF18236F539CD349B1F323D87349B857965B6BBE3AB8423FB3673962439
          8768C718C6791C67FF00D740F0B78CF569239AFAF5214272D1BCCD8FA6D5FF00
          3ED4598B9BB1E857DAD69BA723B5D5E428CBC32EE05BF2AE3353F8A16D196874
          CB5796423F7723F0B9F751CE2A4B6F85D646F3ED37F7B35C1272D12FCAA4FD7A
          D759A6787B4BD2540B2B18E361FC7B72DF893CD160BB679D3E9FE35F18A8374D
          F64B37FE07CA2E3FDD1C9FC6B5B48F85B656B32CFA94E6ECAB67CA55C27E3DCD
          7A16314EE298944AD6F6715B02224080E3800700559C514527A949242D149450
          3168A292818B45145001483AD2D1401FFFD9}
        mmHeight = 24606
        mmLeft = 81492
        mmTop = 176742
        mmWidth = 26458
        BandType = 4
      end
      object ppLabel106: TppLabel
        UserName = 'Label2'
        Caption = 'CARTA DE RECOJO DE CHEQUE DE GERENCIA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4498
        mmLeft = 13758
        mmTop = 34396
        mmWidth = 77788
        BandType = 4
      end
      object ppLabel107: TppLabel
        UserName = 'Label3'
        Caption = 'Estimado Cliente:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4614
        mmLeft = 13758
        mmTop = 52388
        mmWidth = 32766
        BandType = 4
      end
      object ppLabel108: TppLabel
        UserName = 'Label4'
        Caption = 'Sr(a)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4614
        mmLeft = 13758
        mmTop = 59796
        mmWidth = 8678
        BandType = 4
      end
      object ppLabel109: TppLabel
        UserName = 'Label5'
        Caption = 'DNI'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4615
        mmLeft = 13758
        mmTop = 65881
        mmWidth = 6646
        BandType = 4
      end
      object ppLabel110: TppLabel
        UserName = 'Label6'
        Caption = 'Fecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4615
        mmLeft = 13758
        mmTop = 71967
        mmWidth = 12023
        BandType = 4
      end
      object pplpvsnombre: TppLabel
        UserName = 'lpvsnombre'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 35719
        mmTop = 59796
        mmWidth = 87038
        BandType = 4
      end
      object ppldni: TppLabel
        UserName = 'lpvsnombre1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4615
        mmLeft = 35719
        mmTop = 65881
        mmWidth = 21960
        BandType = 4
      end
      object pplfecha: TppLabel
        UserName = 'lfecha'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4615
        mmLeft = 35719
        mmTop = 71967
        mmWidth = 21971
        BandType = 4
      end
      object ppLabel111: TppLabel
        UserName = 'Label7'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4614
        mmLeft = 30692
        mmTop = 59796
        mmWidth = 1058
        BandType = 4
      end
      object ppLabel112: TppLabel
        UserName = 'Label8'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4615
        mmLeft = 30692
        mmTop = 65881
        mmWidth = 1058
        BandType = 4
      end
      object ppLabel113: TppLabel
        UserName = 'Label9'
        Caption = ':'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4615
        mmLeft = 30692
        mmTop = 71967
        mmWidth = 1058
        BandType = 4
      end
      object ppldes01: TppLabel
        UserName = 'ldes01'
        Caption = 
          'Usted podr'#225' cobrar su liquidaci'#243'n de Previsi'#243'n Social N'#186' 0700013' +
          '4001 por S/. 1,500.00 a trav'#233's de'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4191
        mmLeft = 13758
        mmTop = 85461
        mmWidth = 152136
        BandType = 4
      end
      object ppLabel114: TppLabel
        UserName = 'Label101'
        Caption = 
          'un  Cheque  de  Gerencia para  Personas Naturales  emitidos  a  ' +
          ' su  nombre utilizando la  red  de'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4191
        mmLeft = 13758
        mmTop = 89959
        mmWidth = 152136
        BandType = 4
      end
      object ppLabel115: TppLabel
        UserName = 'Label12'
        Caption = 'oficinas del Banco de Cr'#233'dito BCP a nivel nacional.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 13758
        mmTop = 94456
        mmWidth = 152136
        BandType = 4
      end
      object ppLabel116: TppLabel
        UserName = 'Label13'
        Caption = 
          'Cuando   realicemos  un  desembolso  a  su  nombre a trav'#233's  de ' +
          'un cheque  de  gerencia,   Usted'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 13758
        mmTop = 102394
        mmWidth = 152136
        BandType = 4
      end
      object ppLabel117: TppLabel
        UserName = 'Label14'
        Caption = 'deber'#225' realizar los siguientes pasos:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 13758
        mmTop = 106892
        mmWidth = 152136
        BandType = 4
      end
      object ppLabel118: TppLabel
        UserName = 'Label11'
        Caption = '1. '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 13758
        mmTop = 113506
        mmWidth = 2910
        BandType = 4
      end
      object ppLabel119: TppLabel
        UserName = 'Label16'
        Caption = 
          'que  viene  a cobrar   un   Cheque   de   Gerencia  para  person' +
          'a  Natural e indicar la moneda en'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 17992
        mmTop = 117740
        mmWidth = 148166
        BandType = 4
      end
      object ppLabel120: TppLabel
        UserName = 'Label17'
        Caption = 'en soles.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 17992
        mmTop = 121973
        mmWidth = 148166
        BandType = 4
      end
      object ppLabel121: TppLabel
        UserName = 'Label19'
        Caption = 'Presentar el original de su documento de identidad (DNI o CE)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 17992
        mmTop = 126471
        mmWidth = 148167
        BandType = 4
      end
      object ppLabel122: TppLabel
        UserName = 'Label20'
        Caption = 
          'Estos  2  pasos  son  indispensables  para que el  personal  del' +
          '  Banco pueda  emitir y  entregar el'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 13758
        mmTop = 135202
        mmWidth = 152136
        BandType = 4
      end
      object ppLabel123: TppLabel
        UserName = 'Label201'
        Caption = 
          'cheque, de esta manera usted podr'#225' cobrarlo de manera r'#225'pida y e' +
          'ficiente.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 13758
        mmTop = 139965
        mmWidth = 152136
        BandType = 4
      end
      object ppLabel124: TppLabel
        UserName = 'Label22'
        Caption = 
          'Esperamos  haberle  brindado  el mejor servicio,  si tuviera alg' +
          'una consulta puede comunicarse con '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 13758
        mmTop = 148432
        mmWidth = 152136
        BandType = 4
      end
      object ppLabel125: TppLabel
        UserName = 'Label23'
        Caption = 'Cordialmente,'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 13758
        mmTop = 164042
        mmWidth = 24606
        BandType = 4
      end
      object ppLabel126: TppLabel
        UserName = 'Label24'
        Caption = 
          'Importante: Valido para ser cobrado al d'#237'a siguiente de efectuad' +
          'a la Liquidaci'#243'n (d'#237'a h'#225'bil)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 13758
        mmTop = 216959
        mmWidth = 140505
        BandType = 4
      end
      object ppbcDNI: TppBarCode
        UserName = 'bcDNI'
        BarCodeType = bcCode39
        BarColor = clWindowText
        Data = '29263217'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 19050
        mmLeft = 124619
        mmTop = 12435
        mmWidth = 41275
        BandType = 4
        mmBarWidth = 254
        mmWideBarRatio = 76200
      end
      object ppImage4: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Picture.Data = {
          0A544A504547496D61676543290000FFD8FFE1001845786966000049492A0008
          0000000000000000000000FFEC00114475636B7900010004000000640000FFE1
          036F687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F003C
          3F787061636B657420626567696E3D22EFBBBF222069643D2257354D304D7043
          656869487A7265537A4E54637A6B633964223F3E203C783A786D706D65746120
          786D6C6E733A783D2261646F62653A6E733A6D6574612F2220783A786D70746B
          3D2241646F626520584D5020436F726520352E332D633031312036362E313435
          3636312C20323031322F30322F30362D31343A35363A32372020202020202020
          223E203C7264663A52444620786D6C6E733A7264663D22687474703A2F2F7777
          772E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E
          7323223E203C7264663A4465736372697074696F6E207264663A61626F75743D
          222220786D6C6E733A786D704D4D3D22687474703A2F2F6E732E61646F62652E
          636F6D2F7861702F312E302F6D6D2F2220786D6C6E733A73745265663D226874
          74703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F73547970652F
          5265736F75726365526566232220786D6C6E733A786D703D22687474703A2F2F
          6E732E61646F62652E636F6D2F7861702F312E302F2220786D704D4D3A4F7269
          67696E616C446F63756D656E7449443D22786D702E6469643A38384242323139
          413845363945333131393530364335414333303344354330382220786D704D4D
          3A446F63756D656E7449443D22786D702E6469643A3442453033434441363939
          3831314533383235463846314639373642313741362220786D704D4D3A496E73
          74616E636549443D22786D702E6969643A344245303343443936393938313145
          33383235463846314639373642313741362220786D703A43726561746F72546F
          6F6C3D2241646F62652050686F746F73686F7020435336202857696E646F7773
          29223E203C786D704D4D3A4465726976656446726F6D2073745265663A696E73
          74616E636549443D22786D702E6969643A384642423231394138453639453331
          3139353036433541433330334435433038222073745265663A646F63756D656E
          7449443D22786D702E6469643A38384242323139413845363945333131393530
          36433541433330334435433038222F3E203C2F7264663A446573637269707469
          6F6E3E203C2F7264663A5244463E203C2F783A786D706D6574613E203C3F7870
          61636B657420656E643D2272223F3EFFEE000E41646F62650064C000000001FF
          DB00840001010101010101010101010101010101010101010101010101010101
          0101010101010101010101010101010202020202020202020202030303030303
          0303030301010101010101020101020202010202030303030303030303030303
          0303030303030303030303030303030303030303030303030303030303030303
          0303030303FFC00011080040010403011100021101031101FFC4009C00000102
          070101000000000000000000000007080103040506090A0B0201010101010000
          0000000000000000000000010203100000060200040207030808030901000002
          03040506070108001112091314215394D415161731180A516191222393193941
          D192242556B778A133957181D336274768C81A8A110100030002000602030000
          0000000000000111213141516171810212B1D1F0A132FFDA000C030100021103
          11003F00D6A7E21FEE59B05B49BCB7D6B9993691C5B5B75BAC97FA8E255233BB
          2D6E8DBFC9600B4D8FCAAC49B22467109659227893A35996E1AC01806B6AC924
          A7000625672AC7CA76BA573BD938DFE830CE5F9CC167FE3E8E203C537973F14C
          FC9FF305CFF473E7C047C51FAE3BF4E7FF001389A1CE6A76E3EC5E91DB91DBAF
          5BACC9157F30625E894AD4685C570A2D336A4AA4B52A6293F8C96AD3B74BE26E
          982BA54A25411079F234B116704A3408B891EC67AC774A5D8FD70A1360D1340E
          3C96F0A6EB4B64A8F9AA32B06C3F5061ACF2A1B30966494DE732D237411193BC
          3060DE8EAC631CF971D50BA70070070070070070070070070070070070070070
          070070070070073E5F6F006338CFD9C01C01C01C019CE31F6F010E78FCB8FD38
          E0239CE31F6F00701E379DD8FF0099E7703C7FF30F617FD5092FF5F1CE79564C
          D5D9E7B9BBD51A1D8D6AD30B9555526C7C32C4AE38696B2E5CBE28680B3CA933
          65567BA956B3B47D421330A8A5A9990E4C721CF9A00B24733787D64380DA2EDC
          D3FB7F6E6ADA1740F5C2452D7179D22D3BB9A4D18871CB0E6C6D76B0F5F6BF95
          CEA7B2E94CCDE4A6486373E4BA42664C39C57A240158A42495D22180AE131738
          1B3C7BB4D771C945FD26D5F66D44B6CCBB218CC9E49288C383735B332B2C5D71
          AB486A942BB15EDD9B6B60C59FD537A925B5CC0EF940E67A730A4A69C60041E1
          5F2B4B34DBCE83B97596CC91D377E56D2BA9ECE8A8C803E43E62D8636B9A6256
          1385081C1319FB448EACEE89861391AE4661C89610209849A60058CE64DF6AF5
          F3ED63FCB47403FD9BEB7FFA4713E3AA15CD91DC8D57D4065677FD9DBF6AEA49
          048CF3D3470B9F4A9BD9DD64A6A31A62D7E238C19198FD202DB32B89CAB1A34C
          781284D088DC8022C6780E6E7B8B7766D848C774DED5F59E98ECE449EB4E76BC
          DA2332C360CC356D8D12B18A95ECD3FD6B3B0229DAD8FC81E111E18EA029B8F2
          9BD7A339B14807D41028EAE52E6E23A1D19EC86F0EA169FE1903B37B1B52D28B
          24850D4C7D9E75306D6C913E2228FF002C738B5468261EFEBDAD3A9FD99CA8A4
          C24E519E818F19E28CC59368F5BE4B492FD948EDED53BFEBFB4B4B9BF3ADCACF
          3C8E39D6ED6D2CBCC2F2B1CA5C8DC0E666F0B38B190AB01A680C4E6632033011
          6338E013A6FDFDD27776DA7DE1A369E8E776BBFE4B248852CE0D161C7DCD2597
          228764E2E5C82247205AA0B732E307938257A80E7CB235261449A600D3C900C2
          CE4771DD0B575D116DA0DBCD7F74AD1559CD34BA39B345971A76605F6C3EA546
          E2D75E372D6D5CA42E12A52D2B8B5B9484E0C38A41D4A8CC05380668428AD8EE
          65DBDE8D992CAEEDBDD0D6C824EDB1C4E697A883DDB90E2E431E744E6E0950DD
          26694EE8A164656A737D0616BC29C60F4F3FB33C2E02CB2BDABD6783D3683626
          5B7F53EC5423AFC33E15732EB0E2C1AC9D7E34B3E1CD196B9A96E638F38FC457
          872493E0A81F5998C871CF38CF2045275DCDFB7BD66E155B5CF37275EA28AEEC
          8DB24D2B0CBC5971E4E92530B9264F047A665AFC2B13735441F4C4C6811BA2E3
          52A152324C096688458B1860BCDD3DC5744F5CACA69A76F5DB2A22ACB39E7084
          C221732B0D81A9E9B53B9929D5362C93146AAC950E40E8955166A550EC344428
          273D650840C67385C0576E3D9BD74D798AB5CE6F6BDAA3A7E22F981E58243645
          83168735C8BA1312AC408E297C74440901D84AA0B33A11F8C3F0CCC67972CE39
          8615AF5BC1A7FB60ADDDB75AF65A97BADE581265C9EE3F5F5811F90491A1AF0A
          4A47F17728DA559F1D46CE258A0B282AC69829C468F01C0F22CE31C0393757A6
          763253287A756C674EB5CDB19519EE8B933792ADE1ED7A76B666A4C6AB34A01E
          E6ECE4A8A4C9480E7269E79812CBC6442C632090C4F67B5B27B66C9293836C25
          2133B961C27404BAA58A5AD0490D99171B12B290BD824304687E572765133AD3
          824ABC294A5E539A2C00CE916718E0257DE9759BEB07DDEBEF1345FD7DF13C2F
          A21F56A05F56FC6F85FC77C0FA6FF1FF009BFCC7C17FBEF4793EBF2BFB6FF97F
          ADC065D695CB50D1D191CD6EBB52B7A7E185282519B2CB46731880468B58A39F
          974837D9639B4B60551DD39E8064DEA172CF2C7A380ABAD2D6ABEE788A29F53B
          6440AD782399AA486D9A56B308F4EA26BCF446E49584229145DC5D1A151C90EC
          640680B3B392C58E42C633C02713FDB9D53AA27ED754DA5B35AF95B5A0F7F0DC
          B356F3EB9ABA87CF1DB0F4779766136C4243236E7F5B876521C969725A717981
          E3917D59F47011BF5DA54F9584FD8E97BEEB5A4AD1607B81B71F614D98D92C36
          180295F2588BC2B639642D64A230501C6750B5F942DE050B529A131D932A2B06
          67C3098178B8B6575D35DCB6036FFBF295A34A961EAD34587705A507AD012552
          8029B2B93B00A66FACD8783908561393829FAF2560C07572C0B1CDC721A36F07
          710AEF519669C165CD693588F66B66AB3AB9ED5CCECC636029828F98C7A6CE72
          2BB580D03984A5EC51C72626D4D95E6FF84604E2009A703232F3C27390F322D7
          DD173A823F5A508BA2A798D611513C065163C5AC587C86071B1479116E2FC17E
          97B4BC2C8F34098DBCE09EB3CC282FCB102C0CCE90E719E028A9CD8CD7DD8940
          F0EDAFF7AD3B79354755A640FEE5505990BB29031AE5648D42346F0AE1CF4F49
          DB152A20191940384011810E738C6718CF017B925D14F43A3C8E5D2EB5EB58B4
          4DC6505C1DBA51239D461963ABE686BDA88C950F44F4E4E899B55CA4C91A435B
          F0DE59B95795A5893E0BF14390E0304AB9F64505AEA7724BEAFAACE789186C5B
          71D0EB19B5B186B788C12048666F6264834A148A44E6D25BC556CC461A5DDC94
          A84E61CA51983505966E079C85EA9ED95D73D882DF0EA06FDA56F12A306A6224
          86D3F69C1ECC0478F59E2F9325EC70B7D7AC3518AF040F2584FF000F23C005CB
          9F2CF2723493F7E5DA7F9E3E0FF53D3FC3FF00FD0E7DC73CBFC990CE5F75AFA0
          9F39FD31F17E0FD5E3FCC3FDE3E33CFE33D5FB3F31D3FA9C66FF002AE49ABB8A
          54F38FC5053E8C5D28232F10D71EE19B2C63630CC4CC971591DA0DEF567B951F
          197E2C61196B50492EA471F4262234224EBBCC796342228D163333EDA34E33EB
          CF73D56E2C86E19ACFAEB6DDD9496DAF29D5FF000B648CF71305B089F8C65322
          6D881064878605ECAE85E5A53322524A4E8C90010129C050024E33737E63A4BE
          F756258276AB6D54B5CDDDBA3767DBDBF1A574DED486BD7A270D52495D37DAFE
          B9944CE997C5CC0E2A50BC452A5BC642E8689A4C11C991BFF50841F1D28041DC
          F1EE9DB55B71EC0DDEF9D8AB506B277B5664E55FFDF7B66A1A289AA785236F3E
          235CD67414A60316579CE7CCAC8E4364964BEAD6F4261B94898E71C6405F3208
          C932E7EB4AB4EF33B39CDFB54F66AB0A62B5649E78595BE353E66AFC70DD2527
          D61565BD5CE2B3811EFCACC35CD744EBD2654E44332238D114D49D5984A60964
          F2070F97108F4B3ED65FCB4BB7F7FB38D6FF00F48A29C6C71F554D055D7774FC
          48FBBB03DEC74779657FAF38B85A6B9A754C99E638DD268D5253D8ED57078337
          9ADAE8DAF6D51B21BA42AE5AB9334284A6B839E4F54663251EB303C73F2D5255
          BD3A0BAD7A19F883FB66567ACA4AB8B571675CDA9168AEAA8E91BBC952D71207
          2D8DC4517A38FB83F383B3EA6649395152D7929D6293CC214987E0B1052F9624
          A4C57CA2836FD7A9AB5EDDF707EE13B15B63DB6769BB9FCD49B25C18982B2AB1
          C24C38B514D2AE5B35606B699CB74690AA7DCFCBD1589A4648C1423F089214DE
          B44612729C90A533B9B80BB6B9D2DB49AEB56F7BF89675276E3547B7E5C5A2D7
          85935B41B63A36FE04B12B3236E90D4B01650CBDE9A1B1B5548871C91BDA1F0C
          A18DC96B6A44BE74C586A009F8B1DF852161EC25DAB20D61E9EBDF744B7E7D3D
          7F9BD1C9EF42F562B442FE14D5EC353D7516952B707D942434A39C1C82ED61BE
          B8292DA129EDC80224E250ABCE79E30B25F18EE4379FC397DA72AEDF262B1F63
          F65ACEB09AE9CD5CB59914D775AC2A5638B369D6990DB1F9BCAE712774392AA1
          3333A08F32B3261E1B7095C1767908C5840111403DF18B0BE3995A15DC9EF5DC
          3B4751BB116C46E5C49FECC993F595B4ECFB672DA31CC12B95962717C9455D59
          2F20E830E48E6E869B2142C4A0D5AEAA3CE80C5A8892D47920327881ABCD7E97
          CB55762AEEB74EBC2F7CC426A7DA9D3392C2A2B200E32BA29229ECE65D1F9AE0
          E2F00F0D02C7043016E0AA28BF08B0A94E316318C9A2EA91FE654F97623B476A
          0407F0E9555DC01A1A2666ED5AD8DD2D623D58ABA66FEB913EA1B3AC563829F5
          F2A87A970510F6F8A45E3D242F0DE6244699CB0A5BCAC9AA46030D2449F8C447
          9A24583DA7F5213FE1BE67EE306B6CE5CF6F14A18858ABED1709BC855A67142F
          97FB7D359AF15C416AE5116C445AA20BC034E781281DF2E290B37CDF96C891E5
          51F5B9E57B2BCB766F4E65DDB0BB2F6B1ED0E9DDABDC736C9E22D60BF5194A43
          EC496560E08602A6DDB3E978832BF587174EE331358DF1140D1266E666D4E615
          92E2851AACC4A993100536E2AA790D74EAF1FF004CFBD276C87EAD341EDAED78
          ED60DD550C5A4355492F73360215316699D9AD35DCED6C02C3C80F5CA9AA4105
          981ADEF4D872C5004A79A1C00B27AB1812AA611DA877A189027FA8509800A432
          487FCFBB9BA310CC4C616E8730CD622193ED4D5AD0A2450D90251056B04A1B12
          2B306897119C9A94FE430E3D19E353C0493BA16976B0D37DB6AEE9BD174EC128
          5B1B542B270B875DAD3A7630C705B32ACB0AB74E43C333E304E5A1127921A6BE
          650E52BDF985270DE922A3C2A846986789874156BC3B7169AC4BB7F5AF5A4729
          383B19D0EA3671358D5B0963CCE3BBD92DA8EC35CA52D17B916C9A9899B1D742
          198A229EC4FE6AEC2D3DC03911A664B1081C2434F8F6C1C5F682BFD2B465E834
          1BB916F3B568C6BADD36D496C32EA286D6F41336C3D78C4FE15533B52C68E4A1
          3C5665713F30AD5CDF1C8F3139399ADE8CE527012A1C1461D2EE3CCECD7E773F
          BE34FF00622EDB5E0FA391AEDF1389876B0DF6B15643AB9B3AAFB5E87BF2DBD5
          56DAF26F4CCDDA20F59B142D3FD54ABBE747125C1C5F18122A756277C202B278
          53E3207E86DFB50340B4753EAA55C23296A7360C57056B13B1ACBBBADA84C4EE
          19E6C74A2C98F249649AD6B1E7F356F90BD4E1CA7AE2FA7B875A8546A44E4A90
          A7480252964940540D06DDB4ED7146EB5F7EBA76AE7A769556F01DB5EDB2C314
          1CA256E13E5F13694CE5A98E096A1264AF2A97BA2A8CD2C62BF979911A95071E
          CED6853B78CCC89264594F1EFF00A1B54BDA939A515B9BB2DB4169E8187B8FD2
          37DC72B61314B610DB5C599B0FABF1AACA008E24EF45B051375485A1B26155CB
          E5197095A61C10E4EECA1D5E9C00EADEBC6044A30F30D7F64229DBE2DDA9FB53
          BD6ACD275423AB3F8C0D795BC86BA72A81244DEAB190BE365F2F778D2136ACA6
          4C091EAB1569A748CB54F1133D2236FF001C84EA0A4E34F94868A4D4D7A9050F
          73D35511DDFBD7CD2945A6330B4754607AED3ADE0956AE6A756951A48A5C578A
          9B722B52C22457A575207BAD227308055E992A972291E559E05F235EDE7AF4C7
          94DE4745EEBA1779B237496EC6EA3DC7A8BDB3B6AB542F1825F159C46CCB257D
          45425555CCEF50A70FE8A33B055B5D47C06F45A54A6311A891C549E3C156D2F0
          B1AE4AC2886D6024472918931DF62FDDA9B47EA99F47671B297AB430DE8BE29B
          81BB51FD418D4FD81A1FA17AC558B16E25AEA1C1657713716CCB337DB93BB39A
          DC1E9E260328D90284816C401525266F015956DC84AAABB268866D67514B595A
          B09B76EDBBBFBA0F71C7CD79D603D8A04E044CE6355ECF5C92091D92FEF16AAC
          455E4361D5B3439872E6F6E061DE586E24904A75279E12B2C18BDECCB74D636C
          697DD62ED5B5CE8F4C229BA5AC75B636335B6FBA3658CA3AAEF9B6E3F51D9D55
          5D3148B55F59CC65D059FB2CC7CB224A4A25C5B7C8468DC42A52E538C2A4132F
          FDC9FF00FACAFF00EAEF13F6BD7B3895EEB0A0F45DD0F7F55A434E4AAD36E4EC
          2284CA539A610A139E45AB2334A3C838192CC24D2860EB00C3E9E7CB38E333C8
          5BD277BFDEE4CD891C8E74A19DEF36E654B1A6BDC27ED6EA65E770DB98914771
          144C98BBF1C2207CA95BB96C18C9187C5383E442E79332BFC6CF5F0FB4FB8634
          FF00B6175CAB5DD7EB149A484C86B777D8F78DAF795EF8930E93B7ABAA45082E
          BF7C92BCCDD79C7BE3A16EAC24F59E51E60B272B165408591E79F12F28634F77
          FD86FDAF903D635EA5A05575736958570C69281A8A29F0B995991D83C5A4E6AC
          7AC0B2A16379AD75EB77809FA71828CF133CF3D58C05782BE79B296859342D03
          ADF275ACC755FAD2E5703B55A89131A342F08965E0FCC1249F09E9E4BC655BEE
          153A4692E5378B91652978C8439E9E58C3781EBA9DAC7F968E807FB37D6FFF00
          48E27C7546AA7B93FE1F449B6BB52DFBCFA95B472FD2BDA23BE1C6CCE4D176B7
          A5AD9267A69662632DF3561758ACBA172880CC0C8C17842E4626395A37720A2F
          232083C6B142B931737D86E711FC30F2763DAAD5ADC296F707B12DCBA2A4B36B
          8B86F6975AF03719A3FDCF33AEEC16D94B6258E3DBAD946BA4218088A3221642
          42B8D7F3CBC939521100BC948899F5DB0B9EDE7E1F6964AB6D26DBB1DBB375EC
          1D09B9ADA39DD6DBED3186F7C5D1796BCC95612E72A796E708D4B62CECD29E52
          F69C0E4E4D4B0B766F52EBCD493E544108316B6C2A543F648B56BAD3ADEAA0ED
          EEE0773EC25BDBDF1871679AD916323757DAEA0CF6A9A0D6804B2395B3ECD1DD
          E9CA5CE080C2923AB99AFA9C4B903737272C84C0420C8D101D976FAEDA2E1A39
          DBB1FB44155D24D8CB1ED1DD494168A481662A5377D5D29D40030B889F2B91E5
          665806E7E2721B863CCE71CBF678E5CAC64504FF00B3D7691FE169415D744C96
          E76FD836CB92C23266B96975D1D5EA540DAAA16D10D5EC0A1BCD99CC86E21584
          3708623707138E91F2E9FB73C48C81AEAA43F0ECECFEAA4D2CE836A97764BA68
          3D3AB7E5637A985590E81220DAA9D80C30297E171DB1954A543446E7D88E124B
          77CE0DAD88169A020919E8CD012023844570319AC7F0C038D6BA65BA7A869773
          D3B991B5D636BE4CDA66CAA8E3427419B284934BDFC86F766705A81F9ADC64E4
          4AC25187814A02D29A9BC4C16678990855514365D6FF0069176B53B3AC3FB55E
          2FD4AC8E31783D470F36EF156827146BFE974F23F37F1C35F066880F4A4BA858
          B09318F8C08C2702C1B91199C64194C5C50A594F685739276626FED318D814A9
          5C5144A2F1ACDED9ACF26243B31CBB1BAE2F17E9D026A518020F021C36631F19
          C998C67CC6739CF32F85650D7DCF3F0D34A0751E8AAAA4F77DF6A5DBCD1D88BD
          C1983601AAB7529DA2671B576DCFED88B1208B249DFC5226E5075D63B8212D46
          17B994E680CC92A53F40B1802BCF4642BFF0F0DF7626DAEA3EEAEC3F7359FDFD
          7650762D713E9E9B39A7DAC11A90A1AC2C96B9F4760952B0B1CD199BEA68B9C4
          A4509D607C1710295EACE70C12508D191956C48DF96DBEB8A8DA0AF60D054F32
          0C1870DD82D77BCB2EA362C487E200A1EE1885AC28CE11E5D1A7CA8A4DF2B791
          F37E20FCAF8DE2F846F4F40A8AFDC8D7C3B6C355AFED6B4F2D0C0CEBBAAF94D7
          209989971230C685246F310FC544C427167F8AE12E0CCE72479A23ABECEB0FDB
          C029B65400760D453FAB30EF968366D5BCAABFC3F811855E5AC5258C2E8EE1E0
          0DA23C90A9CA3CADF1F04E4D0E07D3D1D78E7CF80D5840BB726C76AA0AB49BE9
          7EC6D60D76421D56D6ED62D858A5FB4F482594D5F8A358A189E0D5A5CED24422
          C58B5875158AD51E50E0DE71299D5E1A1C5B54272D425F3288B58395E033EAF3
          47F611B36AE09BD5B25B479BA6CB83D2973552EB4A56F531709A39AA273D3E02
          FCD4C149C41E66F2992B34802F90B506BDBD3F3C3DB9CA047214DD4D889BC94D
          C581AC788583DB6E2512B0239587761DA4EDA75AAF54F0E73FD0B9A4A6BDA3EC
          6A09F5D917C624F01A52B9D81A764F775325FC756AB51F0C812E706513929370
          C022C9F0318990142D6FEDD8D9B2FAAFBF8CD5AB34AF52E89DCED87D7F986BA2
          39FC2A40EB612AA9F598749AA1DDD398CCDDF9A2C25524DA39AD6EF6F9955283
          8A931E9DDC97571C9C7A8E9139C1B41B2A99EE22C1674EE63AD7B7B4DB857D3F
          7148E69A9EDADD7D79B05254AB8A6D2D02FF00A596053B6853724511A723CA02
          ACB44813BBE493C02C10B4A09A3C714226F1DAD1D57EBF25602F6157AADB749B
          92C9DC2F3B26F3014CAA22E5B5AC68D247083D6D288E4E8884F4CE2B34818827
          8E92F785691A0051F85E6AE2F2A061994CB4D76AAE68FD5D6D593B2155D6DBDB
          424DE64ED4A5DBAFD4CCB1BAA143584F5BE30D538A2ADCA76C9B7662BADE80D8
          A4C6CB54E66E1E58D7A0704EDCADA8D46A9B8472C0CBEBFA3FB844CACAAFA5FB
          45B655430C02B279CC88AA874F2A29656A8EDE7D293F9441F59A7D6C58D69C8D
          4405016238FF009658D3B5815283C3956BD4812961182F7A81AE86EABD2D8A8D
          44C713C37EAADFD65E6421610C6F19C5DF7B58B74059F0D20747700331B0CF7E
          1FE360EC614F96F1B0593E27840062C776C09EC4D92BD9CD31B229E19B4147EC
          86E25EF5258D20AD8E9155EE110DCAB3DEAC2B3686B66AC4B3567512985BAA55
          0DC984EA81D9B1D5138B592E2872467034A30F99FE87EE86D43D52D2CDB8DBAA
          E19F1AFBB1D436C157950EAFD32F710A91EDEE9BB11B258E4AADC72B2AC09D58
          53F7290C6D3AA6F694C8D7313447D6A80389C95D8F20809705D7F85BABF99FE6
          3FAE41FE6E1FC517CB7D3F2BAFCA7D2CFA69F43FC7F9ABA79F2FEF3F30747574
          FECBC8F3FDAF0A2DC1B7E21AEDD57E6AB6FA5FD7ABAC3248FDAF7B2B67C86DE8
          1DBADCD0B15C512BED8ABD5C96475DC8DD12967A38F4B23D213D7149922B34B3
          17B6145AB2422C64D093998DB573F5E09BEA8CFEC0BFAB880F04DF5467F605FD
          5C01E09BEA8CFEC0BFAB8070DAC9AA57FEE2DB719A4B5DAB4935913E93B82342
          048CCDAACC6B6144AD5149CE92CC5F7C2C35C5228D7E2F8AADC57984A54E5079
          885F663323C207B236ADD2C5EB76B56BFEBE14F19910690A5EB2A98520C94626
          F8E9B5FC319E2C7BC0131861C6242DCCF6B11C127231F8201E03CF3CB9F1D50B
          CF007007007007007007007010E78E7CB9FA78039E3D3F9BEDE023C01C01CF1F
          6F3F47E5E00E021CF1E8CFA3F3678039E33F6671C04780B32C6162725CDEE6E2
          CCD2E0E4D23198D4E0B5BD1AA5CD860F1C8C31BD59E418A118861F467258C39C
          E3EDE02F18CE33E9C7FDF9FF00B3F2F0073C63F37FC38039E3F2E3F4E3808F00
          7010E78FCB8FD38E00E78FCB8FD38E00E78FCB8FD38E023C0483882541432541
          452824D0E4269271603493039F4F2194308806633F9F80B4FCAD19FF002E317A
          3ECFF086FF0077E00F95E33FE5D62FFA437FBBF007CAF19FF2EB17FD21BFDDF8
          0AE46D8DEDD8185BD022420333D46051244E97060B1CB964CC12006062E5FD39
          E02BF803803803803803803803806A3BAB6ACEA95D739C58B5BC8AAA89CAD955
          C54848FD73BEA48CC1D1A07495B3363D832F8EAB9A230DD2A5ACCA8F21846F8B
          DB5872F6624C38AB4E8F271980D5CC1FB8E6CBD9578D13128D06AC87C2A6708D
          5392461A76023E5D2F3FDB263B88996E2F19856B1E74B09C1FA2721AAD4C54B4
          ACCC4CA8E5C854293BCE2E72C33B835ADE084F1A3BA6ED1331E49D292600E6BC
          9A0E617C5DF5DB96B5DED0191EAAB8D75B35ADF5A5A95F3B3939C9958ED266AA
          2A5B5244BDD5D1B508CD129610BC031F0854427C94E3A09BD9B05B0BB028E154
          AA8A7566BA7D54DB0CACB5C503B45D575814BEB8C2B574E6947523D96FCC9177
          67B9C59572BFB51928C094320D035E4E6A2959A4F59CF40D49CF742EA9842A80
          AB7167C728A75766AED6618E6BF278BDEAED7DDE712BB9F684975A364D7D71BA
          CA472922230B3CD7C893818AD24970980C6E7F35AB00DD527868919A19DD36F4
          717FBDC88A3B57E2AF123143A5EDB61CCAAE78CBEE9CC75E36C7341D82B364EB
          F88CFD500D056D5B182941CD4E8E71D91203DBD51CF0991B5E0E3108F5391D50
          D80B79EF58FB8ADBA8EE8ABAD09440761EF82E9CB927E82D2866B6393241290A
          97E55907975E075746AA6913F27526BC2D8A28718F2A561725CD4A8E20EC0F87
          21A93F7744D8322ABAE64245974DD759328EBC2C268B3AD0A85D2511EDACD8BA
          82CC570E2B532976EAA2D2768C3D94B5A028D4259244DEA46B27253C27531A6F
          CFC39E1190BF00A04E77B2F297B4EECB4CD9F2B1A767D5AD2B7C8619DBD5F639
          3951B18FCCF14D7D69B0582E5597656D68C71E011D7E90BCA80015455A8684B6
          F2C2853399520214E490C17603B81DD53498EC5D215CAD93B6445D284DD36442
          CADF0C90C2B63A84B075A2AC873DC6275E6D82412597A5895BEFCF8B7E5F58FE
          D6C4E0F284E6D5ECD937193BC57907C7BFDB892DD73B4E8CAE51DE548EB4422C
          BA7B656C590DCD7557B26B252A0945203A6D443E1CD0D0C5348721201292276E
          425C154689638929028DAB2072389CE41AEB47739D87739A51E078AFD04064B2
          18A415A6F2D5C974294A7B42212C99EAE58F7EAAB0A17E4E62A67E7D72C3248D
          B3350D73C30236FC0D63835283487B4232CB781AB149FB93ED141A0BA82E9255
          B5A2FB96C6AF3576EFB56AB4153BDC4E2F634436CADC8A404359D0A091D9CF36
          EBE4EA848D2F705EF8AD1B53B14947F0F54EC4A14EB3CB168F3E4397DD9DCED8
          FA6F6B6B2A16A66CA922CCD25AAE3D62C524D79BB1313876C0D94E773B7D72FB
          AECC33A72746FF0096DFA39075817917C09049E4662F786A330D796E25778EEE
          859E2B7B5F95876F8B42CD852D324D7213BBB73D6513537737D83602065659DF
          72C90526800E0D6D2AD9E62F71D80C124B9C33109141294099BD30402C230F2E
          1FCFEC2647EEE6E952F207074BACF855955C466C3DBCA3DF08A975C2D14B632C
          2F5D68F7EBAA0D7C31B4AA982F657F7898099C6CAEB1821427683C632D436B90
          324AB24208BB87740DAD470BCB5065DAE0535A6D83B32B8FBE5B894C04D085B3
          C7B576BEBFEA98CC85C4CB45055E6BED913A992B8DAC766A93188B0DCC8AC86F
          24D7C116103F0335D94DEBDA56F6DDACAB489EC1ABEB61B7481D6E8ACD16BBC5
          0EBDD55353588D5B57CFEC2576CBDA9589A53165987292BB62307AF89931A934
          7CF6E1A071F8E275ADA638F50A74F77776C18CEBD65B1894D16F7AE755834EA0
          11EBF1155B377F40B526C744EAD9959FBA92F31B67E9232B687A9E392A3CE42C
          D1F355832352254F0EC81B1B8F52308FF101BD7EEB1F3F7CDB527CBDF7D1FBAF
          FDFF007E9ECCBEEE9F427E17E77EF7FF004F3E29FF0097FE77FF00D37F3FF1FF
          00913E71FF001BF8A7CBBFB3E16378DC01C01C01C01C01C01C01C01C01C01C01
          C01C048388215146A752494790780651E41E580D24F28C0E4232CD2478100C28
          C0E738CE058CE33C07C0D2A530D4EA069881A849834294E112588D4A13C2101C
          14E3C872611834000E07D3CB9E3973E011CAEB5CA8CA9251299B57157C4E272E
          9A0069A45236D6FEA7656DA6B9AA7B1B1245AACC506B3C644F6B8F5BF0B4794E
          DD85A78CFC13E28C43C82D05145905964905809289000A28A28012CB28B2C380
          0005803C8002C00C63A438C72C6380F911040CF2D408A2B2A092CD24A3F25832
          71651E328679459BCBC401678C806461C6790B20C73FB31C07C052A50E140429
          8808558C662A08492C21546180C1660D407A3183CC30A06022C8B9F3C6397013
          0A20924A2C828A2CB20A2C24964960080A2CA007A00500B0F2000B0031D380E3
          1CB18E02461020C14953851A409084448D11384C56094834E1C8091A42BA3C34
          E32422E40C83974E3ECE0277974F83FCDE0827CD785E5FCCF860F31E5FAFC5F0
          3C5E9F13C2C0FF005BA39F2E7E9E000A720B34E3CB20901EA3C3F30700B004E3
          FC10F413E31B80E0667860CF20F5673D3FD1C0634BA0B0C749732CF5CA2CC4BA
          6B1C617F8B304A55B62550FACD1C94B9471DE46C8DCE269425291B1EDD21ED4A
          14921160069ADE40858E65879064BE027F1FCD7805799C93E5FC7F0C3E3797EB
          F13C0F17A7AFC3EBFD6E8E7CB9FA780049C819A51E324A19E9F0660838658447
          1383B0109D824C107232F07746302E9E5D5CBD3C07C1C95328C902509C83C494
          FC294C238A2CCCA652001A585427C8C23C94A0251A30F58790B96738FB339E02
          AB80380A2CB720CA5020CA2499425F8382D1E5313E50BF00C01A47869FA3C007
          8269781079071D22C6338E5C04EC2720078D4849282A0D2CB28C3F0583071851
          4230451433718EB196588D16421FB319CE7F2E78002412124298049414C12B04
          848096109212301E8F070560382F05747EAF4F2E5CB8097E451F93F87F944DE4
          3CB792F23E017E4FC9785E0793F2BD1E0795F0BF53A3A7A3A3D1CB97012BA9D7
          D537FEFD4FBB704D1D4EBEA9BFF7EA7DDB81A3A9D7D537FEFD4FBB7034753AFA
          A6FF00DFA9F76E068EA75F54DFFBF53EEDC0D1D4EBEA9BFF007EA7DDB81A39B9
          FAA43ED4ABDDB81A8F53A7A941ED2A3DD781A87373F5487DA957BB70347373F5
          487DA957BB70351EA74F5283DA547BAF034753A7A941ED2A3DD781A87373F548
          7DA957BB70347373F5487DA957BB70347373F5487DA957BB70347373F5487DA9
          57BB70347373F5487DA957BB70347373F5487DA957BB70347373F5487DA957BB
          70347373F5487DA957BB7034753AFAA6FF00DFA9F76E068E6E7EA90FB52AF76E
          068E6E7EA90FB52AF76E068E6E7EA90FB52AF76E068E6E7EA90FB52AF76E068E
          6E7EA90FB52AF76E068E6E7EA90FB52AF76E068E6E7EA90FB52AF76E068E6E7E
          A90FB52AF76E068EA75F54DFFBF53EEDC0D1CDCFD521F6A55EEDC0D1CDCFD521
          F6A55EEDC0D439B9FAA41ED4A7DDB81AFFD9}
        mmHeight = 16934
        mmLeft = 11906
        mmTop = 12435
        mmWidth = 72230
        BandType = 4
      end
      object ppLabel127: TppLabel
        UserName = 'Label127'
        Caption = 
          'Acercarse a  cualquiera  de  las oficinas del Banco de Cr'#233'dito B' +
          'CP a nivel nacional y mencionar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 17992
        mmTop = 113506
        mmWidth = 148166
        BandType = 4
      end
      object ppLabel128: TppLabel
        UserName = 'Label128'
        Caption = '2.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 13758
        mmTop = 126471
        mmWidth = 2942
        BandType = 4
      end
      object ppLabel130: TppLabel
        UserName = 'Label130'
        Caption = 'nosotros llamando al 219-0217, donde con gusto lo atenderemos.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4064
        mmLeft = 13758
        mmTop = 152665
        mmWidth = 103018
        BandType = 4
      end
      object ppLabel131: TppLabel
        UserName = 'Label131'
        Caption = 'JEFE DE PREVISI'#211'N SOCIAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 71702
        mmTop = 202936
        mmWidth = 48345
        BandType = 4
      end
      object ppLabel133: TppLabel
        UserName = 'Label133'
        Caption = 'a partir de 3 p.m.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 13758
        mmTop = 221192
        mmWidth = 26585
        BandType = 4
      end
      object pplfechahora: TppLabel
        UserName = 'lfechahora'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3979
        mmLeft = 13758
        mmTop = 227542
        mmWidth = 123571
        BandType = 4
      end
      object ppLine37: TppLine
        UserName = 'Line37'
        Weight = 0.750000000000000000
        mmHeight = 265
        mmLeft = 71173
        mmTop = 202142
        mmWidth = 49742
        BandType = 4
      end
    end
  end
end
