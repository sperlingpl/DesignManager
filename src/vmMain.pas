unit vmMain;

interface

uses
  System.Generics.Collections, uClient, dmClient, uProject, dmProject;

type
  IMainVM = interface(IInterface)
    function GetClients: TList<TClient>;
    function GetProjects: TList<TProject>;
  end;

  TMainVM = class(TInterfacedObject, IMainVM)
  private
    clientDM: IClientDM;
    projectDM: IProjectDM;

  public
    constructor Create;
    function GetClients: System.Generics.Collections.TList<uClient.TClient>;
    function GetProjects: System.Generics.Collections.TList<uProject.TProject>;
  end;

implementation

{ TMainVM }

constructor TMainVM.Create;
begin
  clientDM := TClientDM.Create;
  projectDM := TProjectDM.Create;
end;

function TMainVM.GetClients: System.Generics.Collections.TList<uClient.TClient>;
begin
  Result := clientDM.GetList;
end;

function TMainVM.GetProjects: System.Generics.Collections.TList<uProject.TProject>;
begin
  Result := projectDM.GetList;
end;

end.
