unit frmClientDetails;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDataModule, frmManageClientsDomains, fraTextEditor,
  Vcl.StdActns, System.Actions, Vcl.ActnList, Vcl.ActnMan, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ActnCtrls,
  Vcl.ExtCtrls, Vcl.StdStyleActnCtrls, System.ImageList, Vcl.ImgList, Vcl.VirtualImageList,
  dmClientDetails;

type
  TClientDetailsForm = class(TForm)
    SaveButton: TButton;
    CancelButton: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EditClientGroupButton: TButton;
    DBLookupComboBox1: TDBLookupComboBox;
    TextEditorFrame1: TTextEditorFrame;
    edtName: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure EditClientGroupButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

    DataModule: IClientDetailsDM;
  public
    { Public declarations }

    ClientId: Integer;
  end;

var
  ClientDetailsForm: TClientDetailsForm;

implementation

{$R *.dfm}

procedure TClientDetailsForm.EditClientGroupButtonClick(Sender: TObject);
var
  Form: TManageClientsDomainsForm;
begin
  Form := TManageClientsDomainsForm.Create(Self);
  Form.ShowModal;
end;

procedure TClientDetailsForm.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TClientDetailsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TClientDetailsForm.FormCreate(Sender: TObject);
begin
  DataModule := TClientDetailsDM.Create;
end;

procedure TClientDetailsForm.FormShow(Sender: TObject);
var
  Client: TClient;
begin
  if ClientId <> 0 then
  begin
    Client := DataModule.Get(ClientId);
    edtName.Text := Client.Name;

    Client.Free;
  end;
end;

procedure TClientDetailsForm.SaveButtonClick(Sender: TObject);
begin
  Close;
end;

end.
