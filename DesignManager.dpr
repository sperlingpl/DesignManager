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
  frmProjectDetails in 'frmProjectDetails.pas' {ProjectDetailsForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainDataModule, MainDataModule);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutBoxForm, AboutBoxForm);
  Application.Run;
end.
