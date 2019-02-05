object ReportesCesaSinLiqui: TReportesCesaSinLiqui
  Left = 552
  Top = 176
  BorderStyle = bsDialog
  Caption = 'Reportes para Programaci'#243'n de Cesantes sin Liquidaci'#243'n'
  ClientHeight = 412
  ClientWidth = 613
  Color = 13165023
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Comic Sans MS'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 20
  object gbfiltra: TGroupBox
    Left = 8
    Top = 8
    Width = 600
    Height = 89
    Caption = 'Tipo de Reporte'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object Label3: TLabel
      Left = 35
      Top = 30
      Width = 135
      Height = 20
      Caption = 'Fecha de Programaci'#243'n'
      Color = 13165023
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object rdbCeInterinos: TRadioButton
      Left = 36
      Top = 63
      Width = 125
      Height = 17
      Caption = 'Cesantes Interinos'
      TabOrder = 0
    end
    object rdbCe65: TRadioButton
      Left = 323
      Top = 64
      Width = 174
      Height = 17
      Caption = 'Activos Mayores de 65 a'#241'os'
      TabOrder = 1
    end
    object rdbCeFallecidos: TRadioButton
      Left = 173
      Top = 63
      Width = 136
      Height = 17
      Caption = 'Docentes Fallecidos'
      TabOrder = 2
    end
    object pnlFecha: TPanel
      Left = 176
      Top = 22
      Width = 96
      Height = 31
      TabOrder = 3
      object dtpFecha: TDateTimePicker
        Left = 2
        Top = 1
        Width = 93
        Height = 28
        Date = 36943.719144328700000000
        Time = 36943.719144328700000000
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object btnFiltro: TfcShapeBtn
      Left = 537
      Top = 30
      Width = 49
      Height = 25
      Hint = 'Reporte de Planillas'
      Color = clBtnFace
      DitherColor = clWhite
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333330000000
        00003333377777777777333330FFFFFFFFF03FF3F7FFFF33FFF7003000000FF0
        00F077F7777773F77737E00FBFBFB0FFFFF07773333FF7FF33F7E0FBFB00000F
        F0F077F333777773F737E0BFBFBFBFB0FFF077F3333FFFF733F7E0FBFB00000F
        F0F077F333777773F737E0BFBFBFBFB0FFF077F33FFFFFF733F7E0FB0000000F
        F0F077FF777777733737000FB0FFFFFFFFF07773F7F333333337333000FFFFFF
        FFF0333777F3FFF33FF7333330F000FF0000333337F777337777333330FFFFFF
        0FF0333337FFFFFF7F37333330CCCCCC0F033333377777777F73333330FFFFFF
        0033333337FFFFFF773333333000000003333333377777777333}
      NumGlyphs = 2
      ParentClipping = True
      ParentShowHint = False
      RoundRectBias = 25
      ShadeStyle = fbsHighlight
      Shape = bsEllipse
      ShowHint = True
      TabOrder = 4
      TextOptions.Alignment = taCenter
      TextOptions.VAlignment = vaVCenter
      OnClick = btnFiltroClick
    end
  end
  object gbProgramacion: TGroupBox
    Left = 8
    Top = 97
    Width = 601
    Height = 313
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object btnExcel: TBitBtn
      Left = 511
      Top = 274
      Width = 84
      Height = 30
      Hint = 'Exportar a Excel'
      Caption = 'A Excel'
      Enabled = False
      TabOrder = 0
      OnClick = btnExcelClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDDDDDDDDDDDDDDDDDDDDDDDDDD00000DD00000000006660DD08888880E00
        000DD000000000EEE080DD07778E0EEE0080DDD078E0EEE07700DDDD0E0EEE00
        0000DDD0E0EEE080DDDDDD0E0EEE07080DDDD0E0EEE0777080DD0E0EEE0D0777
        080D00EEE0DDD077700D00000DDDDD00000DDDDDDDDDDDDDDDDD}
    end
    object dbgReporte: TwwDBGrid
      Left = 3
      Top = 13
      Width = 593
      Height = 256
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial Narrow'
      Font.Style = []
      Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
    end
  end
  object dtgData: TDBGrid
    Left = 15
    Top = 425
    Width = 73
    Height = 33
    TabOrder = 2
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Comic Sans MS'
    TitleFont.Style = []
    Visible = False
  end
end
