unit dmProject;

interface

uses
  System.Generics.Collections, uProject;

type
  IProjectDM = interface(IInterface)
    function GetList: TList<TProject>;
  end;

  TProjectDM = class(TInterfacedObject, IProjectDM)
  public
    function GetList: System.Generics.Collections.TList<uProject.TProject>;
  end;

implementation

{ TProjectDM }

uses
  FireDAC.Comp.Client, uDataModule, FireDAC.Stan.Param, System.Classes;

function TProjectDM.GetList: System.Generics.Collections.TList<uProject.TProject>;
var
  Query: TFDQuery;
  Project: TProject;
begin
  Query := MainDataModule.GetQuery;

  try
    Query.SQL.Text := 'SELECT * FROM Projects';

    Query.OpenOrExecute;

    Result := TList<TProject>.Create;

    while not Query.Eof do
    begin
      Project := TProject.Create;

      Project.Id := Query.ParamByName('id').AsInteger;
      Project.Name := Query.ParamByName('name').AsString;      
      
      Result.Add(Project);
    end;    
  finally
    Query.Free;
  end;
end;

end.
