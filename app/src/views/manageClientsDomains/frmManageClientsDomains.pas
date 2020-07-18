unit frmManageClientsDomains;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, RzLstBox,
  dmManageClientsDomains, uClientDomain, System.Generics.Collections;

type
  TManageClientsDomainsForm = class(TForm)
    btnAdd: TButton;
    btnDelete: TButton;
    btnClose: TButton;
    edtName: TEdit;
    lstDomains: TRzEditListBox;
    btnEdit: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure lstDomainsDblClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure lstDomainsItemChanged(Sender: TObject; Index: Integer);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure edtNameChange(Sender: TObject);
  private
    { Private declarations }

    DataModule: IManageClientsDomainsDM;

    procedure LoadList;
  public
    { Public declarations }
  end;

var
  ManageClientsDomainsForm: TManageClientsDomainsForm;

implementation

{$R *.dfm}

procedure TManageClientsDomainsForm.btnAddClick(Sender: TObject);
begin
  if Trim(edtName.Text) = '' then
    Exit;

  DataModule.Add(edtName.Text);
  LoadList;
end;

procedure TManageClientsDomainsForm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TManageClientsDomainsForm.btnDeleteClick(Sender: TObject);
var
  ClientDomain: TClientDomain;
begin
  ClientDomain := lstDomains.Items.Objects[lstDomains.ItemIndex] as TClientDomain;
  DataModule.Delete(ClientDomain);
  LoadList;
end;

procedure TManageClientsDomainsForm.btnEditClick(Sender: TObject);
begin
  lstDomains.ShowEditor;
end;

procedure TManageClientsDomainsForm.edtNameChange(Sender: TObject);
begin
  if Trim(edtName.Text) = '' then
    btnAdd.Enabled := False
  else
    btnAdd.Enabled := True;
end;

procedure TManageClientsDomainsForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  I: Integer;
begin
  for I := 0 to lstDomains.Count - 1 do
    lstDomains.Items.Objects[I].Free;

  (DataModule as TDataModule).Free;

  Action := caFree;
end;

procedure TManageClientsDomainsForm.FormCreate(Sender: TObject);
begin
  btnAdd.Enabled := False;
  DataModule := TManageClientsDomainsDM.Create(nil);
  LoadList;
end;

procedure TManageClientsDomainsForm.LoadList;
var
  List: TList<TClientDomain>;
  I: Integer;
begin
  lstDomains.Items.Clear;
  edtName.Text := '';

  List := DataModule.GetList;

  for I := 0 to List.Count - 1 do
  begin
    lstDomains.AddItem(List[I].Name, List[I]);
  end;

  List.Free;
end;

procedure TManageClientsDomainsForm.lstDomainsDblClick(Sender: TObject);
begin
  lstDomains.ShowEditor;
end;

procedure TManageClientsDomainsForm.lstDomainsItemChanged(Sender: TObject; Index: Integer);
var
  ClientDomain: TClientDomain;
begin
  ClientDomain := lstDomains.Items.Objects[Index] as TClientDomain;
  ClientDomain.Name := lstDomains.Items[Index];
  DataModule.Update(ClientDomain);
end;

end.
