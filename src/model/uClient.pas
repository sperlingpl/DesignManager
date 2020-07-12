unit uClient;

interface

uses
  System.Classes, uClientDomain;

type
  TClient = class
  public
    Id: Integer;
    Name: String;
    Description: TMemoryStream;
    Domain: TClientDomain;

    destructor Destroy; override;
  end;

implementation

{ TClient }

destructor TClient.Destroy;
begin
  if Assigned(Description) then
    Description.Free;

  if Assigned(Domain) then
    Domain.Free;

  inherited;
end;

end.
