object FCPassw: TFCPassw
  Left = 622
  Top = 250
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Previsi'#243'n'
  ClientHeight = 326
  ClientWidth = 352
  Color = 10207162
  Constraints.MaxHeight = 364
  Constraints.MaxWidth = 368
  Constraints.MinHeight = 360
  Constraints.MinWidth = 360
  Font.Charset = ANSI_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 15
  object Label3: TLabel
    Left = 10
    Top = 1
    Width = 256
    Height = 35
    Caption = 'Cambio de Contrase'#241'a'
    Color = 5131930
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -24
    Font.Name = 'Comic Sans MS'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object pnlRegistro: TPanel
    Left = 8
    Top = 128
    Width = 335
    Height = 53
    Color = 10207162
    TabOrder = 1
    object lblContrasena: TLabel
      Left = 16
      Top = 19
      Width = 68
      Height = 19
      Caption = 'Contrase'#241'a'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bbtnOk: TBitBtn
      Left = 230
      Top = 14
      Width = 32
      Height = 30
      TabOrder = 1
      OnClick = bbtnOkClick
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
    end
    object dbePwdAnterior: TwwDBEdit
      Left = 99
      Top = 13
      Width = 120
      Height = 31
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      Frame.NonFocusBorders = [efRightBorder, efBottomBorder]
      MaxLength = 20
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object BitBtn1: TBitBtn
      Left = 271
      Top = 14
      Width = 49
      Height = 30
      Caption = 'Salir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = bbtnCanc2Click
      NumGlyphs = 2
    end
  end
  object pnlNuevoPwd: TPanel
    Left = 8
    Top = 185
    Width = 336
    Height = 137
    BevelWidth = 2
    Color = 13165023
    Enabled = False
    TabOrder = 2
    object bbtnOk2: TBitBtn
      Left = 233
      Top = 98
      Width = 32
      Height = 30
      TabOrder = 1
      OnClick = bbtnOk2Click
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
    end
    object bbtnCanc2: TBitBtn
      Left = 272
      Top = 98
      Width = 47
      Height = 30
      Caption = 'Salir'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = bbtnCanc2Click
      NumGlyphs = 2
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 6
      Width = 303
      Height = 85
      Caption = 'Nueva'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object lblPwdNue: TLabel
        Left = 47
        Top = 22
        Width = 68
        Height = 19
        Caption = 'Contrase'#241'a'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblPwdConf: TLabel
        Left = 47
        Top = 54
        Width = 56
        Height = 19
        Caption = 'Confirma'
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbePwdConfirma: TwwDBEdit
        Left = 129
        Top = 49
        Width = 120
        Height = 27
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        MaxLength = 20
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbePwdNuevo: TwwDBEdit
        Left = 129
        Top = 20
        Width = 120
        Height = 27
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        MaxLength = 20
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 37
    Width = 335
    Height = 91
    Color = 10207162
    Enabled = False
    TabOrder = 0
    object lblUsuario: TLabel
      Left = 16
      Top = 13
      Width = 47
      Height = 19
      Caption = 'Usuario'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 16
      Top = 60
      Width = 49
      Height = 19
      Caption = 'Nombre'
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbeNombre: TwwDBEdit
      Left = 98
      Top = 48
      Width = 220
      Height = 29
      BorderStyle = bsNone
      Color = clInfoBk
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeUsuario: TwwDBEdit
      Left = 98
      Top = 9
      Width = 219
      Height = 25
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = clInfoBk
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Comic Sans MS'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
end
