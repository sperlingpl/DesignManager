object MainDataModule: TMainDataModule
  OldCreateOrder = False
  Height = 150
  Width = 215
  object MainFDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\pawel\Documents\Delphi\DesignManager\Win64\Deb' +
        'ug\data.ddb'
      'StringFormat=Unicode'
      'ConnectionDef=DesignStore')
    LoginPrompt = False
    Left = 32
    Top = 40
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 80
    Top = 40
  end
end
