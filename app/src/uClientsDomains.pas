unit uClientsDomains;

interface

uses
  System.Generics.Collections;

type
  TClientDomain = class
  public
    Id: Integer;
    Name: String;
  end;

  IClientsDomainsDM = interface(IInterface)
    function GetAll(): TList<TClientDomain>;
  end;

  TClientsDomainsDM = class(TInterfacedObject, IClientsDomainsDM)
  public
    function GetAll: System.Generics.Collections.TList<uClientsDomains.TClientDomain>;
  end;

implementation

uses
  FireDAC.Comp.Client, uDataModule;

{ TClientsDomainsDM }

function TClientsDomainsDM.GetAll: System.Generics.Collections.TList<uClientsDomains.TClientDomain>;
var
  Query: TFDQuery;
  ClientDomain: TClientDomain;  
begin
  Query := TFDQuery.Create(nil);

  try
    Query.Connection := MainDataModule.MainFDConnection;
    Query.SQL.Text := 'SELECT * FROM ClientDomains';
    Query.OpenOrExecute;

    Result := TList<TClientDomain>.Create;
    
    while not Query.Eof do
    begin
      ClientDomain := TClientDomain.Create;
      ClientDomain.Id := Query.FieldByName('id').AsInteger;
      ClientDomain.Name := Query.FieldByName('name').AsString;
      Result.Add(ClientDomain);
      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;

end.
