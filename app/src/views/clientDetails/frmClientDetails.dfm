object ClientDetailsForm: TClientDetailsForm
  Left = 0
  Top = 0
  Hint = 'Align Left|Aligns text at the left indent'
  Caption = 'Align &Left'
  ClientHeight = 612
  ClientWidth = 642
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
  OnShow = FormShow
  DesignSize = (
    642
    612)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 32
    Height = 13
    Caption = 'Nazwa'
  end
  object Label2: TLabel
    Left = 17
    Top = 133
    Width = 21
    Height = 13
    Caption = 'Opis'
  end
  object Label3: TLabel
    Left = 17
    Top = 81
    Width = 91
    Height = 13
    Caption = 'Obszar dzia'#322'alno'#347'ci'
  end
  object lblNameError: TLabel
    Left = 17
    Top = 62
    Width = 61
    Height = 13
    Caption = 'lblNameError'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object SaveButton: TButton
    Left = 420
    Top = 571
    Width = 97
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Zapisz'
    TabOrder = 4
    OnClick = SaveButtonClick
  end
  object CancelButton: TButton
    Left = 523
    Top = 571
    Width = 103
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Anuluj'
    TabOrder = 5
    OnClick = CancelButtonClick
  end
  object EditClientGroupButton: TButton
    Left = 238
    Top = 99
    Width = 95
    Height = 25
    Caption = 'Zarz'#261'dzaj'
    TabOrder = 2
    OnClick = EditClientGroupButtonClick
  end
  inline TextEditorFrame1: TTextEditorFrame
    Left = 16
    Top = 152
    Width = 609
    Height = 399
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 3
    ExplicitLeft = 16
    ExplicitTop = 152
    ExplicitWidth = 609
    ExplicitHeight = 399
    inherited JvRichEdit1: TJvRichEdit
      Width = 609
      Height = 342
      TabOrder = 1
      ExplicitWidth = 609
      ExplicitHeight = 342
    end
    inherited CoolBar1: TCoolBar
      Width = 609
      Bands = <
        item
          Control = TextEditorFrame1.ToolBar1
          ImageIndex = -1
          Width = 603
        end
        item
          Control = TextEditorFrame1.ToolBar2
          ImageIndex = -1
          Width = 603
        end>
      ExplicitWidth = 609
      inherited ToolBar2: TToolBar [0]
        Width = 594
        ExplicitWidth = 594
      end
      inherited ToolBar1: TToolBar [1]
        Width = 594
        ExplicitWidth = 594
      end
    end
  end
  object edtName: TEdit
    Left = 17
    Top = 35
    Width = 608
    Height = 21
    TabOrder = 0
    Text = 'edtName'
    OnChange = edtNameChange
  end
  object cbbClientsDomains: TComboBox
    Left = 17
    Top = 100
    Width = 215
    Height = 21
    TabOrder = 1
  end
end
