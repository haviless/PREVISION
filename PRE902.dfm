object FCboTipoBeneficio: TFCboTipoBeneficio
  Left = 0
  Top = 0
  Width = 234
  Height = 41
  TabOrder = 0
  DesignSize = (
    234
    41)
  object lblEtiqueta: TLabel
    Left = 0
    Top = 0
    Width = 92
    Height = 15
    Caption = 'Tipo de Beneficio'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Comic Sans MS'
    Font.Style = []
    ParentFont = False
  end
  object cbListaDatos: TwwDBLookupCombo
    Left = 2
    Top = 17
    Width = 232
    Height = 23
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Arial'
    Font.Style = []
    DropDownAlignment = taLeftJustify
    Options = [loColLines, loRowLines]
    Style = csDropDownList
    ParentFont = False
    TabOrder = 0
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
  end
end
