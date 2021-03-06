unit frmAbout;

interface

uses WinApi.Windows, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Forms, Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, JvExControls, JvPoweredBy, RzStatus;

type
  TAboutBoxForm = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    OKButton: TButton;
    JvPoweredByJVCL1: TJvPoweredByJVCL;
    RzVersionInfoStatus1: TRzVersionInfoStatus;
    RzVersionInfo1: TRzVersionInfo;
    procedure OKButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBoxForm: TAboutBoxForm;

implementation

{$R *.dfm}

procedure TAboutBoxForm.OKButtonClick(Sender: TObject);
begin
  Close;
end;

end.
 
