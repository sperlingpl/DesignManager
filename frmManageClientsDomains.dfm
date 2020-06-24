object ManageClientsDomainsForm: TManageClientsDomainsForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'ManageClientsDomainsForm'
  ClientHeight = 318
  ClientWidth = 321
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnAdd: TButton
    Left = 231
    Top = 22
    Width = 75
    Height = 25
    Caption = 'Dodaj'
    TabOrder = 0
  end
  object btnDelete: TButton
    Left = 231
    Top = 53
    Width = 75
    Height = 25
    Caption = 'Usu'#324
    Enabled = False
    TabOrder = 1
  end
  object btnClose: TButton
    Left = 231
    Top = 279
    Width = 75
    Height = 25
    Caption = 'Zamknij'
    TabOrder = 2
    OnClick = btnCloseClick
  end
  object edtName: TEdit
    Left = 16
    Top = 24
    Width = 209
    Height = 21
    TabOrder = 3
  end
  object lstDomains: TRzEditListBox
    Left = 16
    Top = 51
    Width = 209
    Height = 253
    ItemHeight = 13
    TabOrder = 4
    OnDblClick = lstDomainsDblClick
    OnItemChanged = lstDomainsItemChanged
  end
  object btnEdit: TButton
    Left = 231
    Top = 84
    Width = 75
    Height = 25
    Caption = 'Edytuj'
    Enabled = False
    TabOrder = 5
    OnClick = btnEditClick
  end
  object FDQuery1: TFDQuery
    Connection = MainDataModule.MainFDConnection
    SQL.Strings = (
      'SELECT * FROM ClientDomains')
    Left = 232
    Top = 184
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 272
    Top = 184
  end
end
