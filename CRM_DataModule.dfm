object Dm: TDm
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object FDConnection2: TFDConnection
    Params.Strings = (
      'Database=C:\FONTES\admcondominios\banco\CONDOMINIOS.FDB'
      'User_Name=SYSDBA'
      'Password=Masterkey'
      'Protocol=TCPIP'
      'Server=localhost'
      'Port=3050'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 33
    Top = 33
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'C:\Program Files (x86)\Firebird\Firebird_5_0\fbclient.dll'
    Left = 184
    Top = 33
  end
  object qryCondominios: TFDQuery
    Connection = FDConnection2
    SQL.Strings = (
      'select * from condominios')
    Left = 48
    Top = 120
  end
  object DataSource1: TDataSource
    DataSet = qryCondominios
    Left = 168
    Top = 128
  end
  object qryCondonimos: TFDQuery
    Connection = FDConnection2
    SQL.Strings = (
      'select * from moradores')
    Left = 32
    Top = 256
  end
  object DSMoradores: TDataSource
    DataSet = qryCondonimos
    Left = 184
    Top = 256
  end
end
