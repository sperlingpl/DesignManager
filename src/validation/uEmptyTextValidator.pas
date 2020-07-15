unit uEmptyTextValidator;

interface

uses
  uValidator;

type
  TEmptyTextValidator = class(TInterfacedObject, IValidator<String>)

  public
    function Validate(const Value: String): Boolean;
    function GetErrorMessage: string;
  end;

implementation

{ IEmptyTextValidator }

function TEmptyTextValidator.GetErrorMessage: string;
begin
  Result := 'Wartość nie może być pusta.';
end;


function TEmptyTextValidator.Validate(const Value: String): Boolean;
begin
  Result := Value <> '';
end;

end.
