object Fapecardes: TFapecardes
  Left = 264
  Top = 164
  BorderStyle = bsDialog
  Caption = 'Apertura de carta de designaci'#243'n'
  ClientHeight = 378
  ClientWidth = 763
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
  object gbcartas: TGroupBox
    Left = 7
    Top = 2
    Width = 749
    Height = 335
    Caption = ' Apertura de carta de Designaci'#243'n '
    TabOrder = 0
    object Label1: TLabel
      Left = 14
      Top = 68
      Width = 80
      Height = 15
      Caption = 'C'#243'digo Modular'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 108
      Top = 68
      Width = 124
      Height = 15
      Caption = 'Documento de Identidad'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 247
      Top = 68
      Width = 115
      Height = 15
      Caption = 'Apellidos y Nombre(s):'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 14
      Top = 117
      Width = 92
      Height = 15
      Caption = 'Fecha de apertura'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 116
      Top = 117
      Width = 68
      Height = 15
      Caption = 'Observacion:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 14
      Top = 19
      Width = 88
      Height = 15
      Caption = 'N'#250'mero de carta:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 115
      Top = 19
      Width = 90
      Height = 15
      Caption = 'Fecha de la carta:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object pnlasocodmod: TPanel
      Left = 14
      Top = 88
      Width = 81
      Height = 23
      Color = 13165023
      Enabled = False
      TabOrder = 0
      object meAsocodmod: TMaskEdit
        Tag = 6
        Left = 1
        Top = 1
        Width = 78
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 0
      end
    end
    object Panel2: TPanel
      Left = 107
      Top = 88
      Width = 127
      Height = 23
      Color = 13165023
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object meAsoDocNum: TMaskEdit
        Left = 1
        Top = 1
        Width = 125
        Height = 21
        TabOrder = 0
      end
    end
    object Panel1: TPanel
      Left = 247
      Top = 88
      Width = 399
      Height = 23
      Color = 13165023
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object meAsoApeNomDni: TMaskEdit
        Left = 1
        Top = 1
        Width = 398
        Height = 21
        TabOrder = 0
      end
    end
    object dbdtpfecape: TwwDBDateTimePicker
      Left = 12
      Top = 140
      Width = 91
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      Epoch = 1950
      ShowButton = True
      TabOrder = 3
    end
    object meobs: TMaskEdit
      Left = 116
      Top = 140
      Width = 529
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 4
    end
    object dbgdeudos: TwwDBGrid
      Left = 9
      Top = 167
      Width = 734
      Height = 162
      DisableThemesInTitle = False
      Selected.Strings = (
        'TIPREL'#9'2'#9'TIPREL'
        'APEPAT'#9'30'#9'Apellido~Paterno'
        'APEMAT'#9'30'#9'Apellido~Materno'
        'APECAS'#9'30'#9'Apellido~Casada'
        'APENOM'#9'30'#9'Nombre del~Designatario'
        'PARENDES'#9'30'#9'Tipo de~relaci'#243'n'
        'DSGOTRTIPREL'#9'15'#9'Otro Tipo~de relaci'#243'n'
        'FECNAC'#9'10'#9'Fecha de~Nacimiento'
        'SEXO'#9'20'#9'Sexo del~Designatario'
        'DNI'#9'20'#9'DNI del~Designatario'
        'PORC'#9'10'#9'Porcentaje del~Designatario'
        'APEPATTUT'#9'20'#9'Apellido Paterno~Del Tutor'
        'APEMATTUT'#9'20'#9'Apellido Materno~del Tutor'
        'NOMTUT'#9'20'#9'Nombre del~Tutor'
        'DNITUT'#9'8'#9'DNI del~Tutor'
        'FORPAGID'#9'2'#9'Forma~de pago'
        'BANCOID'#9'20'#9'Banco del~Pago'
        'AGEBCOID'#9'20'#9'Agencia~del Banco'
        'DSGDIRDES'#9'250'#9'Direcci'#243'n del~designatario '
        'DSGZIPIDDES'#9'6'#9'Zip del~designatario'
        'DSGTELFIJDES'#9'15'#9'Telefono Fijo~del designatario'
        'DSGTELMOVDES'#9'15'#9'Telefono movil~del designatario'
        'EMAILDES'#9'60'#9'Email')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = DM1.dsdetcardes
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter, dgFooter3DCells]
      TabOrder = 5
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 2
      TitleButtons = False
      OnDblClick = dbgdeudosDblClick
      object dbgbinserta: TwwIButton
        Left = 0
        Top = 0
        Width = 29
        Height = 29
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
        OnClick = dbgbinsertaClick
      end
    end
    object Panel3: TPanel
      Left = 14
      Top = 39
      Width = 81
      Height = 23
      Color = 13165023
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      object medsgnro: TMaskEdit
        Left = 1
        Top = 1
        Width = 78
        Height = 21
        TabOrder = 0
      end
    end
    object Panel4: TPanel
      Left = 115
      Top = 39
      Width = 115
      Height = 23
      Color = 13165023
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      object medsgfrec: TMaskEdit
        Left = 1
        Top = 1
        Width = 113
        Height = 21
        TabOrder = 0
      end
    end
  end
  object btnGrabar: TBitBtn
    Left = 601
    Top = 344
    Width = 75
    Height = 32
    Caption = 'Grabar'
    TabOrder = 1
    OnClick = btnGrabarClick
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
  object btnCerrar: TBitBtn
    Left = 681
    Top = 344
    Width = 75
    Height = 32
    Caption = 'Cerrar'
    TabOrder = 2
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
  object btnElimina: TBitBtn
    Left = 521
    Top = 344
    Width = 75
    Height = 32
    Caption = 'Elimina'
    TabOrder = 3
    OnClick = btnEliminaClick
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
end
