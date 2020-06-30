program DesignManager;

uses
  Vcl.Forms,
  frmMain in 'src\frmMain.pas' {MainForm},
  uDataConnection in 'src\uDataConnection.pas',
  frmAddProject in 'src\frmAddProject.pas' {AddProjectForm},
  uCreateDBQueries in 'src\uCreateDBQueries.pas',
  frmFirstRunConfig in 'src\frmFirstRunConfig.pas' {FirstRunConfigForm},
  Vcl.Themes,
  Vcl.Styles,
  uAppConfiguration in 'src\uAppConfiguration.pas',
  frmAbout in 'src\frmAbout.pas' {AboutBoxForm},
  uDataModule in 'src\uDataModule.pas' {MainDataModule: TDataModule},
  frmProjectDetails in 'src\frmProjectDetails.pas' {ProjectDetailsForm},
  frmClientDetails in 'src\frmClientDetails.pas' {ClientDetailsForm},
  frmManageClientsDomains in 'src\frmManageClientsDomains.pas' {ManageClientsDomainsForm},
  fraTextEditor in 'src\fraTextEditor.pas' {TextEditorFrame: TFrame},
  dmManageClientsDomains in 'src\dmManageClientsDomains.pas' {ManageClientsDomainsDM: TDataModule},
  uClientDomain in 'src\uClientDomain.pas',
  dmClientDetails in 'src\dmClientDetails.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Luna');
  Application.CreateForm(TMainDataModule, MainDataModule);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutBoxForm, AboutBoxForm);
  Application.Run;
end.
