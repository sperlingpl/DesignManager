object ClientDetailsForm: TClientDetailsForm
  Left = 0
  Top = 0
  Hint = 'Align Left|Aligns text at the left indent'
  Caption = 'Align &Left'
  ClientHeight = 598
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
    598)
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
    Top = 128
    Width = 21
    Height = 13
    Caption = 'Opis'
  end
  object Label3: TLabel
    Left = 16
    Top = 73
    Width = 91
    Height = 13
    Caption = 'Obszar dzia'#322'alno'#347'ci'
  end
  object SaveButton: TButton
    Left = 420
    Top = 557
    Width = 97
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Zapisz'
    TabOrder = 0
    OnClick = SaveButtonClick
  end
  object CancelButton: TButton
    Left = 523
    Top = 557
    Width = 103
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Anuluj'
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  object EditClientGroupButton: TButton
    Left = 238
    Top = 90
    Width = 95
    Height = 25
    Caption = 'Zarz'#261'dzaj'
    TabOrder = 2
    OnClick = EditClientGroupButtonClick
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 17
    Top = 92
    Width = 215
    Height = 21
    KeyField = 'domain'
    ListField = 'domainName'
    TabOrder = 3
  end
  inline TextEditorFrame1: TTextEditorFrame
    Left = 16
    Top = 152
    Width = 609
    Height = 385
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
    ExplicitLeft = 16
    ExplicitTop = 152
    ExplicitWidth = 609
    ExplicitHeight = 385
    inherited JvRichEdit1: TJvRichEdit
      Width = 609
      Height = 328
      ExplicitWidth = 609
      ExplicitHeight = 328
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
    TabOrder = 5
    Text = 'edtName'
  end
end
