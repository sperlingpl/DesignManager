object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 525
  ClientWidth = 810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 810
    Height = 525
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Projekty'
      DesignSize = (
        802
        497)
      object Button1: TButton
        Left = 17
        Top = 14
        Width = 130
        Height = 25
        Caption = 'Nowy projekt'
        TabOrder = 0
        OnClick = Button1Click
      end
      object ProjectsCompletionFilterComboBox: TComboBox
        Left = 449
        Top = 16
        Width = 153
        Height = 21
        Style = csDropDownList
        Anchors = [akTop, akRight]
        ItemIndex = 0
        TabOrder = 1
        Text = 'Aktualne'
        OnChange = ProjectsCompletionFilterComboBoxChange
        Items.Strings = (
          'Aktualne'
          'Zako'#324'czone'
          'Wszystkie')
      end
      object ProjectsListView: TListView
        Left = 17
        Top = 80
        Width = 768
        Height = 401
        Anchors = [akLeft, akTop, akRight, akBottom]
        Columns = <
          item
            Caption = 'id'
            Width = 0
          end
          item
            Caption = 'Klient'
            Width = 200
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
            Caption = 'Opis'
            Width = 250
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 2
        ViewStyle = vsReport
        OnDblClick = ProjectsListViewDblClick
      end
      object Edit2: TEdit
        Left = 608
        Top = 16
        Width = 177
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 3
        TextHint = 'Szukaj...'
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Klienci'
      ImageIndex = 1
      DesignSize = (
        802
        497)
      object Edit1: TEdit
        Left = 608
        Top = 16
        Width = 177
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 0
        TextHint = 'Szukaj...'
      end
      object ClientsListView: TListView
        Left = 16
        Top = 80
        Width = 769
        Height = 401
        Anchors = [akLeft, akTop, akRight, akBottom]
        Columns = <
          item
            Width = 0
          end
          item
            Caption = 'Nazwa'
            Width = 300
          end
          item
            Caption = 'Opis'
            Width = 300
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 1
        ViewStyle = vsReport
        OnDblClick = ClientsListViewDblClick
      end
      object AddClientButton: TButton
        Left = 16
        Top = 14
        Width = 130
        Height = 25
        Caption = 'Dodaj klienta'
        TabOrder = 2
        OnClick = AddClientButtonClick
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 457
        Top = 16
        Width = 145
        Height = 21
        DataField = 'name'
        KeyField = 'name'
        ListSource = ClientDomainsDataSource
        TabOrder = 3
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 48
    Top = 481
    object Plik1: TMenuItem
      Caption = 'Plik'
      object ExitMenuItem: TMenuItem
        Caption = 'Zako'#324'cz'
        OnClick = ExitMenuItemClick
      end
    end
    object Dane1: TMenuItem
      Caption = 'Dane'
      object Klienci1: TMenuItem
        Caption = 'Klienci'
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
    Left = 144
    Top = 449
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 80
    Top = 449
  end
  object ClientsDataSource: TDataSource
    DataSet = ClientsFDQuery
    Left = 48
    Top = 449
  end
  object ClientsFDQuery: TFDQuery
    Connection = MainDataModule.MainFDConnection
    SQL.Strings = (
      'SELECT * FROM Clients')
    Left = 16
    Top = 481
  end
  object ClientDomainsFDQuery: TFDQuery
    Connection = MainDataModule.MainFDConnection
    SQL.Strings = (
      'SELECT * FROM ClientDomains')
    Left = 112
    Top = 449
  end
  object ClientDomainsDataSource: TDataSource
    DataSet = ClientDomainsFDQuery
    Left = 16
    Top = 449
  end
end
