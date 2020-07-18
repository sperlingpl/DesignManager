unit frmClientDetails;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDataModule, frmManageClientsDomains, fraTextEditor,
  Vcl.StdActns, System.Actions, Vcl.ActnList, Vcl.ActnMan, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ActnCtrls,
  Vcl.ExtCtrls, Vcl.StdStyleActnCtrls, System.ImageList, Vcl.ImgList, Vcl.VirtualImageList,
  dmClient, uClientsDomains, vmClientDetails;

type
  TClientDetailsForm = class(TForm)
    SaveButton: TButton;
    CancelButton: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EditClientGroupButton: TButton;
    TextEditorFrame1: TTextEditorFrame;
    edtName: TEdit;
    cbbClientsDomains: TComboBox;
    lblNameError: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure EditClientGroupButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtNameChange(Sender: TObject);
  private
    { Private declarations }

    DataModule: IClientDM;
    ViewModel: TClientDetailsVM;

    procedure OnCanSaveChanged(const Value: Boolean);
  public
    { Public declarations }

    ClientId: Integer;

    procedure FillClientDomains;
    procedure ClearClientDomains;
  end;

var
  ClientDetailsForm: TClientDetailsForm;

implementation

uses
  System.Generics.Collections, uClient;

{$R *.dfm}

procedure TClientDetailsForm.ClearClientDomains;
var
  Idx: Integer;
begin
  for Idx := 0 to cbbClientsDomains.Items.Count - 1 do
      cbbClientsDomains.Items.Objects[Idx].Free;

  cbbClientsDomains.Items.Clear;
end;

procedure TClientDetailsForm.EditClientGroupButtonClick(Sender: TObject);
var
  Form: TManageClientsDomainsForm;
begin
  Form := TManageClientsDomainsForm.Create(Self);
  Form.ShowModal;

  FillClientDomains;
end;

procedure TClientDetailsForm.edtNameChange(Sender: TObject);
begin
  ViewModel.Name := edtName.Text;
end;

procedure TClientDetailsForm.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TClientDetailsForm.FillClientDomains;
var
  ClientsDomainsDM: IClientsDomainsDM;
  ClientsDomainsList: TList<TClientDomain>;
  Idx: Integer;
begin
  ClearClientDomains;

  ClientsDomainsDM := TClientsDomainsDM.Create;
  ClientsDomainsList := ClientsDomainsDM.GetAll;

  for Idx := 0 to ClientsDomainsList.Count - 1 do
    cbbClientsDomains.Items.AddObject(ClientsDomainsList[Idx].Name, ClientsDomainsList[Idx]);

  ClientsDomainsList.Free;
end;

procedure TClientDetailsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClearClientDomains;
  ViewModel.Free;
  Action := caFree;
end;

procedure TClientDetailsForm.FormCreate(Sender: TObject);
begin
  DataModule := TClientDM.Create;
  ViewModel := TClientDetailsVM.Create;

  ViewModel.OnCanSaveChanged := OnCanSaveChanged;
end;

procedure TClientDetailsForm.FormShow(Sender: TObject);
var
  Client: TClient;
begin
  FillClientDomains;

  if ClientId <> 0 then
  begin
    Client := DataModule.Get(ClientId);
    edtName.Text := Client.Name;
    TextEditorFrame1.JvRichEdit1.PlainText := False;
    TextEditorFrame1.JvRichEdit1.Lines.LoadFromStream(Client.Description);

    Client.Free;
  end;
end;

procedure TClientDetailsForm.OnCanSaveChanged(const Value: Boolean);
begin
  SaveButton.Enabled := Value;
end;

procedure TClientDetailsForm.SaveButtonClick(Sender: TObject);
var
  Client: TClient;
begin
  Client := TClient.Create;
  Client.Id := ClientId;
  Client.Name := edtName.Text;
  Client.Description := TMemoryStream.Create;
  Client.Description.Clear;

  TextEditorFrame1.JvRichEdit1.PlainText := False;
  TextEditorFrame1.JvRichEdit1.Lines.SaveToStream(Client.Description);
  Client.Description.Position := 0;

  DataModule.Save(Client);
  Client.Free;

  Close;
end;

end.
