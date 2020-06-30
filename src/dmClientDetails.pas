unit dmClientDetails;

interface

type
  TClient = class
  public
    Id: Integer;
    Name: String;
  end;

  IClientDetailsDM = interface(IInterface)
    function Get(Id: Integer): TClient;
  end;

  TClientDetailsDM = class(TInterfacedObject, IClientDetailsDM)
  private

  public
    function Get(Id: Integer): TClient;
  end;

implementation

{ TClientDetailsDM }

uses
  FireDAC.Comp.Client, uDataModule;

function TClientDetailsDM.Get(Id: Integer): TClient;
var
  FDQuery: TFDQuery;
begin
  FDQuery := TFDQuery.Create(nil);
  FDQuery.Connection := MainDataModule.MainFDConnection;

  FDQuery.SQL.Clear;
  FDQuery.SQL.Text := 'SELECT Clients.id, Clients.name, Clients.description, Clients.domain, ClientDomains.name as domainName ' +
        'FROM Clients ' +
        'LEFT JOIN ClientDomains ' +
        'ON Clients.domain= ClientDomains.id WHERE Clients.id = :id';
  FDQuery.ParamByName('id').AsInteger := Id;
  FDQuery.OpenOrExecute;

  Result := TClient.Create;
  Result.Id := FDQuery.FieldByName('id').AsInteger;
  Result.Name := FDQuery.FieldByName('name').AsString;

  FDQuery.Free;
end;

end.
