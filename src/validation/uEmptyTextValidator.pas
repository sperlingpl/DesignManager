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

uses
  System.SysUtils;

function TEmptyTextValidator.GetErrorMessage: string;
begin
  Result := 'Wartość nie może być pusta.';
end;


function TEmptyTextValidator.Validate(const Value: String): Boolean;
begin
  Result := Trim(Value) <> '';
end;

end.
