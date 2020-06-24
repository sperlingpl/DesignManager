unit frmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.ExprFuncs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, Vcl.Menus,
  uDataConnection, frmAddProject, frmFirstRunConfig, frmAbout, uAppConfiguration, Vcl.ComCtrls, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Mask, Vcl.DBCtrls, uDataModule, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt, Vcl.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, System.DateUtils, frmProjectDetails, Vcl.Grids, Vcl.DBGrids, Vcl.Touch.GestureCtrls,
  frmClientDetails, ovcbase, ovcclock, ChromeTabs, Vcl.RibbonLunaStyleActnCtrls, Vcl.Ribbon;

type
  TMainForm = class(TForm)
    Button1: TButton;
    MainMenu1: TMainMenu;
    Plik1: TMenuItem;
    Pomoc1: TMenuItem;
    AboutMenuItem: TMenuItem;
    ProjectsListView: TListView;
    ProjectsCompletionFilterComboBox: TComboBox;
    ExitMenuItem: TMenuItem;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    Dane1: TMenuItem;
    Klienci1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Edit1: TEdit;
    ClientsDataSource: TDataSource;
    ClientsFDQuery: TFDQuery;
    ClientsListView: TListView;
    Edit2: TEdit;
    AddClientButton: TButton;
    ClientDomainsFDQuery: TFDQuery;
    ClientDomainsDataSource: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AboutMenuItemClick(Sender: TObject);
    procedure ExitMenuItemClick(Sender: TObject);
    procedure ProjectsListViewDblClick(Sender: TObject);
    procedure ProjectsCompletionFilterComboBoxChange(Sender: TObject);
    procedure AddClientButtonClick(Sender: TObject);
    procedure ClientsListViewDblClick(Sender: TObject);
  private
    { Private declarations }

    procedure FillProjectList;
    procedure FilterAll;
    procedure FilterCompleted;
    procedure FilterIncomplete;
    procedure FillClientsList;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.AddClientButtonClick(Sender: TObject);
var
  Form: TClientDetailsForm;
begin
  Form := TClientDetailsForm.Create(Self);
  Form.Show;
end;

procedure TMainForm.Button1Click(Sender: TObject);
var
  AddProjectForm: TAddProjectForm;
begin
  AddProjectForm := TAddProjectForm.Create(Self);
  AddProjectForm.ShowModal;
end;

procedure TMainForm.ClientsListViewDblClick(Sender: TObject);
var
  Form: TClientDetailsForm;
begin
  Form := TClientDetailsForm.Create(Self);
  Form.ClientId := StrToInt(ClientsListView.Selected.Caption);
  Form.Show;
end;

procedure TMainForm.ProjectsCompletionFilterComboBoxChange(Sender: TObject);
begin
  FDQuery1.Close;

  case ProjectsCompletionFilterComboBox.ItemIndex of
  0: FilterIncomplete;
  1: FilterCompleted;
  2: FilterAll;
  end;  

  FillProjectList;
end;

procedure TMainForm.ExitMenuItemClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TMainForm.FillClientsList;
var
  ListItem: TListItem;
begin
  ClientsListView.Items.Clear;

  ClientsFDQuery.OpenOrExecute;

  while not ClientsFDQuery.Eof do
  begin
    ListItem := ClientsListView.Items.Add;

    with ListItem do
    begin
      Caption := ClientsFDQuery.FieldByName('id').AsString;
      SubItems.Add(ClientsFDQuery.FieldByName('name').AsString);
      SubItems.Add(ClientsFDQuery.FieldByName('description').AsString);
      ClientsFDQuery.Next;
    end;
  end;
end;

procedure TMainForm.FillProjectList;
var
  ListItem: TListItem;
begin
  ProjectsListView.Items.Clear;

  while not FDQuery1.Eof do
  begin
    ListItem := ProjectsListView.Items.Add;
    ListItem.SubItems.Add(FDQuery1.FieldByName('clientName').AsString);
    ListItem.SubItems.Add(FDQuery1.FieldByName('name').AsString);
    ListItem.SubItems.Add(FDQuery1.FieldByName('deadlineDate').AsString);
    ListItem.SubItems.Add(FDQuery1.FieldByName('description').AsString);
    FDQuery1.Next;
  end;
end;

procedure TMainForm.FilterAll;
begin
  FDQuery1.OpenOrExecute;
end;

procedure TMainForm.FilterCompleted;
begin
  FDQuery1.OpenOrExecute;
end;

procedure TMainForm.FilterIncomplete;
begin
  FDQuery1.OpenOrExecute;
end;

procedure TMainForm.FormShow(Sender: TObject);
var
  AppConfiguration: TAppConfiguration;
  FirstRunForm: TFirstRunConfigForm;
begin
  AppConfiguration := TAppConfiguration.Create;

  if AppConfiguration.Exists = False then
  begin
    FirstRunForm := TFirstRunConfigForm.Create(Self);
    FirstRunForm.ShowModal;
  end;

  AppConfiguration.Read;

  MainDataModule.Connect(AppConfiguration.DatabasePath);
  AppConfiguration.Free;

  FillProjectList;
  FillClientsList;
end;

procedure TMainForm.ProjectsListViewDblClick(Sender: TObject);
var
  Form: TProjectDetailsForm;
begin
  if ProjectsListView.Selected = nil then
    Exit;

  Form := TProjectDetailsForm.Create(Self);
  Form.Show;
end;

procedure TMainForm.AboutMenuItemClick(Sender: TObject);
begin
  AboutBoxForm.Show;
end;

end.
