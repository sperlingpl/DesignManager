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
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
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
  private
    { Private declarations }

    DataModule: TManageClientsDomainsDM;
  public
    { Public declarations }
  end;

var
  ManageClientsDomainsForm: TManageClientsDomainsForm;

implementation

{$R *.dfm}

procedure TManageClientsDomainsForm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TManageClientsDomainsForm.btnEditClick(Sender: TObject);
begin
  lstDomains.ShowEditor;
end;

procedure TManageClientsDomainsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DataModule.Free;
  Action := caFree;
end;

procedure TManageClientsDomainsForm.FormCreate(Sender: TObject);
var
  List: TList<TClientDomain>;
  I: Integer;
begin
  DataModule := TManageClientsDomainsDM.Create(nil);
  List := DataModule.GetList;
  FDQuery1.OpenOrExecute;

  for I := 0 to List.Count - 1 do
  begin
    lstDomains.Add(List[I].Name);
  end;
end;

procedure TManageClientsDomainsForm.lstDomainsDblClick(Sender: TObject);
begin
  lstDomains.ShowEditor;
end;

procedure TManageClientsDomainsForm.lstDomainsItemChanged(Sender: TObject; Index: Integer);
begin
  if Index > -1 then
  begin
    btnEdit.Enabled := True;
    btnDelete.Enabled := True;
  end
  else
  begin
    btnEdit.Enabled := False;
    btnDelete.Enabled := False;
  end;
end;

end.
