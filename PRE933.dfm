object FRMREPORTEPOSTRESST: TFRMREPORTEPOSTRESST
  Left = 396
  Top = 173
  Width = 676
  Height = 420
  Caption = 'Reportes Post Reestructuracion'
  Color = 10207162
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 668
    Height = 41
    Align = alTop
    Color = 10207162
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 80
      Height = 13
      Caption = 'Departamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dblcdptoid: TwwDBLookupCombo
      Left = 100
      Top = 12
      Width = 45
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      LookupTable = DM1.cdsDpto
      LookupField = 'DPTOID'
      Style = csDropDownList
      MaxLength = 2
      ParentFont = False
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      PreciseEditRegion = False
      AllowClearKey = False
      OnChange = dblcdptoidChange
      OnExit = dblcdptoidExit
    end
    object medptodes: TMaskEdit
      Left = 147
      Top = 13
      Width = 198
      Height = 19
      AutoSize = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 1
    end
    object btnGenerarReporte: TButton
      Left = 368
      Top = 8
      Width = 113
      Height = 25
      Caption = 'Generar Reporte'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnGenerarReporteClick
    end
    object btnExportarExcel: TButton
      Left = 488
      Top = 8
      Width = 105
      Height = 25
      Caption = 'Exportar a Excel'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnExportarExcelClick
    end
  end
  object wwDBGData: TwwDBGrid
    Left = 0
    Top = 41
    Width = 668
    Height = 352
    DisableThemesInTitle = False
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alClient
    DataSource = DM1.dsQry10
    Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    TabOrder = 1
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
  end
  object dtgData: TDBGrid
    Left = 216
    Top = 152
    Width = 25
    Height = 41
    DataSource = DM1.dsQry10
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
  end
end
