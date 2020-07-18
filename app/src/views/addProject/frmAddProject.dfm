object AddProjectForm: TAddProjectForm
  Left = 0
  Top = 0
  Caption = 'Nowy projekt'
  ClientHeight = 433
  ClientWidth = 378
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    378
    433)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 141
    Width = 84
    Height = 13
    Caption = 'Data zako'#324'czenia'
  end
  object Label2: TLabel
    Left = 24
    Top = 85
    Width = 26
    Height = 13
    Caption = 'Klient'
  end
  object Label3: TLabel
    Left = 24
    Top = 200
    Width = 21
    Height = 13
    Caption = 'Opis'
  end
  object Button1: TButton
    Left = 248
    Top = 391
    Width = 105
    Height = 26
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Anuluj'
    ModalResult = 2
    TabOrder = 0
  end
  object AddButton: TButton
    Left = 144
    Top = 392
    Width = 98
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Dodaj'
    TabOrder = 1
  end
  object LabeledEdit1: TLabeledEdit
    Left = 24
    Top = 48
    Width = 329
    Height = 21
    EditLabel.Width = 75
    EditLabel.Height = 13
    EditLabel.Caption = 'Nazwa projektu'
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
  end
  object DateTimePicker1: TDateTimePicker
    Left = 24
    Top = 160
    Width = 153
    Height = 21
    Date = 43996.000000000000000000
    Time = 0.372535636575776200
    TabOrder = 3
  end
  object ComboBoxEx1: TComboBoxEx
    Left = 24
    Top = 104
    Width = 329
    Height = 22
    AutoCompleteOptions = [acoAutoSuggest, acoAutoAppend, acoSearch, acoUpDownKeyDropsList]
    ItemsEx = <
      item
        Caption = 'sdfewf'
      end
      item
        Caption = 'gwgw'
      end
      item
        Caption = 'aneta'
      end
      item
        Caption = 'pawel'
      end>
    TabOrder = 4
    Text = 'ComboBoxEx1'
  end
  object Memo1: TMemo
    Left = 24
    Top = 219
    Width = 329
    Height = 142
    Hint = '(Opcjonalne)'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
end
