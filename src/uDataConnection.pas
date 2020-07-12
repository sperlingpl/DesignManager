unit uDataConnection;

interface

uses
  FireDAC.Comp.Client, Data.DB;

type
  TDataConnection = class
  private
    procedure CreateTables;
  public
    procedure Connect(Path: String);
    procedure Close;
  end;

var
  dataConnection: TDataConnection;

implementation

uses
  System.SysUtils, FireDAC.phys.Intf, FireDAC.Dapt, FireDAC.Stan.Param,
  uCreateDBQueries, uDataModule;

const
  DBVersion = 1;

{ TDataConnection }

procedure TDataConnection.Close;
begin
  MainDataModule.MainFDConnection.Close;
end;

procedure TDataConnection.Connect(Path: String);
var
  shouldInitDB: Boolean;
begin
  shouldInitDB := False;

  if FileExists(Path) = False then shouldInitDB := True;

  MainDataModule.MainFDConnection.Params.Values['Database'] := Path;

  try
    MainDataModule.MainFDConnection.Open;

    if shouldInitDB then CreateTables;
  except
    on E: EDatabaseError do
    begin

    end;
  end;
end;

procedure TDataConnection.CreateTables;
var
  fdQuery: TFDQuery;
begin
  MainDataModule.MainFDConnection.StartTransaction;

  MainDataModule.MainFDConnection.ExecSQL(DB_CREATE_SYSTEM);
  MainDataModule.MainFDConnection.ExecSQL(DB_CREATE_PROJECTS);
  MainDataModule.MainFDConnection.ExecSQL(DB_CREATE_CLIENTS);

  fdQuery := TFDQuery.Create(nil);
  fdQuery.Command.CommandKind := skInsert;
  fdQuery.Connection := MainDataModule.MainFDConnection;
  fdQuery.SQL.Text := 'INSERT INTO `System` (`version`) VALUES (:version)';
  fdQuery.ParamByName('version').Value := DBVersion;
  fdQuery.Execute;
  fdQuery.Free;

  MainDataModule.MainFDConnection.Commit;
end;

initialization

begin
//  dataConnection := TDataConnection.Create;
end;

end.
