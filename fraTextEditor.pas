unit fraTextEditor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtActns, System.Actions, Vcl.ActnList, Vcl.StdActns, Vcl.ComCtrls,
  System.ImageList, Vcl.ImgList, Vcl.ToolWin, Vcl.StdCtrls, Vcl.VirtualImageList,
  Vcl.BaseImageCollection, Vcl.ImageCollection, JvExStdCtrls, JvRichEdit,
  JvExComCtrls, JvToolBar, JvActionsEngine, JvControlActions, JvStdEditActions,
  JvXPCore, JvXPButtons, JvExControls, JvNavigationPane, JvCombobox,
  JvColorCombo, ovccmbx, ovcftcbx, RzCmboBx, Vcl.Samples.Spin, ShellApi;

type
  TTextEditorFrame = class(TFrame)
    ImageList1: TImageList;
    JvRichEdit1: TJvRichEdit;
    JvControlActionList1: TJvControlActionList;
    JvEditCut1: TJvEditCut;
    JvEditCopy1: TJvEditCopy;
    JvEditPaste1: TJvEditPaste;
    JvEditSelectAll1: TJvEditSelectAll;
    JvEditUndo1: TJvEditUndo;
    JvEditDelete1: TJvEditDelete;
    FormatRichEditBold1: TRichEditBold;
    FormatRichEditItalic1: TRichEditItalic;
    FormatRichEditUnderline1: TRichEditUnderline;
    FormatRichEditStrikeOut1: TRichEditStrikeOut;
    FormatRichEditBullets1: TRichEditBullets;
    FormatRichEditAlignLeft1: TRichEditAlignLeft;
    FormatRichEditAlignRight1: TRichEditAlignRight;
    FormatRichEditAlignCenter1: TRichEditAlignCenter;
    ToolBar1: TToolBar;
    JvFontComboBox1: TJvFontComboBox;
    FontSizeSpinEdit: TSpinEdit;
    CoolBar1: TCoolBar;
    ToolBar2: TToolBar;
    AlignLeftButton: TToolButton;
    AlignCenterButton: TToolButton;
    AlignRightButton: TToolButton;
    ToolButton4: TToolButton;
    BoldButton: TToolButton;
    ItalicButton: TToolButton;
    UnderlineButton: TToolButton;
    StrikeoutButton: TToolButton;
    ToolButton9: TToolButton;
    UndoButton: TToolButton;
    RedoButton: TToolButton;
    Action1: TAction;
    procedure UndoButtonClick(Sender: TObject);
    procedure BoldButtonClick(Sender: TObject);
    procedure JvRichEdit1SelectionChange(Sender: TObject);
    procedure ItalicButtonClick(Sender: TObject);
    procedure UnderlineButtonClick(Sender: TObject);
    procedure JvRichEdit1URLClick(Sender: TObject; const URLText: string; Button: TMouseButton);
    procedure RedoButtonClick(Sender: TObject);
    procedure AlignLeftButtonClick(Sender: TObject);
    procedure AlignCenterButtonClick(Sender: TObject);
    procedure AlignRightButtonClick(Sender: TObject);
    procedure FontSizeSpinEditChange(Sender: TObject);
    procedure StrikeoutButtonClick(Sender: TObject);
  private
    { Private declarations }

    procedure SetAlignButtons;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TTextEditorFrame.AlignCenterButtonClick(Sender: TObject);
begin
  JvRichEdit1.Paragraph.Alignment := paCenter;
  SetAlignButtons;
end;

procedure TTextEditorFrame.AlignLeftButtonClick(Sender: TObject);
begin
  JvRichEdit1.Paragraph.Alignment := paLeftJustify;
  SetAlignButtons;
end;

procedure TTextEditorFrame.AlignRightButtonClick(Sender: TObject);
begin
  JvRichEdit1.Paragraph.Alignment := paRightJustify;
  SetAlignButtons;
end;

procedure TTextEditorFrame.BoldButtonClick(Sender: TObject);
begin
  JvRichEdit1.SelAttributes.Bold := not JvRichEdit1.SelAttributes.Bold;
  BoldButton.Down := JvRichEdit1.SelAttributes.Bold;
end;

procedure TTextEditorFrame.ItalicButtonClick(Sender: TObject);
begin
  JvRichEdit1.SelAttributes.Italic := not JvRichEdit1.SelAttributes.Italic;
  ItalicButton.Down := JvRichEdit1.SelAttributes.Italic;
end;

procedure TTextEditorFrame.JvRichEdit1SelectionChange(Sender: TObject);
begin
  with JvRichEdit1 do
  begin
    BoldButton.Down := SelAttributes.Bold;
    ItalicButton.Down := SelAttributes.Italic;
    UnderlineButton.Down := SelAttributes.Underline;
    StrikeoutButton.Down := SelAttributes.StrikeOut;
    FontSizeSpinEdit.Value := SelAttributes.Size;
  end;

  SetAlignButtons;
end;

procedure TTextEditorFrame.JvRichEdit1URLClick(Sender: TObject; const URLText: string; Button: TMouseButton);
begin
  ShellExecute(Application.Handle, 'open', PChar(URLText), nil, nil, SW_NORMAL);
end;

procedure TTextEditorFrame.RedoButtonClick(Sender: TObject);
begin
  if JvRichEdit1.CanRedo then
    JvRichEdit1.Redo;
end;

procedure TTextEditorFrame.SetAlignButtons;
begin
  AlignLeftButton.Down := JvRichEdit1.Paragraph.Alignment = paLeftJustify;
  AlignCenterButton.Down := JvRichEdit1.Paragraph.Alignment = paCenter;
  AlignRightButton.Down := JvRichEdit1.Paragraph.Alignment = paRightJustify;
end;

procedure TTextEditorFrame.StrikeoutButtonClick(Sender: TObject);
begin
  JvRichEdit1.SelAttributes.StrikeOut := not JvRichEdit1.SelAttributes.StrikeOut;
  StrikeoutButton.Down := JvRichEdit1.SelAttributes.StrikeOut;
end;

procedure TTextEditorFrame.FontSizeSpinEditChange(Sender: TObject);
begin
  JvRichEdit1.SelAttributes.Size := FontSizeSpinEdit.Value;
end;

procedure TTextEditorFrame.UnderlineButtonClick(Sender: TObject);
begin
  JvRichEdit1.SelAttributes.Underline := not JvRichEdit1.SelAttributes.Underline;
  UnderlineButton.Down := JvRichEdit1.SelAttributes.Underline;
end;

procedure TTextEditorFrame.UndoButtonClick(Sender: TObject);
begin
  if JvRichEdit1.CanUndo then
    JvRichEdit1.Undo;
end;

end.

