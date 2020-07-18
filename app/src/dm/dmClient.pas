unit dmClient;

interface

uses
  System.Generics.Collections, uClient;

type
  IClientDM = interface(IInterface)
    function Get(Id: Integer): TClient;
    function GetList: TList<TClient>;
    procedure Save(Client: TClient);
  end;

  TClientDM = class(TInterfacedObject, IClientDM)
  public
    function Get(Id: Integer): TClient;
    function GetList: System.Generics.Collections.TList<uClient.TClient>;
    procedure Save(Client: TClient);       
  end;

implementation

{ TClientDetailsDM }

uses
  FireDAC.Comp.Client, uDataModule, FireDAC.Stan.Param, System.Classes;

function TClientDM.Get(Id: Integer): TClient;
var
  FDQuery: TFDQuery;
  RtfData: AnsiString;
begin
  FDQuery := TFDQuery.Create(nil);
  FDQuery.Connection := MainDataModule.MainFDConnection;

  try
    FDQuery.SQL.Clear;
    FDQuery.SQL.Text :=
      'SELECT Clients.id, Clients.name, Clients.description, Clients.domain, ClientDomains.name as domainName ' +
      'FROM Clients ' + 'LEFT JOIN ClientDomains ' + 'ON Clients.domain= ClientDomains.id WHERE Clients.id = :id';
    FDQuery.ParamByName('id').AsInteger := Id;
    FDQuery.OpenOrExecute;

    Result := TClient.Create;
    Result.Id := FDQuery.FieldByName('id').AsInteger;
    Result.Name := FDQuery.FieldByName('name').AsString;
    RtfData := FDQuery.FieldByName('description').AsAnsiString;

    Result.Description := TMemoryStream.Create;
    Result.Description.Clear;
    Result.Description.Write(PAnsiChar(RtfData)^, Length(RtfData));
    Result.Description.Position := 0;
  finally
    FDQuery.Free;
  end;
end;

function TClientDM.GetList: System.Generics.Collections.TList<uClient.TClient>;
var
  Query: TFDQuery;
  Client: TClient;
begin
  Query := MainDataModule.GetQuery;

  try
    Query.SQL.Clear;
    Query.SQL.Text := 'SELECT Clients.id, Clients.name, Clients.domain, ClientDomains.name as domainName ' +
      'FROM Clients ' + 'LEFT JOIN ClientDomains ' + 'ON Clients.domain = ClientDomains.id';
    Query.OpenOrExecute;

    Result := TList<TClient>.Create;

    while not Query.Eof do
    begin
      Client := TClient.Create;
      Client.Id := Query.FieldByName('id').AsInteger;
      Client.Name := Query.FieldByName('name').AsString;
      Result.Add(Client);

      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;

procedure TClientDM.Save(Client: TClient);
var
  Query: TFDQuery;
  RtfData: RawByteString;
begin
  Query := TFDQuery.Create(nil);
  Query.Connection := MainDataModule.MainFDConnection;

  try
    Query.SQL.Clear;

    if Client.Id <> 0 then
    begin
      Query.SQL.Text :=
        'UPDATE Clients SET name = :name, description = :description, domain = :domainId WHERE id = :id';
      Query.ParamByName('id').AsInteger := Client.Id;
    end
    else
    begin
      Query.SQL.Text :=
        'INSERT INTO Clients (id, name, description, domain) VALUES (null, :name, :description, :domainId)';
    end;

    Query.ParamByName('name').AsString := Client.Name;

    SetLength(RtfData, Client.Description.Size);
    if (Client.Description.Read(RtfData[1], Client.Description.Size) <= 0) then
      raise EStreamError.CreateFmt('End of stream reached with %d bytes left to read.', [Client.Description.Size]);

    Query.ParamByName('description').AsBlob := RtfData;
    Query.ParamByName('domainId').AsInteger := 1;
    Query.ExecSQL;
  finally
    Query.Free;
  end;
end;

end.
