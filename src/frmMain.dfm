object MainForm: TMainForm
  Left = 347
  Top = 318
  Caption = 'MainForm'
  ClientHeight = 525
  ClientWidth = 810
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  GlassFrame.Left = -1
  GlassFrame.Top = -1
  GlassFrame.Right = -1
  GlassFrame.Bottom = -1
  GlassFrame.SheetOfGlass = True
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object spltvwMain: TSplitView
    Left = 0
    Top = 0
    Width = 200
    Height = 525
    OpenedWidth = 200
    Placement = svpLeft
    TabOrder = 0
    object ctgrybtns1: TCategoryButtons
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 194
      Height = 519
      Align = alClient
      BorderStyle = bsNone
      ButtonFlow = cbfVertical
      ButtonHeight = 34
      ButtonOptions = [boFullSize, boGradientFill, boShowCaptions]
      Categories = <
        item
          Caption = 'G'#322#243'wne'
          Color = 16771818
          Collapsed = False
          Items = <
            item
              Caption = 'Projekty'
              OnClick = ctgrybtns1Categories0Items0Click
            end
            item
              Caption = 'Klienci'
              OnClick = ctgrybtns1Categories0Items1Click
            end>
        end
        item
          Caption = 'Opcje'
          Color = 15466474
          Collapsed = False
          Items = <
            item
              Caption = 'Obszary dzia'#322'alno'#347'ci klient'#243'w'
              OnClick = ctgrybtns1Categories1Items0Click
            end>
        end>
      RegularButtonColor = clWhite
      SelectedButtonColor = 15132390
      TabOrder = 0
    end
  end
  object jvpglst1: TJvPageList
    Left = 200
    Top = 0
    Width = 610
    Height = 525
    ActivePage = jvstndrdpgProjects
    PropagateEnable = False
    Align = alClient
    object jvstndrdpgProjects: TJvStandardPage
      Left = 0
      Top = 0
      Width = 610
      Height = 525
      Caption = 'jvstndrdpgProjects'
      DesignSize = (
        610
        525)
      object Button1: TButton
        Left = 6
        Top = 14
        Width = 130
        Height = 25
        Caption = 'Nowy projekt'
        TabOrder = 0
        OnClick = Button1Click
      end
      object ProjectsCompletionFilterComboBox: TComboBox
        Left = 440
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
        Left = 6
        Top = 240
        Width = 595
        Height = 273
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
        Left = 257
        Top = 16
        Width = 177
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 3
        TextHint = 'Szukaj...'
      end
      object CalendarView1: TCalendarView
        Left = 6
        Top = 45
        Width = 211
        Height = 189
        BorderStyle = bsNone
        Date = 44008.000000000000000000
        FirstDayOfWeek = dwMonday
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        HeaderInfo.DaysOfWeekFont.Charset = DEFAULT_CHARSET
        HeaderInfo.DaysOfWeekFont.Color = clWindowText
        HeaderInfo.DaysOfWeekFont.Height = -13
        HeaderInfo.DaysOfWeekFont.Name = 'Segoe UI'
        HeaderInfo.DaysOfWeekFont.Style = []
        HeaderInfo.Font.Charset = DEFAULT_CHARSET
        HeaderInfo.Font.Color = clWindowText
        HeaderInfo.Font.Height = -16
        HeaderInfo.Font.Name = 'Segoe UI'
        HeaderInfo.Font.Style = []
        OnDrawDayItem = CalendarView1DrawDayItem
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 4
      end
    end
    object jvstndrdpgClients: TJvStandardPage
      Left = 0
      Top = 0
      Width = 610
      Height = 525
      Caption = 'jvstndrdpgClients'
      DesignSize = (
        610
        525)
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 242
        Top = 16
        Width = 145
        Height = 21
        DataField = 'name'
        KeyField = 'name'
        ListSource = ClientDomainsDataSource
        TabOrder = 0
      end
      object AddClientButton: TButton
        Left = 6
        Top = 14
        Width = 130
        Height = 25
        Caption = 'Dodaj klienta'
        TabOrder = 1
        OnClick = AddClientButtonClick
      end
      object ClientsListView: TListView
        Left = 6
        Top = 45
        Width = 595
        Height = 477
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
        TabOrder = 2
        ViewStyle = vsReport
        OnDblClick = ClientsListViewDblClick
      end
      object Edit1: TEdit
        Left = 424
        Top = 16
        Width = 177
        Height = 21
        Anchors = [akTop, akRight]
        TabOrder = 3
        TextHint = 'Szukaj...'
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
