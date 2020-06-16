unit frmAddProject;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.WinXPickers, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TAddProjectForm = class(TForm)
    Button1: TButton;
    AddButton: TButton;
    LabeledEdit1: TLabeledEdit;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    ComboBoxEx1: TComboBoxEx;
    Label2: TLabel;
    Memo1: TMemo;
    Label3: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AddProjectForm: TAddProjectForm;

implementation

{$R *.dfm}

end.
