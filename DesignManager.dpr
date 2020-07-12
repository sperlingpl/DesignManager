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
  uClientDomain in 'src\model\uClientDomain.pas',
  dmClient in 'src\dm\dmClient.pas',
  uClientsDomains in 'src\uClientsDomains.pas',
  uClient in 'src\model\uClient.pas',
  vmMain in 'src\vmMain.pas',
  uProject in 'src\model\uProject.pas',
  dmProject in 'src\dm\dmProject.pas',
  vmClientDetails in 'src\vmClientDetails.pas',
  uValidationItem in 'src\validation\uValidationItem.pas',
  uValidator in 'src\validation\uValidator.pas',
  uEmptyTextValidator in 'src\validation\uEmptyTextValidator.pas';

{$R *.res}

begin
  {$WARNINGS OFF}
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
  {$WARNINGS ON}

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Luna');
  Application.CreateForm(TMainDataModule, MainDataModule);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutBoxForm, AboutBoxForm);
  Application.Run;
end.
