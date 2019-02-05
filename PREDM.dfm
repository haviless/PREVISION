object DM1: TDM1
  OldCreateOrder = False
  OnCreate = c
  OnDestroy = DataModuleDestroy
  Left = 39
  Height = 728
  Width = 1175
  object cdsAcceso: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAcceso'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 592
    Top = 208
  end
  object dsAcceso: TwwDataSource
    DataSet = cdsAcceso
    Left = 592
    Top = 226
  end
  object cdsUsuarios: TwwClientDataSet
    Aggregates = <>
    IndexFieldNames = 'USERID'
    Params = <>
    ProviderName = 'dspUsuario'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 207
    Top = 558
  end
  object dsUsuarios: TwwDataSource
    DataSet = cdsUsuarios
    Left = 207
    Top = 576
  end
  object cdsGrupos: TwwClientDataSet
    Aggregates = <>
    IndexFieldNames = 'GRUPOID;MODULOID;TIPO;OBJETO'
    Params = <>
    ProviderName = 'dspGrupos'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 140
    Top = 558
  end
  object dsGrupos: TwwDataSource
    DataSet = cdsGrupos
    Left = 140
    Top = 576
  end
  object cdsMGrupo: TwwClientDataSet
    Aggregates = <>
    IndexFieldNames = 'GRUPOID'
    Params = <>
    ProviderName = 'dspMGrupo'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 75
    Top = 558
  end
  object dsMGrupo: TwwDataSource
    DataSet = cdsMGrupo
    Left = 75
    Top = 576
  end
  object cdsReporte: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReporte'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 276
    Top = 4
  end
  object dsReporte: TwwDataSource
    DataSet = cdsReporte
    Left = 276
    Top = 19
  end
  object cdsQry: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTGE'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 12
    Top = 488
  end
  object dsQry: TwwDataSource
    DataSet = cdsQry
    Left = 12
    Top = 504
  end
  object cdsMaestCartas: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCabdsg'
    RemoteServer = DCOM1
    OnReconcileError = cdsMaestCartasReconcileError
    ValidateWithMask = True
    Left = 276
    Top = 72
  end
  object dsMaestCartas: TwwDataSource
    DataSet = cdsMaestCartas
    Left = 276
    Top = 88
  end
  object cdsDetCartas: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDetdsg'
    RemoteServer = DCOM1
    OnReconcileError = cdsMaestCartasReconcileError
    ValidateWithMask = True
    Left = 223
    Top = 415
  end
  object dsDetCartas: TwwDataSource
    DataSet = cdsDetCartas
    Left = 224
    Top = 432
  end
  object cdsTipoMoneda: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTMoneda'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 492
    Top = 345
  end
  object cdsSexo: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvQry'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 346
    Top = 415
  end
  object cdsResultSet: TwwClientDataSet
    Aggregates = <>
    Params = <>
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 281
    Top = 558
  end
  object dsTipoMoneda: TwwDataSource
    DataSet = cdsTipoMoneda
    Left = 492
    Top = 362
  end
  object dsSexo: TwwDataSource
    DataSet = cdsSexo
    Left = 346
    Top = 432
  end
  object cdsEstCarta: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEstdsg'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 22
    Top = 345
  end
  object dsEstCarta: TwwDataSource
    DataSet = cdsEstCarta
    Left = 22
    Top = 362
  end
  object cdsSituacAsoc: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSituacAsoc'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 442
    Top = 278
  end
  object cdsTipoAsoc: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTipoAsoc'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 548
    Top = 4
  end
  object dsSituacAsoc: TwwDataSource
    Left = 442
    Top = 294
  end
  object dsTipoAsoc: TwwDataSource
    Left = 548
    Top = 19
  end
  object cdsTRelacion: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTRela'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 857
    Top = 73
  end
  object dsTRelacion: TwwDataSource
    DataSet = cdsTRelacion
    Left = 858
    Top = 88
  end
  object cdsMaestRetJud: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCabRtj'
    RemoteServer = DCOM1
    OnReconcileError = cdsMaestCartasReconcileError
    ValidateWithMask = True
    Left = 492
    Top = 72
  end
  object dsMaestRetJud: TwwDataSource
    DataSet = cdsMaestRetJud
    Left = 492
    Top = 88
  end
  object cdsDetRetJud: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDetRtj'
    RemoteServer = DCOM1
    OnReconcileError = cdsMaestCartasReconcileError
    ValidateWithMask = True
    Left = 25
    Top = 278
  end
  object dsDetRetJud: TwwDataSource
    DataSet = cdsDetRetJud
    Left = 25
    Top = 294
  end
  object cdsDpto: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDpto'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 636
    Top = 84
  end
  object dsDpto: TwwDataSource
    DataSet = cdsDpto
    Left = 637
    Top = 99
  end
  object cdsBanco: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBancos'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 411
    Top = 72
  end
  object dsBanco: TwwDataSource
    DataSet = cdsBanco
    Left = 411
    Top = 88
  end
  object cdsAsociado: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvAso'
    RemoteServer = DCOM1
    OnReconcileError = cdsMaestCartasReconcileError
    PictureMasks.Strings = (
      'ASODNI'#9'########'#9'T'#9'F')
    ValidateWithMask = True
    Left = 805
    Top = 278
  end
  object dsAsociado: TwwDataSource
    DataSet = cdsAsociado
    Left = 805
    Top = 295
  end
  object cdsExpLiq: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspExpliq'
    RemoteServer = DCOM1
    OnReconcileError = cdsMaestCartasReconcileError
    ValidateWithMask = True
    Left = 79
    Top = 4
  end
  object dsExpLiq: TwwDataSource
    DataSet = cdsExpLiq
    Left = 79
    Top = 19
  end
  object cdsNacionalidad: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvPais'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 352
    Top = 141
  end
  object dsNacionalidad: TwwDataSource
    DataSet = cdsNacionalidad
    Left = 352
    Top = 156
  end
  object cdsUPro: TwwClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'UPROID'
        Attributes = [faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'UPRONOM'
        Attributes = [faFixed]
        DataType = ftString
        Size = 75
      end
      item
        Name = 'UPROABR'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'UPROTELF'
        Attributes = [faFixed]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'UPRODIR'
        Attributes = [faFixed]
        DataType = ftString
        Size = 75
      end
      item
        Name = 'DIRDPTOID'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'DIRPROVID'
        Attributes = [faFixed]
        DataType = ftString
        Size = 4
      end
      item
        Name = 'DIRZIPID'
        Attributes = [faFixed]
        DataType = ftString
        Size = 6
      end
      item
        Name = 'DPTOID'
        Attributes = [faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CIUDID'
        Attributes = [faFixed]
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ZONAID'
        Attributes = [faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'REPRID'
        Attributes = [faFixed]
        DataType = ftString
        Size = 5
      end
      item
        Name = 'UPROFDES'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'BANCOID'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'PROVBCOID'
        Attributes = [faFixed]
        DataType = ftString
        Size = 4
      end
      item
        Name = 'OFDESID'
        Attributes = [faFixed]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'USUARIO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 10
      end
      item
        Name = 'FREG'
        DataType = ftDateTime
      end
      item
        Name = 'HREG'
        DataType = ftDateTime
      end
      item
        Name = 'FLGFUSION'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'FLGACT'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'prvUProceso'
    RemoteServer = DCOM1
    StoreDefs = True
    ValidateWithMask = True
    Left = 202
    Top = 208
  end
  object dsUPro: TwwDataSource
    DataSet = cdsUPro
    Left = 202
    Top = 226
  end
  object cdsUSES: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvUSES'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 354
    Top = 72
  end
  object dsUSES: TwwDataSource
    DataSet = cdsUSES
    Left = 354
    Top = 88
  end
  object cdsUPago: TwwClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'UPAGOID'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'UPROID'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'UPAGONOM'
        DataType = ftString
        Size = 65
      end
      item
        Name = 'UPAGOTELF'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'UPAGODIR'
        DataType = ftString
        Size = 75
      end
      item
        Name = 'DIRDPTOID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'DIRPROVID'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'DIRZIPID'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'DPTOID'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CIUDID'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ZONAID'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'REPID'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'REPDIR'
        DataType = ftString
        Size = 75
      end
      item
        Name = 'REPTELF'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'UPAGOFDES'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'BANCOID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'PROVBCOID'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'OFDESID'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'USUARIO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'FREG'
        DataType = ftDateTime
      end
      item
        Name = 'HREG'
        DataType = ftDateTime
      end
      item
        Name = 'USE'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'UPAGOABR'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CODANT'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'FLGFUSION'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'prvUPago'
    RemoteServer = DCOM1
    StoreDefs = True
    ValidateWithMask = True
    Left = 373
    Top = 278
  end
  object dsUPago: TwwDataSource
    DataSet = cdsUPago
    Left = 374
    Top = 294
  end
  object cdsTDoc: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTDoc'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 400
    Top = 4
  end
  object dsTDoc: TwwDataSource
    DataSet = cdsTDoc
    Left = 400
    Top = 19
  end
  object cdsCtasBco: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCtasBco'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 547
    Top = 141
  end
  object dsCtasBco: TwwDataSource
    DataSet = cdsCtasBco
    Left = 548
    Top = 156
  end
  object cdsSitCta: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSitCta'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 542
    Top = 415
  end
  object dsSitCta: TwwDataSource
    DataSet = cdsSitCta
    Left = 542
    Top = 432
  end
  object cdsTipBenef: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTipBenef'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 228
    Top = 345
  end
  object dsTipBenef: TwwDataSource
    DataSet = cdsTipBenef
    Left = 228
    Top = 362
  end
  object cdsProvincia: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvProvin'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 160
    Top = 345
  end
  object dsProvincia: TwwDataSource
    DataSet = cdsProvincia
    Left = 160
    Top = 362
  end
  object cdsRegPension: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvRegPension'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 527
    Top = 278
  end
  object dsRegPension: TwwDataSource
    DataSet = cdsRegPension
    Left = 527
    Top = 294
  end
  object cdsCEdu: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCEdu'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 288
    Top = 416
  end
  object dsCEdu: TwwDataSource
    DataSet = cdsCEdu
    Left = 290
    Top = 433
  end
  object cdsDist: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDist'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 204
    Top = 72
  end
  object dsDist: TwwDataSource
    DataSet = cdsDist
    Left = 204
    Top = 88
  end
  object cdsDFam: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDFam'
    RemoteServer = DCOM1
    OnReconcileError = cdsMaestCartasReconcileError
    ValidateWithMask = True
    Left = 130
    Top = 141
  end
  object dsDFam: TwwDataSource
    DataSet = cdsDFam
    Left = 130
    Top = 156
  end
  object cdsTipoResol: TwwClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'TIPRESID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'TIPRESABRE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'TIPRESDES'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'USUARIO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'FREG'
        DataType = ftDateTime
      end
      item
        Name = 'HREG'
        DataType = ftDateTime
      end
      item
        Name = 'TRESSOLID'
        DataType = ftString
        Size = 3
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'prvTipoResol'
    RemoteServer = DCOM1
    StoreDefs = True
    OnReconcileError = cdsMaestCartasReconcileError
    ValidateWithMask = True
    Left = 26
    Top = 72
  end
  object dsTipoResol: TwwDataSource
    DataSet = cdsTipoResol
    Left = 26
    Top = 88
  end
  object cdsAportes: TwwClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ASOID'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TRANSID'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'USEID'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'USEABR'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'UPAGOID'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'UPAGOABR'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'UPROID'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'UPROABR'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'TMONID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'BANCOID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CCBCOID'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'TRANSNOPE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'TRANSFOPE'
        DataType = ftDateTime
      end
      item
        Name = 'TRANSFFCIND'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TRANSANO'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'TRANSMES'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'TRANSMTO'
        DataType = ftFloat
      end
      item
        Name = 'TRANSMTODEV'
        DataType = ftFloat
      end
      item
        Name = 'SALDOANT'
        DataType = ftFloat
      end
      item
        Name = 'INTERESMTO'
        DataType = ftFloat
      end
      item
        Name = 'SALDO'
        DataType = ftFloat
      end
      item
        Name = 'SALDOBONUS'
        DataType = ftFloat
      end
      item
        Name = 'BONUSMTO'
        DataType = ftFloat
      end
      item
        Name = 'INTERESPORC'
        DataType = ftFloat
      end
      item
        Name = 'BONUSPORC'
        DataType = ftFloat
      end
      item
        Name = 'TRANSINTID'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'USUARIO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'APOFRECL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ASOCODMOD'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ASOCODAUX'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'FORPAGOID'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ASOAPENOM'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'TRANSPRV'
        DataType = ftFloat
      end
      item
        Name = 'APOFNP'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'FECCTAIND'
        DataType = ftDateTime
      end
      item
        Name = 'APOFDEV'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DEVANO'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'DEVMES'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'FORPAGOABR'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DPTOID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'DPTOABR'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CIUDID'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'FREG'
        DataType = ftDateTime
      end
      item
        Name = 'HREG'
        DataType = ftDateTime
      end
      item
        Name = 'TRANSAAMM'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'TRANSAATRI'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'TRANSTRIM'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'TRANSSEM'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'TRANSAASEM'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'APOFCNT'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'APOSEC'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'CIAID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'TIPDESEID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'TIPDESEABR'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'BCOGIRO'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'DPTOGIRO'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'AGENBANCOID'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'NRONABO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NROFICIO'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'DETRCOBID'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'USERCOBID'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'RCOBID'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'BANCOIDG'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'AGENCIDG'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'FILLER'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'prvAportes'
    RemoteServer = DCOM1
    StoreDefs = True
    OnReconcileError = cdsMaestCartasReconcileError
    ValidateWithMask = True
    Left = 357
    Top = 345
  end
  object dsAportes: TwwDataSource
    DataSet = cdsAportes
    Left = 357
    Top = 362
  end
  object cdsCuentaEst: TwwClientDataSet
    Aggregates = <>
    PacketRecords = 100
    Params = <>
    ProviderName = 'prvCuentaEst'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 266
    Top = 208
  end
  object cdsBcos: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvBcos'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 424
    Top = 141
  end
  object cdsTVia: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTVia'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 74
    Top = 141
  end
  object dsTVia: TwwDataSource
    DataSet = cdsTVia
    Left = 74
    Top = 156
  end
  object cdsTZona: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTZona'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 396
    Top = 208
  end
  object dsTZona: TwwDataSource
    DataSet = cdsTZona
    Left = 396
    Top = 226
  end
  object cdsQry2: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReporte3'
    RemoteServer = DCOM1
    ControlType.Strings = (
      'PEDIDO;CustomEdit;dblcdPedido'
      'THRES;CustomEdit;dbeTHRes'
      'PESOCAB;CustomEdit;dbePesoCab'
      'PESOCABINS;CustomEdit;dbePesoCabIns')
    ValidateWithMask = True
    Left = 106
    Top = 486
  end
  object dsQry2: TwwDataSource
    DataSet = cdsQry2
    Left = 106
    Top = 505
  end
  object cdsQry3: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReporte3'
    RemoteServer = DCOM1
    ControlType.Strings = (
      'PEDIDO;CustomEdit;dblcdPedido'
      'THRES;CustomEdit;dbeTHRes'
      'PESOCAB;CustomEdit;dbePesoCab'
      'PESOCABINS;CustomEdit;dbePesoCabIns')
    ValidateWithMask = True
    Left = 154
    Top = 486
  end
  object dsQry3: TwwDataSource
    DataSet = cdsQry3
    Left = 156
    Top = 505
  end
  object cdsFPago: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvFPago'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 188
    Top = 141
  end
  object dsFPago: TwwDataSource
    DataSet = cdsFPago
    Left = 188
    Top = 156
  end
  object cdsOfDes: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvOfDes'
    RemoteServer = DCOM1
    OnReconcileError = cdsMaestCartasReconcileError
    ValidateWithMask = True
    Left = 457
    Top = 208
  end
  object dsOfDes: TwwDataSource
    DataSet = cdsOfDes
    Left = 457
    Top = 226
  end
  object cdsTipDesemb: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTipDesem'
    RemoteServer = DCOM1
    OnReconcileError = cdsMaestCartasReconcileError
    ValidateWithMask = True
    Left = 657
    Top = 278
  end
  object dsTipDesemb: TwwDataSource
    DataSet = cdsTipDesemb
    Left = 657
    Top = 294
  end
  object cdsCabLiq: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCabLiq'
    RemoteServer = DCOM1
    OnReconcileError = cdsMaestCartasReconcileError
    ValidateWithMask = True
    Left = 483
    Top = 415
  end
  object dsCabLiq: TwwDataSource
    DataSet = cdsCabLiq
    Left = 483
    Top = 432
  end
  object cdsDetLiq: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDetLiq'
    RemoteServer = DCOM1
    OnReconcileError = cdsMaestCartasReconcileError
    ValidateWithMask = True
    Left = 418
    Top = 345
  end
  object dsDetLiq: TwwDataSource
    DataSet = cdsDetLiq
    Left = 418
    Top = 362
  end
  object cdsCreditos: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCreditos'
    RemoteServer = DCOM1
    OnReconcileError = cdsMaestCartasReconcileError
    ValidateWithMask = True
    Left = 795
    Top = 4
  end
  object dsCreditos: TwwDataSource
    DataSet = cdsCreditos
    Left = 795
    Top = 19
  end
  object cdsCuotas: TwwClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ASOID'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CREDID'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CRECUOTA'
        DataType = ftCurrency
      end
      item
        Name = 'CREAMORT'
        DataType = ftCurrency
      end
      item
        Name = 'CREINTERES'
        DataType = ftCurrency
      end
      item
        Name = 'CREFLAT'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'prvCuotas'
    RemoteServer = DCOM1
    StoreDefs = True
    OnReconcileError = cdsMaestCartasReconcileError
    ValidateWithMask = True
    Left = 752
    Top = 141
  end
  object dsCuotas: TwwDataSource
    DataSet = cdsCuotas
    Left = 752
    Top = 156
  end
  object cdsQry4: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCreditos'
    RemoteServer = DCOM1
    ControlType.Strings = (
      'PEDIDO;CustomEdit;dblcdPedido'
      'THRES;CustomEdit;dbeTHRes'
      'PESOCAB;CustomEdit;dbePesoCab'
      'PESOCABINS;CustomEdit;dbePesoCabIns')
    ValidateWithMask = True
    Left = 203
    Top = 486
  end
  object dsQry4: TwwDataSource
    DataSet = cdsQry4
    Left = 203
    Top = 505
  end
  object cdsQry5: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCuotas'
    RemoteServer = DCOM1
    ControlType.Strings = (
      'PEDIDO;CustomEdit;dblcdPedido'
      'THRES;CustomEdit;dbeTHRes'
      'PESOCAB;CustomEdit;dbePesoCab'
      'PESOCABINS;CustomEdit;dbePesoCabIns')
    ValidateWithMask = True
    Left = 250
    Top = 486
  end
  object dsQry5: TwwDataSource
    DataSet = cdsQry5
    Left = 250
    Top = 503
  end
  object cdsQry6: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSolicitud'
    RemoteServer = DCOM1
    ControlType.Strings = (
      'PEDIDO;CustomEdit;dblcdPedido'
      'THRES;CustomEdit;dbeTHRes'
      'PESOCAB;CustomEdit;dbePesoCab'
      'PESOCABINS;CustomEdit;dbePesoCabIns')
    ValidateWithMask = True
    Left = 295
    Top = 486
  end
  object dsQry6: TwwDataSource
    DataSet = cdsQry6
    Left = 295
    Top = 505
  end
  object cdsQry7: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReporte3'
    RemoteServer = DCOM1
    ControlType.Strings = (
      'PEDIDO;CustomEdit;dblcdPedido'
      'THRES;CustomEdit;dbeTHRes'
      'PESOCAB;CustomEdit;dbePesoCab'
      'PESOCABINS;CustomEdit;dbePesoCabIns')
    ValidateWithMask = True
    Left = 342
    Top = 486
  end
  object dsQry7: TwwDataSource
    DataSet = cdsQry7
    Left = 343
    Top = 505
  end
  object cdsQry8: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReporte3'
    RemoteServer = DCOM1
    ControlType.Strings = (
      'PEDIDO;CustomEdit;dblcdPedido'
      'THRES;CustomEdit;dbeTHRes'
      'PESOCAB;CustomEdit;dbePesoCab'
      'PESOCABINS;CustomEdit;dbePesoCabIns')
    ValidateWithMask = True
    Left = 389
    Top = 486
  end
  object dsQry8: TwwDataSource
    DataSet = cdsQry8
    Left = 391
    Top = 505
  end
  object dsQry10: TwwDataSource
    DataSet = cdsQry10
    Left = 491
    Top = 506
  end
  object cdsQry10: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTransacciones'
    RemoteServer = DCOM1
    ControlType.Strings = (
      'PEDIDO;CustomEdit;dblcdPedido'
      'THRES;CustomEdit;dbeTHRes'
      'PESOCAB;CustomEdit;dbePesoCab'
      'PESOCABINS;CustomEdit;dbePesoCabIns')
    ValidateWithMask = True
    Left = 491
    Top = 486
  end
  object cdsAgBco: TwwClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'cdsAgBcoIndex2'
        Fields = 'AGENBCODES'
      end>
    IndexName = 'cdsAgBcoIndex2'
    Params = <>
    ProviderName = 'prvAgenciaBco'
    RemoteServer = DCOM1
    StoreDefs = True
    OnReconcileError = cdsMaestCartasReconcileError
    ValidateWithMask = True
    Left = 97
    Top = 72
  end
  object dsAgBco: TwwDataSource
    DataSet = cdsAgBco
    Left = 97
    Top = 88
  end
  object cdsTransacciones: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTransaccion'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 129
    Top = 208
  end
  object dsTransacciones: TwwDataSource
    DataSet = cdsTransacciones
    Left = 129
    Top = 226
  end
  object cdsQry11: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReporte3'
    RemoteServer = DCOM1
    ControlType.Strings = (
      'PEDIDO;CustomEdit;dblcdPedido'
      'THRES;CustomEdit;dbeTHRes'
      'PESOCAB;CustomEdit;dbePesoCab'
      'PESOCABINS;CustomEdit;dbePesoCabIns')
    ValidateWithMask = True
    Left = 546
    Top = 486
  end
  object dsQry11: TwwDataSource
    DataSet = cdsQry11
    Left = 546
    Top = 505
  end
  object cdsQry1: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvSQL'
    RemoteServer = DCOM1
    ControlType.Strings = (
      'PEDIDO;CustomEdit;dblcdPedido'
      'THRES;CustomEdit;dbeTHRes'
      'PESOCAB;CustomEdit;dbePesoCab'
      'PESOCABINS;CustomEdit;dbePesoCabIns')
    ValidateWithMask = True
    Left = 60
    Top = 486
  end
  object dsQry1: TwwDataSource
    DataSet = cdsQry1
    Left = 61
    Top = 505
  end
  object cdsUse: TwwClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'USEID'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'USENOM'
        DataType = ftString
        Size = 75
      end
      item
        Name = 'USEABRE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'USETELF'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'USEDIR'
        DataType = ftString
        Size = 75
      end
      item
        Name = 'DIRDPTOID'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'DIRPROVID'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'DIRZIPID'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'DEPTOID'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'PROVID'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'ZONAID'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'UPROID'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'UPAGOID'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'TIPUSEID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CCOSID'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'USUARIO'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'FREG'
        DataType = ftDateTime
      end
      item
        Name = 'HREG'
        DataType = ftDateTime
      end
      item
        Name = 'CODANT'
        DataType = ftString
        Size = 9
      end
      item
        Name = 'FLGFUSION'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'prvUse'
    RemoteServer = DCOM1
    StoreDefs = True
    ValidateWithMask = True
    Left = 593
    Top = 278
  end
  object dsUse: TwwDataSource
    DataSet = cdsUse
    Left = 593
    Top = 294
  end
  object cdsQry12: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReporte3'
    RemoteServer = DCOM1
    ControlType.Strings = (
      'PEDIDO;CustomEdit;dblcdPedido'
      'THRES;CustomEdit;dbeTHRes'
      'PESOCAB;CustomEdit;dbePesoCab'
      'PESOCABINS;CustomEdit;dbePesoCabIns')
    ValidateWithMask = True
    Left = 597
    Top = 487
  end
  object dsQry12: TwwDataSource
    DataSet = cdsQry12
    Left = 597
    Top = 503
  end
  object cdsMovFam: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMovFam'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 871
    Top = 278
  end
  object cdsDetCuoLiq: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDetCuoLiq'
    RemoteServer = DCOM1
    OnReconcileError = cdsMaestCartasReconcileError
    ValidateWithMask = True
    Left = 468
    Top = 4
  end
  object dsDetCuoLiq: TwwDataSource
    DataSet = cdsDetCuoLiq
    Left = 468
    Top = 19
  end
  object cdsQry13: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReporte3'
    RemoteServer = DCOM1
    ControlType.Strings = (
      'PEDIDO;CustomEdit;dblcdPedido'
      'THRES;CustomEdit;dbeTHRes'
      'PESOCAB;CustomEdit;dbePesoCab'
      'PESOCABINS;CustomEdit;dbePesoCabIns')
    ValidateWithMask = True
    Left = 653
    Top = 486
  end
  object dsQry13: TwwDataSource
    DataSet = cdsQry13
    Left = 654
    Top = 503
  end
  object cdsReclamos: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspReclamos'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 91
    Top = 345
  end
  object dsReclamos: TwwDataSource
    DataSet = cdsReclamos
    Left = 91
    Top = 362
  end
  object cdsMotivo: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReclMotivo'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 563
    Top = 345
  end
  object dsMotivo: TwwDataSource
    DataSet = cdsMotivo
    Left = 563
    Top = 362
  end
  object cdsPais: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvPais'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 833
    Top = 345
  end
  object dsPais: TwwDataSource
    DataSet = cdsPais
    Left = 835
    Top = 361
  end
  object cdsTAso: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTAso'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 712
    Top = 345
  end
  object dsTAso: TwwDataSource
    DataSet = cdsTAso
    Left = 712
    Top = 362
  end
  object cdsTPension: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvTPension'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 206
    Top = 4
  end
  object dsTPension: TwwDataSource
    DataSet = cdsTPension
    Left = 207
    Top = 19
  end
  object cdsUbigeo: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvUbigeo'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 875
    Top = 140
  end
  object dsUbigeo: TwwDataSource
    DataSet = cdsUbigeo
    Left = 875
    Top = 156
  end
  object cdsCBcos: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCbcos'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 480
    Top = 141
  end
  object dsCBcos: TwwDataSource
    DataSet = cdsCBcos
    Left = 425
    Top = 156
  end
  object cdsProvincia1: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvProvin'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 619
    Top = 141
  end
  object dsProvincia1: TwwDataSource
    DataSet = cdsProvincia1
    Left = 618
    Top = 156
  end
  object cdsAgencias: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAgencias'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 719
    Top = 72
  end
  object cdsQry15: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCuotas'
    RemoteServer = DCOM1
    ControlType.Strings = (
      'PEDIDO;CustomEdit;dblcdPedido'
      'THRES;CustomEdit;dbeTHRes'
      'PESOCAB;CustomEdit;dbePesoCab'
      'PESOCABINS;CustomEdit;dbePesoCabIns')
    ValidateWithMask = True
    Left = 712
    Top = 487
  end
  object dsQry15: TwwDataSource
    DataSet = cdsQry15
    Left = 712
    Top = 503
  end
  object cdsUser: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvUser'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 16
    Top = 558
  end
  object cdsProvincia2: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvProvin'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 235
    Top = 278
  end
  object dsProvincia2: TwwDataSource
    DataSet = cdsProvincia2
    Left = 236
    Top = 294
  end
  object cdsDist2: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDist'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 160
    Top = 415
  end
  object dsDist2: TwwDataSource
    DataSet = cdsDist2
    Left = 161
    Top = 432
  end
  object cdsRepresentante: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvRepresentante'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 34
    Top = 208
  end
  object dsRepresentante: TwwDataSource
    DataSet = cdsRepresentante
    Left = 33
    Top = 226
  end
  object cdsDpto1: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDpto'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 342
    Top = 4
  end
  object dsDpto1: TwwDataSource
    DataSet = cdsDpto1
    Left = 342
    Top = 19
  end
  object cdsEgrCaja: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCuotas'
    RemoteServer = DCOM1
    OnReconcileError = cdsMaestCartasReconcileError
    ValidateWithMask = True
    Left = 93
    Top = 278
  end
  object dsEgrCaja: TwwDataSource
    DataSet = cdsEgrCaja
    Left = 94
    Top = 294
  end
  object cdsBancoEgr: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBancos'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 161
    Top = 278
  end
  object dsBancoEgr: TwwDataSource
    DataSet = cdsBancoEgr
    Left = 162
    Top = 294
  end
  object cdsDocPago: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCuotas'
    RemoteServer = DCOM1
    OnReconcileError = cdsMaestCartasReconcileError
    ControlType.Strings = (
      'TMONID;CustomEdit;dblcMoneda'
      'DETCPAG;CustomEdit;dbeTC'
      'DEMTOLOC;CustomEdit;dbeMPL'
      'DEMTOEXT;CustomEdit;dbeMPE')
    ValidateWithMask = True
    Left = 773
    Top = 345
  end
  object cdsTDiario: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTem1'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 17
    Top = 141
  end
  object dsTDiario: TwwDataSource
    DataSet = cdsTDiario
    Left = 18
    Top = 156
  end
  object cdsQry18: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCuotas'
    RemoteServer = DCOM1
    ControlType.Strings = (
      'PEDIDO;CustomEdit;dblcdPedido'
      'THRES;CustomEdit;dbeTHRes'
      'PESOCAB;CustomEdit;dbePesoCab'
      'PESOCABINS;CustomEdit;dbePesoCabIns')
    ValidateWithMask = True
    Left = 768
    Top = 487
  end
  object dsQry18: TwwDataSource
    DataSet = cdsQry18
    Left = 768
    Top = 503
  end
  object cdsQry19: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCuotas'
    RemoteServer = DCOM1
    ControlType.Strings = (
      'PEDIDO;CustomEdit;dblcdPedido'
      'THRES;CustomEdit;dbeTHRes'
      'PESOCAB;CustomEdit;dbePesoCab'
      'PESOCABINS;CustomEdit;dbePesoCabIns')
    ValidateWithMask = True
    Left = 823
    Top = 486
  end
  object dsQry19: TwwDataSource
    DataSet = cdsQry19
    Left = 823
    Top = 505
  end
  object cdsOficio: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvProvin'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 141
    Top = 4
  end
  object dsOficio: TwwDataSource
    DataSet = cdsOficio
    Left = 141
    Top = 19
  end
  object cdsMovContable: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReclamoCob'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 263
    Top = 141
  end
  object dsMovContable: TwwDataSource
    DataSet = cdsMovContable
    Left = 263
    Top = 156
  end
  object cdsQry20: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReporte'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 879
    Top = 486
  end
  object cdsQry21: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReporte3'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 597
    Top = 558
  end
  object cdsQry22: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCreditos'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 652
    Top = 558
  end
  object cdsQry23: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDetLiq'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 708
    Top = 558
  end
  object cdsQry24: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReporte3'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 766
    Top = 558
  end
  object cdsQry25: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReporte3'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 824
    Top = 558
  end
  object dsQry20: TwwDataSource
    DataSet = cdsQry20
    Left = 879
    Top = 503
  end
  object dsQry21: TwwDataSource
    DataSet = cdsQry21
    Left = 597
    Top = 576
  end
  object dsQry22: TwwDataSource
    DataSet = cdsQry22
    Left = 652
    Top = 576
  end
  object dsQry23: TwwDataSource
    DataSet = cdsQry23
    Left = 707
    Top = 576
  end
  object dsQry24: TwwDataSource
    DataSet = cdsQry24
    Left = 766
    Top = 576
  end
  object dsQry25: TwwDataSource
    DataSet = cdsQry25
    Left = 824
    Top = 576
  end
  object dsCalCre: TDataSource
    DataSet = cdsCalCre
    Left = 306
    Top = 294
  end
  object dsCalCuo: TDataSource
    DataSet = cdsCalCuo
    Left = 731
    Top = 19
  end
  object dsNivApo: TDataSource
    DataSet = cdsNivApo
    Left = 861
    Top = 19
  end
  object dsDevApo: TDataSource
    DataSet = cdsDevApo
    Left = 689
    Top = 156
  end
  object dsDetCalLiq: TDataSource
    DataSet = cdsDetCalLiq
    Left = 1013
    Top = 88
  end
  object dsDetDev: TDataSource
    DataSet = cdsDetDev
    Left = 813
    Top = 157
  end
  object dsDetDes: TDataSource
    DataSet = cdsDetDes
    Left = 295
    Top = 362
  end
  object dsRetJud: TDataSource
    DataSet = cdsRetJud
    Left = 335
    Top = 226
  end
  object dsObs: TDataSource
    DataSet = cdsObs
    Left = 935
    Top = 399
  end
  object cdsCuentas: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCtasBco'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 875
    Top = 208
  end
  object dsCuentas: TwwDataSource
    DataSet = cdsCuentas
    Left = 874
    Top = 226
  end
  object cdsInt: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvInt'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 153
    Top = 72
  end
  object dsCueInd: TDataSource
    DataSet = cdsCueInd
    Left = 571
    Top = 88
  end
  object dsestapo: TDataSource
    DataSet = cdsestapo
    Left = 673
    Top = 19
  end
  object dsDetCalBenRel: TDataSource
    DataSet = cdsDetCalBenRel
    Left = 803
    Top = 432
  end
  object dsForPag: TDataSource
    DataSet = cdsForPag
    Left = 728
    Top = 430
  end
  object dsDetCalLiqMod: TDataSource
    DataSet = cdsDetCalLiqMod
    Left = 637
    Top = 361
  end
  object dsCalLiq: TDataSource
    DataSet = cdsCalLiq
    Left = 788
    Top = 88
  end
  object ExcelApp: TExcelApplication
    AutoConnect = False
    ConnectKind = ckNewInstance
    AutoQuit = False
    Left = 415
    Top = 558
  end
  object ExcelBook: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 355
    Top = 558
  end
  object WS: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 473
    Top = 558
  end
  object dsdetcardes: TDataSource
    DataSet = cdsdetcardes
    Left = 522
    Top = 226
  end
  object dsMovFam: TwwDataSource
    Left = 871
    Top = 294
  end
  object dsincompletos: TDataSource
    DataSet = cdsincompletos
    Left = 744
    Top = 226
  end
  object cdsFonSolCab: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvUbigeo'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 412
    Top = 415
  end
  object dsFonSolCab: TwwDataSource
    DataSet = cdsFonSolCab
    Left = 413
    Top = 432
  end
  object cdsFonSolDet: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCtasBco'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 735
    Top = 277
  end
  object dsFonSolDet: TwwDataSource
    DataSet = cdsFonSolDet
    Left = 734
    Top = 292
  end
  object dsFonSol: TDataSource
    DataSet = cdsFonSol
    Left = 813
    Top = 226
  end
  object cdsSegEstExp: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCtasBco'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 95
    Top = 415
  end
  object dsSegEstExp: TwwDataSource
    DataSet = cdsSegEstExp
    Left = 95
    Top = 432
  end
  object cdsSegSitExp: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCtasBco'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 608
    Top = 415
  end
  object dsSegSitExp: TwwDataSource
    DataSet = cdsSegSitExp
    Left = 608
    Top = 432
  end
  object cdsQry9: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReporte3'
    RemoteServer = DCOM1
    ControlType.Strings = (
      'PEDIDO;CustomEdit;dblcdPedido'
      'THRES;CustomEdit;dbeTHRes'
      'PESOCAB;CustomEdit;dbePesoCab'
      'PESOCABINS;CustomEdit;dbePesoCabIns')
    ValidateWithMask = True
    Left = 439
    Top = 486
  end
  object dsQry9: TwwDataSource
    DataSet = cdsQry9
    Left = 438
    Top = 502
  end
  object dsAgencias: TwwDataSource
    DataSet = cdsAgencias
    Left = 719
    Top = 88
  end
  object dsInt: TwwDataSource
    DataSet = cdsInt
    Left = 152
    Top = 88
  end
  object dsBcos: TwwDataSource
    DataSet = cdsBcos
    Left = 480
    Top = 156
  end
  object dsCuentaEst: TwwDataSource
    DataSet = cdsCuentaEst
    Left = 266
    Top = 224
  end
  object dsDocPago: TwwDataSource
    DataSet = cdsDocPago
    Left = 775
    Top = 361
  end
  object dsUser: TwwDataSource
    DataSet = cdsUser
    Left = 16
    Top = 576
  end
  object DCOM1: TSocketConnection
    ServerGUID = '{1287E975-6B89-4A5D-B21E-CB67719F6434}'
    ServerName = 'SrvAplPre.srvDMPre'
    Left = 18
    Top = 6
  end
  object cdsCueInd: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ANO'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'MES'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'USENOM'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CAPACU'
        DataType = ftFloat
      end
      item
        Name = 'INTERES'
        DataType = ftFloat
      end
      item
        Name = 'BONUS'
        DataType = ftFloat
      end
      item
        Name = 'APORTE'
        DataType = ftFloat
      end
      item
        Name = 'DEVOLUC'
        DataType = ftFloat
      end
      item
        Name = 'TOTACU'
        DataType = ftFloat
      end
      item
        Name = 'APOOFI'
        DataType = ftFloat
      end
      item
        Name = 'DEV'
        DataType = ftFloat
      end
      item
        Name = 'NIV'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 563
    Top = 72
    Data = {
      E70000009619E0BD01000000180000000C000000000003000000E70003414E4F
      0100490000000100055749445448020002001900034D45530100490000000100
      055749445448020002001400065553454E4F4D01004900000001000557494454
      4802000200140006434150414355080004000000000007494E54455245530800
      04000000000005424F4E555308000400000000000641504F5254450800040000
      000000074445564F4C5543080004000000000006544F54414355080004000000
      00000641504F4F46490800040000000000034445560800040000000000034E49
      5608000400000000000000}
  end
  object cdsDetCalLiq: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DESC'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'MONTO'
        DataType = ftFloat
      end
      item
        Name = 'GRABAR'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TIPDES'
        DataType = ftString
        Size = 2
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 1029
    Top = 80
    Data = {
      770000009619E0BD010000001800000004000000000003000000770004444553
      430100490000000100055749445448020002003C00054D4F4E544F0800040000
      0000000647524142415201004900000001000557494454480200020001000654
      495044455301004900000001000557494454480200020002000000}
  end
  object cdsDetDev: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DESC'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'MONTO'
        DataType = ftFloat
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'GRABAR'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 815
    Top = 141
    Data = {
      750000009619E0BD010000001800000004000000000003000000750004444553
      430100490000000100055749445448020002003C00054D4F4E544F0800040000
      000000045449504F010049000000010005574944544802000200010006475241
      42415201004900000001000557494454480200020001000000}
  end
  object cdsDetDes: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DESC'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'MONTO'
        DataType = ftFloat
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CREDID'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'GRABAR'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'SDOACT'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 296
    Top = 347
    Data = {
      9F0000009619E0BD0100000018000000060000000000030000009F0004444553
      430100490000000100055749445448020002005A00054D4F4E544F0800040000
      000000045449504F010049000000010005574944544802000200140006435245
      4449440100490000000100055749445448020002000F00064752414241520100
      4900000001000557494454480200020001000653444F41435408000400000000
      000000}
  end
  object cdsForPag: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DESC'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'MONTO'
        DataType = ftFloat
      end
      item
        Name = 'PORCENTAJE'
        DataType = ftFloat
      end
      item
        Name = 'FORPAGID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'BANCOID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'AGENBCOID'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'PVSLDNIBEN'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'PVSNOMBRE'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'PVSLNCTA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'APENOMTUT'
        DataType = ftString
        Size = 90
      end
      item
        Name = 'DOCIDETUT'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'FECNACMEN'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'GRABAR'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'APEPATCOB'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'APEMATCOB'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NOMCOB'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CODRELCOB'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'APEPATTUT'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'APEMATTUT'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NOMTUT'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DIRDOMCOB'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'CODZIPCOB'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'TELFIJCOB'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'TELMOVCOB'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'APECASCOB'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'EMAILCOB'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MOVCOB'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 711
    Top = 416
    Data = {
      140300009619E0BD01000000180000001B000000000003000000140304444553
      430100490000000100055749445448020002009600054D4F4E544F0800040000
      0000000A504F5243454E54414A45080004000000000008464F52504147494401
      004900000001000557494454480200020002000742414E434F49440100490000
      000100055749445448020002000200094147454E42434F494401004900000001
      000557494454480200020008000A5056534C444E4942454E0100490000000100
      055749445448020002000800095056534E4F4D42524501004900000001000557
      49445448020002005A00085056534C4E43544101004900000001000557494454
      48020002000A00094150454E4F4D545554010049000000010005574944544802
      0002005A0009444F434944455455540100490000000100055749445448020002
      000800094645434E41434D454E0100490000000100055749445448020002000A
      0006475241424152010049000000010005574944544802000200010009415045
      504154434F420100490000000100055749445448020002001E00094150454D41
      54434F420100490000000100055749445448020002001E00064E4F4D434F4201
      00490000000100055749445448020002001E0009434F4452454C434F42010049
      0000000100055749445448020002000200094150455041545455540100490000
      000100055749445448020002001E00094150454D415454555401004900000001
      00055749445448020002001E00064E4F4D545554010049000000010005574944
      5448020002001E0009444952444F4D434F420100490000000100055749445448
      02000200FA0009434F445A4950434F4201004900000001000557494454480200
      020006000954454C46494A434F42010049000000010005574944544802000200
      0F000954454C4D4F56434F420100490000000100055749445448020002000F00
      09415045434153434F420100490000000100055749445448020002001E000845
      4D41494C434F420100490000000100055749445448020002001400064D4F5643
      4F4201004900000001000557494454480200020014000000}
  end
  object cdsRetJud: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DESC'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'MONTO'
        DataType = ftFloat
      end
      item
        Name = 'PORCENTAJE'
        DataType = ftFloat
      end
      item
        Name = 'FORPAGID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'BANCOID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'AGENBCOID'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'PVSLDNIBEN'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'PVSNOMBRE'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'PVSLNCTA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'GRABAR'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 336
    Top = 207
    Data = {
      200100009619E0BD01000000180000000A000000000003000000200104444553
      430100490000000100055749445448020002009600054D4F4E544F0800040000
      0000000A504F5243454E54414A45080004000000000008464F52504147494401
      004900000001000557494454480200020002000742414E434F49440100490000
      000100055749445448020002000200094147454E42434F494401004900000001
      000557494454480200020008000A5056534C444E4942454E0100490000000100
      055749445448020002000800095056534E4F4D42524501004900000001000557
      49445448020002003C00085056534C4E43544101004900000001000557494454
      48020002000A0006475241424152010049000000010005574944544802000200
      01000000}
  end
  object cdsObs: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DESC'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'MONTO'
        DataType = ftFloat
      end
      item
        Name = 'GRABAR'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 926
    Top = 392
    Data = {
      5C0000009619E0BD0100000018000000030000000000030000005C0004444553
      43010049000000010005574944544802000200FA00054D4F4E544F0800040000
      0000000647524142415201004900000001000557494454480200020001000000}
  end
  object cdsestapo: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'APOANO'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'APOMES'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'USENOM'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'APOOFI'
        DataType = ftFloat
      end
      item
        Name = 'APOREC'
        DataType = ftFloat
      end
      item
        Name = 'DEV'
        DataType = ftFloat
      end
      item
        Name = 'NIV'
        DataType = ftFloat
      end
      item
        Name = 'MES'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 672
    Top = 4
    Data = {
      B90000009619E0BD010000001800000008000000000003000000B9000641504F
      414E4F01004900000001000557494454480200020004000641504F4D45530100
      490000000100055749445448020002000200065553454E4F4D01004900000001
      000557494454480200020014000641504F4F464908000400000000000641504F
      5245430800040000000000034445560800040000000000034E49560800040000
      000000034D455301004900000001000557494454480200020014000000}
  end
  object cdsdetcardes: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'APEPAT'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'APEMAT'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'APENOM'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'TIPREL'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'FECNAC'
        DataType = ftDate
      end
      item
        Name = 'SEXO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DNI'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'PORC'
        DataType = ftFloat
      end
      item
        Name = 'APEPATTUT'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'APEMATTUT'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NOMTUT'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DNITUT'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'FORPAGID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'BANCOID'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'AGEBCOID'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'DSGDIRDES'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'DSGZIPIDDES'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DSGTELFIJDES'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'DSGTELMOVDES'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DSGOTRTIPREL'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'PARENDES'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'APECAS'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'EMAILDES'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'MENEDAD'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 523
    Top = 210
    Data = {
      AD0200009619E0BD010000001800000018000000000003000000AD0206415045
      5041540100490000000100055749445448020002001E00064150454D41540100
      490000000100055749445448020002001E00064150454E4F4D01004900000001
      00055749445448020002001E000654495052454C010049000000010005574944
      5448020002000200064645434E41430400060000000000045345584F01004900
      0000010005574944544802000200010003444E49010049000000010005574944
      544802000200080004504F524308000400000000000941504550415454555401
      00490000000100055749445448020002001400094150454D4154545554010049
      0000000100055749445448020002001400064E4F4D5455540100490000000100
      05574944544802000200140006444E4954555401004900000001000557494454
      4802000200080008464F52504147494401004900000001000557494454480200
      020002000742414E434F49440100490000000100055749445448020002000200
      0841474542434F49440100490000000100055749445448020002000800094453
      47444952444553010049000000010005574944544802000200FA000B4453475A
      4950494444455301004900000001000557494454480200020014000C44534754
      454C46494A4445530100490000000100055749445448020002000F000C445347
      54454C4D4F5644455301004900000001000557494454480200020014000C4453
      474F545254495052454C0100490000000100055749445448020002000F000850
      4152454E4445530100490000000100055749445448020002001E000641504543
      41530100490000000100055749445448020002001E0008454D41494C44455301
      00490000000100055749445448020002003C00074D454E454441440100490000
      0001000557494454480200020001000000}
  end
  object cdssinresolver: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'OBSERVACION'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'FECHA'
        DataType = ftDate
      end
      item
        Name = 'PROCEDENCIA'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 665
    Top = 211
    Data = {
      680000009619E0BD01000000180000000300000000000300000068000B4F4253
      4552564143494F4E010049000000010005574944544802000200320005464543
      484104000600000000000B50524F434544454E43494101004900000001000557
      494454480200020014000000}
  end
  object dssinresolver: TDataSource
    DataSet = cdssinresolver
    Left = 663
    Top = 226
  end
  object cdsCalCuo: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ASOID'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CREDID'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'CRECUOTA'
        DataType = ftFloat
      end
      item
        Name = 'CREAMORT'
        DataType = ftFloat
      end
      item
        Name = 'CREINTERES'
        DataType = ftFloat
      end
      item
        Name = 'CREFLAT'
        DataType = ftFloat
      end
      item
        Name = 'INTNCOB'
        DataType = ftFloat
      end
      item
        Name = 'GRABAR'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CREMTO'
        DataType = ftFloat
      end
      item
        Name = 'CREESTID'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'MONCOBDESGRAV'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 731
    Top = 4
    Data = {
      010100009619E0BD01000000180000000B00000000000300000001010541534F
      4944010049000000010005574944544802000200140006435245444944010049
      0000000100055749445448020002001E000843524543554F5441080004000000
      000008435245414D4F525408000400000000000A435245494E54455245530800
      04000000000007435245464C4154080004000000000007494E544E434F420800
      0400000000000647524142415201004900000001000557494454480200020001
      00064352454D544F080004000000000008435245455354494401004900000001
      000557494454480200020001000D4D4F4E434F42444553475241560800040000
      0000000000}
  end
  object cdsNivApo: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ASOID'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TRANSANO'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'TRANSMES'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ESTADO'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'MONTO'
        DataType = ftFloat
      end
      item
        Name = 'CASO'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'GRABAR'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'FILA'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 860
    Top = 3
    Data = {
      E40000009619E0BD010000001800000008000000000003000000E4000541534F
      49440100490000000100055749445448020002000A00085452414E53414E4F01
      00490000000100055749445448020002000400085452414E534D455301004900
      000001000557494454480200020002000645535441444F010049000000010005
      5749445448020002000300054D4F4E544F0800040000000000044341534F0100
      4900000001000557494454480200020002000647524142415201004900000001
      000557494454480200020001000446494C410100490000000100055749445448
      0200020014000000}
  end
  object cdsCalLiq: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DESC'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'MONTO'
        DataType = ftFloat
      end
      item
        Name = 'GRABAR'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TIPDES'
        DataType = ftString
        Size = 2
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 788
    Top = 73
    Data = {
      770000009619E0BD010000001800000004000000000003000000770004444553
      430100490000000100055749445448020002003C00054D4F4E544F0800040000
      0000000647524142415201004900000001000557494454480200020001000654
      495044455301004900000001000557494454480200020002000000}
  end
  object cdsDevApo: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ASOID'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'TRANSANO'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'TRANSMES'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ESTADO'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'MONTO'
        DataType = ftFloat
      end
      item
        Name = 'CASO'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'GRABAR'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'FILA'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <
      item
        Name = 'cdsDevolucionesIndex1'
        Fields = 'TRANSANO'
      end
      item
        Name = 'cdsDevolucionesIndex2'
        Fields = 'TRANSMES'
      end>
    Params = <>
    StoreDefs = True
    Left = 689
    Top = 141
    Data = {
      E40000009619E0BD010000001800000008000000000003000000E4000541534F
      49440100490000000100055749445448020002000A00085452414E53414E4F01
      00490000000100055749445448020002000400085452414E534D455301004900
      000001000557494454480200020002000645535441444F010049000000010005
      5749445448020002000300054D4F4E544F0800040000000000044341534F0100
      4900000001000557494454480200020002000647524142415201004900000001
      000557494454480200020001000446494C410100490000000100055749445448
      0200020014000000}
  end
  object cdsincompletos: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 743
    Top = 210
    Data = {
      3A0000009619E0BD0100000018000000010000000000030000003A000B444553
      4352495043494F4E01004900000001000557494454480200020032000000}
  end
  object cdsFonSol: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NUM_DEU'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'NRO_REF_FSC'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FEC_APL_FSC'
        DataType = ftDate
      end
      item
        Name = 'IMP_COB_FSC'
        DataType = ftCurrency
      end
      item
        Name = 'IMP_SAL_FSC'
        DataType = ftCurrency
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 814
    Top = 212
    Data = {
      BA0000009619E0BD010000001800000005000000000003000000BA00074E554D
      5F4445550100490000000100055749445448020002000B000B4E524F5F524546
      5F46534301004900000001000557494454480200020014000B4645435F41504C
      5F46534304000600000000000B494D505F434F425F4653430800040000000100
      07535542545950450200490006004D6F6E6579000B494D505F53414C5F465343
      080004000000010007535542545950450200490006004D6F6E6579000000}
  end
  object cdsCalCre: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ASOID'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CREDID'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CREFOTORG'
        DataType = ftDate
      end
      item
        Name = 'TIPCREID'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CREMTOOTOR'
        DataType = ftFloat
      end
      item
        Name = 'CRESDOACT'
        DataType = ftFloat
      end
      item
        Name = 'CREMTODES'
        DataType = ftFloat
      end
      item
        Name = 'TIPCREDES'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'GRABAR'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 308
    Top = 278
    Data = {
      EE0000009619E0BD010000001800000009000000000003000000EE000541534F
      4944010049000000010005574944544802000200140006435245444944010049
      000000010005574944544802000200140009435245464F544F52470400060000
      0000000854495043524549440100490000000100055749445448020002001400
      0A4352454D544F4F544F5208000400000000000943524553444F414354080004
      0000000000094352454D544F4445530800040000000000095449504352454445
      5301004900000001000557494454480200020014000647524142415201004900
      000001000557494454480200020001000000}
  end
  object cdsDetCalLiqMod: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DESC'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'MONTO'
        DataType = ftFloat
      end
      item
        Name = 'GRABAR'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TIPDES'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 637
    Top = 345
    Data = {
      770000009619E0BD010000001800000004000000000003000000770004444553
      430100490000000100055749445448020002003C00054D4F4E544F0800040000
      0000000647524142415201004900000001000557494454480200020001000654
      495044455301004900000001000557494454480200020001000000}
  end
  object cdsDetCalBenRel: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DESC'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'MONTO'
        DataType = ftFloat
      end
      item
        Name = 'GRABAR'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TIPDES'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 803
    Top = 416
    Data = {
      770000009619E0BD010000001800000004000000000003000000770004444553
      430100490000000100055749445448020002003C00054D4F4E544F0800040000
      0000000647524142415201004900000001000557494454480200020001000654
      495044455301004900000001000557494454480200020001000000}
  end
  object dsCreCCI: TDataSource
    Left = 532
    Top = 575
  end
  object cdsCreCCI: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CODAPLICA'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'CREDID'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'PERAPL'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FECREG'
        DataType = ftDate
      end
      item
        Name = 'MONAPL'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 533
    Top = 556
    Data = {
      8C0000009619E0BD0100000018000000050000000000030000008C0009434F44
      41504C4943410100490000000100055749445448020002000F00064352454449
      440100490000000100055749445448020002000F000650455241504C01004900
      0000010005574944544802000200140006464543524547040006000000000006
      4D4F4E41504C08000400000000000000}
  end
  object cdsQry26: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReporte3'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 879
    Top = 558
  end
  object dsQry26: TwwDataSource
    DataSet = cdsQry26
    Left = 879
    Top = 576
  end
  object cdsMovCnt1: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCreditos'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 947
    Top = 492
  end
  object dsMovCnt1: TwwDataSource
    DataSet = cdsMovCnt1
    Left = 947
    Top = 505
  end
  object cdsQry27: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReporte3'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 959
    Top = 558
  end
  object dsQry27: TwwDataSource
    DataSet = cdsQry27
    Left = 959
    Top = 576
  end
  object cdsRepCCIDet: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReporte3'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 948
    Top = 208
  end
  object dsRepCCIDet: TwwDataSource
    DataSet = cdsRepCCIDet
    Left = 964
    Top = 217
  end
  object cdsRepCCI: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReporte3'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 970
    Top = 295
  end
  object dsRepCCI: TwwDataSource
    DataSet = cdsRepCCI
    Left = 986
    Top = 304
  end
  object cdsReporte1: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvReporte3'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 16
    Top = 415
  end
  object dsReporte1: TwwDataSource
    DataSet = cdsReporte1
    Left = 16
    Top = 432
  end
  object cdsParam: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvCuotas'
    RemoteServer = DCOM1
    PictureMasks.Strings = (
      'PAPOVENC'#9'[*2[#]]'#9'T'#9'F'
      'PFINTMOR'#9'{S,N}'#9'T'#9'F'
      'PFINCOMP'#9'{S,N}'#9'T'#9'F')
    ValidateWithMask = True
    Left = 989
    Top = 386
  end
  object dsParam: TwwDataSource
    DataSet = cdsParam
    Left = 989
    Top = 400
  end
  object cdsDptooriexp: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvDpto'
    RemoteServer = DCOM1
    ValidateWithMask = True
    Left = 1052
    Top = 244
  end
  object dsDptooriexp: TwwDataSource
    DataSet = cdsDptooriexp
    Left = 1053
    Top = 259
  end
end
