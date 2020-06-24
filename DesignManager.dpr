program DesignManager;

uses
  Vcl.Forms,
  frmMain in 'frmMain.pas' {MainForm},
  uDataConnection in 'uDataConnection.pas',
  frmAddProject in 'frmAddProject.pas' {AddProjectForm},
  uCreateDBQueries in 'uCreateDBQueries.pas',
  frmFirstRunConfig in 'frmFirstRunConfig.pas' {FirstRunConfigForm},
  Vcl.Themes,
  Vcl.Styles,
  uAppConfiguration in 'uAppConfiguration.pas',
  frmAbout in 'frmAbout.pas' {AboutBoxForm},
  uDataModule in 'uDataModule.pas' {MainDataModule: TDataModule},
  frmProjectDetails in 'frmProjectDetails.pas' {ProjectDetailsForm},
  frmClientDetails in 'frmClientDetails.pas' {ClientDetailsForm},
  frmManageClientsDomains in 'frmManageClientsDomains.pas' {ManageClientsDomainsForm},
  fraTextEditor in 'fraTextEditor.pas' {TextEditorFrame: TFrame},
  dmManageClientsDomains in 'dmManageClientsDomains.pas' {ManageClientsDomainsDM: TDataModule},
  uClientDomain in 'uClientDomain.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainDataModule, MainDataModule);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutBoxForm, AboutBoxForm);
  Application.Run;
end.
