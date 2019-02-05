object Freprogdesembolso: TFreprogdesembolso
  Left = 189
  Top = 193
  BorderStyle = bsDialog
  Caption = 'Reprogramaci'#243'n de desembolso'
  ClientHeight = 458
  ClientWidth = 834
  Color = 13165023
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
  object gbtitdesext: TGroupBox
    Left = 5
    Top = 5
    Width = 817
    Height = 137
    Caption = 'Desembolsos extornados'
    TabOrder = 0
    object dbgdesext: TwwDBGrid
      Left = 8
      Top = 17
      Width = 797
      Height = 112
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = DM1.dsDetLiq
      Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
      TabOrder = 0
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
  object gbCobAso: TGroupBox
    Left = 105
    Top = 150
    Width = 469
    Height = 105
    Caption = '  Seleccione la forma de pago '
    Color = 10207162
    ParentColor = False
    TabOrder = 1
    Visible = False
    object lblforpag: TLabel
      Left = 9
      Top = 21
      Width = 73
      Height = 15
      Caption = 'Forma de Pago'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lblbanco: TLabel
      Left = 9
      Top = 45
      Width = 31
      Height = 15
      Caption = 'Banco'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object Label25: TLabel
      Left = 89
      Top = 45
      Width = 3
      Height = 13
      Caption = ':'
    end
    object Label19: TLabel
      Left = 89
      Top = 21
      Width = 3
      Height = 13
      Caption = ':'
    end
    object lblasoncta: TLabel
      Left = 9
      Top = 71
      Width = 35
      Height = 15
      Caption = 'Cuenta'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Comic Sans MS'
      Font.Style = []
      ParentFont = False
    end
    object lbldospun04: TLabel
      Left = 89
      Top = 71
      Width = 3
      Height = 13
      Caption = ':'
    end
    object dblcforpag: TwwDBLookupCombo
      Left = 98
      Top = 21
      Width = 44
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'TIPDESEID'#9'2'#9'C'#243'digo de la~Forma de pago'#9#9
        'TIPDESEDES'#9'25'#9'Descripci'#243'n de la~Forma de Pago'#9#9)
      LookupTable = DM1.cdsFPago
      LookupField = 'TIPDESEID'
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dblcforpagChange
      OnExit = dblcforpagExit
    end
    object dblcBanco: TwwDBLookupCombo
      Left = 98
      Top = 45
      Width = 44
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'BANCOID'#9'2'#9'C'#243'digo de~Banco'#9#9
        'BANCONOM'#9'25'#9'Descripci'#243'n del~banco'#9#9)
      LookupTable = DM1.cdsBanco
      LookupField = 'BANCOID'
      MaxLength = 2
      ParentFont = False
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dblcBancoChange
      OnExit = dblcBancoExit
    end
    object pnlbanco: TPanel
      Left = 173
      Top = 45
      Width = 288
      Height = 21
      Color = 13165023
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object mebancodes: TMaskEdit
        Left = 1
        Top = 1
        Width = 286
        Height = 19
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 0
      end
    end
    object pnlforpag: TPanel
      Left = 173
      Top = 21
      Width = 288
      Height = 21
      Color = 13165023
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object meforpagodes: TMaskEdit
        Left = 1
        Top = 1
        Width = 286
        Height = 19
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 0
      end
    end
    object pnlasoncta: TPanel
      Left = 173
      Top = 71
      Width = 143
      Height = 21
      Color = 13165023
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      object measoncta: TMaskEdit
        Left = 1
        Top = 1
        Width = 140
        Height = 19
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object rgCobAso: TRadioGroup
    Left = 8
    Top = 150
    Width = 92
    Height = 49
    Caption = 'Cobra Asociado'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Si'
      'No')
    TabOrder = 2
    OnClick = rgCobAsoClick
  end
  object gbtitnueben: TGroupBox
    Left = 7
    Top = 259
    Width = 817
    Height = 158
    Caption = 'Beneficiarios'
    TabOrder = 3
    object dbgbenrep: TwwDBGrid
      Left = 8
      Top = 17
      Width = 797
      Height = 131
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = DM1.dsDetCartas
      Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 0
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
  object btnbeneficiarios: TBitBtn
    Left = 105
    Top = 150
    Width = 94
    Height = 28
    Caption = 'Beneficiarios'
    TabOrder = 4
    OnClick = btnbeneficiariosClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
      55555575555555775F55509999999901055557F55555557F75F5001111111101
      105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
      01105777F555557F7FF75500FFFFFF0F00105577F555FF7F77575550FF70000F
      0F0055575FF777757F775555000FFFFF0F005555777555FF7F77555550FF7000
      0F055555575FF777757F555555000FFFFF05555555777555FF7F55555550FF70
      0005555555575FF7777555555555000555555555555577755555555555555555
      5555555555555555555555555555555555555555555555555555}
    NumGlyphs = 2
  end
  object btncerrar: TBitBtn
    Left = 743
    Top = 426
    Width = 80
    Height = 28
    Caption = 'Cerrar'
    TabOrder = 5
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
  object btnreprogramar: TBitBtn
    Left = 643
    Top = 426
    Width = 94
    Height = 28
    Caption = 'Reprogramar'
    TabOrder = 6
    OnClick = btnreprogramarClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
      55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
      55555575555555775F55509999999901055557F55555557F75F5001111111101
      105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
      01105777F555557F7FF75500FFFFFF0F00105577F555FF7F77575550FF70000F
      0F0055575FF777757F775555000FFFFF0F005555777555FF7F77555550FF7000
      0F055555575FF777757F555555000FFFFF05555555777555FF7F55555550FF70
      0005555555575FF7777555555555000555555555555577755555555555555555
      5555555555555555555555555555555555555555555555555555}
    NumGlyphs = 2
  end
end
