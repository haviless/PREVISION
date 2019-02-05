object Fmueautdesapo: TFmueautdesapo
  Left = 523
  Top = 172
  BorderStyle = bsDialog
  Caption = 'Detalle de la autorizaci'#242'n de descuento de aportes'
  ClientHeight = 269
  ClientWidth = 429
  Color = 12114134
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
  object gbgrupo: TGroupBox
    Left = 1
    Top = 26
    Width = 426
    Height = 199
    Caption = ' Detalle de la autorizaci'#243'n de descuento :'
    Enabled = False
    TabOrder = 0
    object Label1: TLabel
      Left = 10
      Top = 23
      Width = 103
      Height = 13
      Caption = 'Usuario que autoriz'#243' :'
    end
    object Label2: TLabel
      Left = 10
      Top = 47
      Width = 111
      Height = 13
      Caption = 'Fecha de autorizaci'#243'n :'
    end
    object Label3: TLabel
      Left = 10
      Top = 94
      Width = 100
      Height = 13
      Caption = 'Oficina que autoriza :'
    end
    object Label5: TLabel
      Left = 27
      Top = 122
      Width = 84
      Height = 17
      Caption = 'Procesado En : '
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 17
      Top = 147
      Width = 92
      Height = 17
      Caption = 'Unidad De Pago :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 33
      Top = 172
      Width = 68
      Height = 17
      Caption = 'Use / Ugel :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 10
      Top = 71
      Width = 88
      Height = 13
      Caption = 'Fecha de registro :'
    end
    object Panel2: TPanel
      Left = 127
      Top = 42
      Width = 117
      Height = 23
      Caption = 'Panel1'
      TabOrder = 0
      object edtFecAutDesApo: TEdit
        Left = 1
        Top = 1
        Width = 115
        Height = 21
        Color = 12114134
        TabOrder = 0
      end
    end
    object Panel1: TPanel
      Left = 127
      Top = 17
      Width = 218
      Height = 23
      Caption = 'Panel1'
      TabOrder = 1
      object edtUsuAutRegApo: TEdit
        Left = 1
        Top = 1
        Width = 216
        Height = 21
        Color = 12114134
        TabOrder = 0
      end
    end
    object Panel3: TPanel
      Left = 127
      Top = 67
      Width = 218
      Height = 23
      Caption = 'Panel1'
      TabOrder = 2
      object edtFecRegAutDesApo: TEdit
        Left = 1
        Top = 1
        Width = 216
        Height = 21
        Color = 12114134
        TabOrder = 0
      end
    end
    object Panel4: TPanel
      Left = 127
      Top = 93
      Width = 218
      Height = 23
      Caption = 'Panel1'
      TabOrder = 3
      object edtOfAutDesApo: TEdit
        Left = 1
        Top = 1
        Width = 216
        Height = 21
        Color = 12114134
        TabOrder = 0
      end
    end
    object Panel5: TPanel
      Left = 127
      Top = 119
      Width = 289
      Height = 23
      Caption = 'Panel1'
      TabOrder = 4
      object edtDesUniPro: TEdit
        Left = 1
        Top = 1
        Width = 286
        Height = 21
        Color = 12114134
        TabOrder = 0
      end
    end
    object Panel6: TPanel
      Left = 127
      Top = 144
      Width = 290
      Height = 23
      Caption = 'Panel1'
      TabOrder = 5
      object edtDesUniPag: TEdit
        Left = 1
        Top = 1
        Width = 286
        Height = 21
        Color = 12114134
        TabOrder = 0
      end
    end
    object Panel7: TPanel
      Left = 127
      Top = 169
      Width = 290
      Height = 23
      Caption = 'Panel1'
      TabOrder = 6
      object edtDesUniGes: TEdit
        Left = 1
        Top = 1
        Width = 286
        Height = 21
        Color = 12114134
        TabOrder = 0
      end
    end
  end
  object btncerrar: TBitBtn
    Left = 343
    Top = 231
    Width = 83
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
  object StaticText1: TStaticText
    Left = 0
    Top = 0
    Width = 429
    Height = 17
    Align = alTop
    Alignment = taCenter
    BevelKind = bkFlat
    Caption = 'DETALLE DE AUTORIZACION DE DESCUENTO DE APORTES'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    TabOrder = 2
  end
end
