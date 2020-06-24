object ManageClientsDomainsDM: TManageClientsDomainsDM
  OldCreateOrder = False
  Height = 195
  Width = 315
  object ds1: TDataSource
    DataSet = fdqry1
    Left = 80
    Top = 43
  end
  object fdqry1: TFDQuery
    Connection = MainDataModule.MainFDConnection
    SQL.Strings = (
      'SELECT * FROM ClientDomains')
    Left = 40
    Top = 43
  end
end
