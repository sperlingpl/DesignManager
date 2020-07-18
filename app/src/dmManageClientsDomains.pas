unit dmManageClientsDomains;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.Generics.Collections, uClientDomain, JclSysUtils;

type
  IManageClientsDomainsDM = interface
    function GetList: TList<TClientDomain>;
    procedure Add(Name: String);
    procedure Update(ClientDomain: TClientDomain);
    procedure Delete(ClientDomain: TClientDomain);
  end;

  TManageClientsDomainsDM = class(TDataModule, IManageClientsDomainsDM)
    ds1: TDataSource;
    fdqry1: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }

    function GetList: TList<TClientDomain>;
    procedure Add(Name: String);
    procedure Update(ClientDomain: TClientDomain);
    procedure Delete(ClientDomain: TClientDomain);
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TManageClientsDomainsDM }

procedure TManageClientsDomainsDM.Add(Name: String);
begin
  fdqry1.SQL.Clear;
  fdqry1.SQL.Text := 'INSERT INTO ClientDomains ' +
    '(name) ' +
    'VALUES (:name)';

  fdqry1.ParamByName('name').AsString := Name;
  fdqry1.ExecSQL;
end;

procedure TManageClientsDomainsDM.Delete(ClientDomain: TClientDomain);
begin
  fdqry1.SQL.Clear;
  fdqry1.SQL.Text := 'DELETE FROM ClientDomains ' +
    'WHERE id = :id';

  fdqry1.ParamByName('id').AsInteger := ClientDomain.Id;
  fdqry1.ExecSQL;
end;

function TManageClientsDomainsDM.GetList: TList<TClientDomain>;
var
  ClientDomain: TClientDomain;
begin
  fdqry1.SQL.Clear;
  fdqry1.SQL.Text := 'SELECT * FROM ClientDomains';
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

procedure TManageClientsDomainsDM.Update(ClientDomain: TClientDomain);
begin
  fdqry1.SQL.Clear;
  fdqry1.SQL.Text := 'UPDATE ClientDomains SET ' +
    'name = :name ' +
    'WHERE id = :id';

  fdqry1.ParamByName('id').AsInteger := ClientDomain.Id;
  fdqry1.ParamByName('name').AsString := ClientDomain.Name;
  fdqry1.ExecSQL;
end;

end.
