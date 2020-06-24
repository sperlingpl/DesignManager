unit frmClientDetails;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDataModule, frmManageClientsDomains, fraTextEditor,
  Vcl.StdActns, System.Actions, Vcl.ActnList, Vcl.ActnMan, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ActnCtrls,
  Vcl.ExtCtrls, Vcl.StdStyleActnCtrls, System.ImageList, Vcl.ImgList, Vcl.VirtualImageList;

type
  TClientDetailsForm = class(TForm)
    SaveButton: TButton;
    CancelButton: TButton;
    NameDBEdit: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    EditClientGroupButton: TButton;
    DBLookupComboBox1: TDBLookupComboBox;
    TextEditorFrame1: TTextEditorFrame;
    ToolBar1: TToolBar;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure EditClientGroupButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

    procedure GetData;
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
  Form.Show;
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
  FDQuery1.Connection := MainDataModule.MainFDConnection;
end;

procedure TClientDetailsForm.FormShow(Sender: TObject);
begin
  if ClientId <> 0 then
    GetData;
end;

procedure TClientDetailsForm.GetData;
begin
  FDQuery1.SQL.Text := 'SELECT Clients.id, Clients.name, Clients.description, Clients.domain, ClientDomains.name as domainName ' +
        'FROM Clients ' +
        'LEFT JOIN ClientDomains ' +
        'ON Clients.domain= ClientDomains.id WHERE Clients.id = :id';
  FDQuery1.ParamByName('id').AsInteger := ClientId;
  FDQuery1.OpenOrExecute;
end;

procedure TClientDetailsForm.SaveButtonClick(Sender: TObject);
begin
  Close;
end;

end.
