unit dmManageClientsDomains;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.Generics.Collections, uClientDomain, JclSysUtils;

type
  TManageClientsDomainsDM = class(TDataModule)
    ds1: TDataSource;
    fdqry1: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }

    function GetList: TList<TClientDomain>;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TManageClientsDomainsDM }

function TManageClientsDomainsDM.GetList: TList<TClientDomain>;
var
  ClientDomain: TClientDomain;
begin
  fdqry1.OpenOrExecute;

  Result := TList<TClientDomain>.Create;

  if not fdqry1.IsEmpty then
  begin
    while not fdqry1.Eof do
    begin
      ClientDomain := TClientDomain.Create;
      ClientDomain.Id := fdqry1.FieldByName('id').AsInteger;
      ClientDomain.Name := fdqry1.FieldByName('name').AsString;
      Result.Add(ClientDomain);

      fdqry1.Next;
    end;
  end;
end;

end.
