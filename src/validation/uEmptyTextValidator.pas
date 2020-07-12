unit uEmptyTextValidator;

interface

uses
  uValidator;

type
  TEmptyTextValidator = class(TInterfacedObject, IValidator)

  public
    function Validate: Boolean;
    function GetErrorMessage: string;
  end;

implementation

{ IEmptyTextValidator }

function TEmptyTextValidator.GetErrorMessage: string;
begin
  Result := 'Wartość nie może być pusta.';
end;

function TEmptyTextValidator.Validate: Boolean;
begin
  Result := False;
end;

end.
