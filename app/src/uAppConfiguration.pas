unit uAppConfiguration;

interface

type
  TAppConfiguration = class(TObject)
  private
    IniFilePath: String;
    ConfigurationDirPath: String;

  public
    DatabasePath: String;

    constructor Create;
    procedure Save;
    procedure Read;
    function Exists: Boolean;
    function GetDefaultDatabasePath: String;
  end;

implementation

uses
  System.IniFiles, System.SysUtils;

const
  AppConfDirectoryName = 'DesignerStore';
  DatabaseIniSection = 'DB';
  DBPathIniValue = 'path';

  { TAppConfiguration }

constructor TAppConfiguration.Create;
begin
  ConfigurationDirPath := IncludeTrailingPathDelimiter(GetHomePath) + AppConfDirectoryName;
  IniFilePath := IncludeTrailingPathDelimiter(ConfigurationDirPath) + 'config.ini';
end;

function TAppConfiguration.Exists: Boolean;
begin
  Result := FileExists(IniFilePath);

  if DirectoryExists(ConfigurationDirPath) = False then
    CreateDir(ConfigurationDirPath);
end;

function TAppConfiguration.GetDefaultDatabasePath: String;
begin
  Result := IncludeTrailingPathDelimiter(ConfigurationDirPath) + 'data.ddb';
end;

procedure TAppConfiguration.Read;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(IniFilePath);
  DatabasePath := IniFile.ReadString(DatabaseIniSection, DBPathIniValue, GetDefaultDatabasePath);
  IniFile.Free;
end;

procedure TAppConfiguration.Save;
var
  IniFile: TIniFile;
begin
  Exists;

  IniFile := TIniFile.Create(IniFilePath);
  IniFile.WriteString(DatabaseIniSection, DBPathIniValue, DatabasePath);
  IniFile.Free;
end;

end.
