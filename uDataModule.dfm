object MainDataModule: TMainDataModule
  OldCreateOrder = False
  Height = 150
  Width = 215
  object MainFDConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=DesignStore'
      
        'Database=C:\Users\pawel\Documents\Delphi\DesignStore\Win64\Debug' +
        '\data.ddb'
      'StringFormat=Unicode')
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 40
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 80
    Top = 40
  end
end
