object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 568
  ClientWidth = 790
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnShow = FormShow
  DesignSize = (
    790
    568)
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 547
    Height = 528
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = 'Projekty'
    TabOrder = 0
    DesignSize = (
      547
      528)
    object ProjectsListView: TListView
      Left = 16
      Top = 72
      Width = 514
      Height = 440
      Anchors = [akLeft, akTop, akRight, akBottom]
      Columns = <
        item
          Caption = 'id'
          Width = 0
        end
        item
          Caption = 'Nazwa'
          Width = 150
        end
        item
          Caption = 'Termin'
          Width = 100
        end
        item
          Caption = 'Klient'
          Width = 150
        end
        item
          Caption = 'Opis'
          Width = 250
        end>
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnDblClick = ProjectsListViewDblClick
    end
    object ProjectsCompletionFilterComboBox: TComboBox
      Left = 16
      Top = 32
      Width = 153
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 1
      Text = 'Aktualne'
      OnChange = ProjectsCompletionFilterComboBoxChange
      Items.Strings = (
        'Aktualne'
        'Zako'#324'czone'
        'Wszystkie')
    end
    object Button1: TButton
      Left = 376
      Top = 31
      Width = 154
      Height = 23
      Caption = 'Nowy projekt'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object MainMenu1: TMainMenu
    Left = 664
    Top = 24
    object Plik1: TMenuItem
      Caption = 'Plik'
      object ExitMenuItem: TMenuItem
        Caption = 'Zako'#324'cz'
        OnClick = ExitMenuItemClick
      end
    end
    object Pomoc1: TMenuItem
      Caption = 'Pomoc'
      object AboutMenuItem: TMenuItem
        Caption = 'O programie...'
        OnClick = AboutMenuItemClick
      end
    end
  end
  object FDQuery1: TFDQuery
    Connection = MainDataModule.MainFDConnection
    SQL.Strings = (
      
        'SELECT Projects.id, Projects.name, Projects.description, Project' +
        's.deadlineDate, Clients.name as clientName'
      'FROM Projects, Clients'
      'WHERE Clients.id = Projects.clientId AND Projects.completed = 0')
    Left = 744
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 704
    Top = 24
  end
end
