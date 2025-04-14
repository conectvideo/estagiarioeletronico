object Dm: TDm
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object FDConnection2: TFDConnection
    Params.Strings = (
      'Database= /opt/firebird/databases/condominio.fdb'
      'User_Name=SYSDBA'
      'Password=Masterkey'
      'Protocol=TCPIP'
      'Server=192.168.15.99'
      'Port=3050'
      'DriverID=FB')
    LoginPrompt = False
    Left = 32
    Top = 32
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'C:\Program Files (x86)\Firebird\Firebird_5_0\fbclient.dll'
    Left = 184
    Top = 32
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection2
    SQL.Strings = (
      'select * from condominios')
    Left = 48
    Top = 120
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 168
    Top = 128
  end
end
