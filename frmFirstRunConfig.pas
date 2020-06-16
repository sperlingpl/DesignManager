unit frmFirstRunConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  uAppConfiguration;

type
  TFirstRunConfigForm = class(TForm)
    OkButton: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    NewEdit: TEdit;
    ExistingEdit: TEdit;
    Image1: TImage;
    StaticText1: TStaticText;
    FileOpenDialog1: TFileOpenDialog;
    FileSaveDialog1: TFileSaveDialog;
    NewChooseButton: TButton;
    ExistingChooseButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure NewChooseButtonClick(Sender: TObject);
    procedure ExistingChooseButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FirstRunConfigForm: TFirstRunConfigForm;

implementation

{$R *.dfm}

procedure TFirstRunConfigForm.ExistingChooseButtonClick(Sender: TObject);
begin
  if FileOpenDialog1.Execute then
  begin
    ExistingEdit.Text := FileOpenDialog1.FileName;
  end;
end;

procedure TFirstRunConfigForm.FormCreate(Sender: TObject);
begin
  RadioButton1.Checked := True;
  NewEdit.Enabled := False;
  ExistingEdit.Enabled := False;
  NewChooseButton.Enabled := False;
  ExistingChooseButton.Enabled := False;
end;

procedure TFirstRunConfigForm.NewChooseButtonClick(Sender: TObject);
begin
  if FileSaveDialog1.Execute then
  begin
    NewEdit.Text := FileSaveDialog1.FileName + FileSaveDialog1.FileTypes[FileSaveDialog1.FileTypeIndex - 1].FileMask;
  end;
end;

procedure TFirstRunConfigForm.OkButtonClick(Sender: TObject);
var
  AppConfiguration: TAppConfiguration;
begin
  AppConfiguration := TAppConfiguration.Create;

  if RadioButton1.Checked then
    AppConfiguration.DatabasePath := AppConfiguration.GetDefaultDatabasePath;

  if RadioButton2.Checked then
    AppConfiguration.DatabasePath := NewEdit.Text;

  if RadioButton3.Checked then
    AppConfiguration.DatabasePath := ExistingEdit.Text;

  AppConfiguration.Save;
  AppConfiguration.Free;
  CloseModal;
end;

procedure TFirstRunConfigForm.RadioButton1Click(Sender: TObject);
begin
  NewEdit.Enabled := False;
  ExistingEdit.Enabled := False;
  NewChooseButton.Enabled := False;
  ExistingChooseButton.Enabled := False;
end;

procedure TFirstRunConfigForm.RadioButton2Click(Sender: TObject);
begin
  NewEdit.Enabled := False;
  ExistingEdit.Enabled := False;
  NewChooseButton.Enabled := True;
  ExistingChooseButton.Enabled := False;
end;

procedure TFirstRunConfigForm.RadioButton3Click(Sender: TObject);
begin
  NewEdit.Enabled := False;
  ExistingEdit.Enabled := False;
  NewChooseButton.Enabled := False;
  ExistingChooseButton.Enabled := True;
end;

end.
