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
  frmClientDetails, Vcl.ExtCtrls, Vcl.WinXCtrls, System.Generics.Collections, uClient,
  Vcl.CategoryButtons, JvPageList, JvExControls, Vcl.WinXCalendars, frmManageClientsDomains, vmMain;

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
    Edit1: TEdit;
    ClientsDataSource: TDataSource;
    ClientsFDQuery: TFDQuery;
    ClientsListView: TListView;
    Edit2: TEdit;
    AddClientButton: TButton;
    ClientDomainsFDQuery: TFDQuery;
    ClientDomainsDataSource: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    spltvwMain: TSplitView;
    ctgrybtns1: TCategoryButtons;
    jvpglst1: TJvPageList;
    jvstndrdpgProjects: TJvStandardPage;
    jvstndrdpgClients: TJvStandardPage;
    CalendarView1: TCalendarView;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AboutMenuItemClick(Sender: TObject);
    procedure ExitMenuItemClick(Sender: TObject);
    procedure ProjectsListViewDblClick(Sender: TObject);
    procedure ProjectsCompletionFilterComboBoxChange(Sender: TObject);
    procedure AddClientButtonClick(Sender: TObject);
    procedure ClientsListViewDblClick(Sender: TObject);
    procedure ctgrybtns1Categories0Items0Click(Sender: TObject);
    procedure ctgrybtns1Categories0Items1Click(Sender: TObject);
    procedure CalendarView1DrawDayItem(Sender: TObject; DrawParams: TDrawViewInfoParams;
      CalendarViewViewInfo: TCellItemViewInfo);
    procedure FormCreate(Sender: TObject);
    procedure ctgrybtns1Categories1Items0Click(Sender: TObject);
  private
    { Private declarations }
    viewModel: IMainVM;

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

procedure TMainForm.CalendarView1DrawDayItem(Sender: TObject; DrawParams: TDrawViewInfoParams;
  CalendarViewViewInfo: TCellItemViewInfo);
begin

  if DayOfWeek(CalendarViewViewInfo.Date) in [1, 7] then
    DrawParams.ForegroundColor := clRed;
end;

procedure TMainForm.ClientsListViewDblClick(Sender: TObject);
var
  Form: TClientDetailsForm;
begin
  if ClientsListView.Selected = nil then
    Exit;

  Form := TClientDetailsForm.Create(Self);
  Form.ClientId := StrToInt(ClientsListView.Selected.Caption);
  Form.ShowModal;

  FillClientsList;
end;

procedure TMainForm.ctgrybtns1Categories0Items0Click(Sender: TObject);
begin
  jvpglst1.ActivePage := jvstndrdpgProjects;
end;

procedure TMainForm.ctgrybtns1Categories0Items1Click(Sender: TObject);
begin
  jvpglst1.ActivePage := jvstndrdpgClients;
end;

procedure TMainForm.ctgrybtns1Categories1Items0Click(Sender: TObject);
var
  Form: TManageClientsDomainsForm;
begin
  Form := TManageClientsDomainsForm.Create(Self);
  Form.ShowModal;
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
  Clients: TList<TClient>;
  Client: TClient;
begin
  ClientsListView.Items.Clear;

  Clients := viewModel.GetClients;

  for Client in Clients do
  begin
    ListItem := ClientsListView.Items.Add;

    with ListItem do
    begin
      Caption := IntToStr(Client.Id);
      SubItems.Add(Client.Name);
      SubItems.Add('av');

      Client.Free;
    end;
  end;

  Clients.Free;
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

procedure TMainForm.FormCreate(Sender: TObject);
begin
  viewModel := TMainVM.Create;
  ctgrybtns1.SelectedItem := ctgrybtns1.Categories[0].Items[0];
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
