unit uDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client;

type
  TMainDataModule = class(TDataModule)
    MainFDConnection: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
  private
    { Private declarations }

    procedure CreateTables;
  public
    { Public declarations }
    procedure Connect(Path: String);
  end;

var
  MainDataModule: TMainDataModule;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  FireDAC.Dapt, uCreateDBQueries;

const
  DBVersion = 1;

{$R *.dfm}

procedure TMainDataModule.Connect(Path: String);
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

procedure TMainDataModule.CreateTables;
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

end.
