unit uValidationItem;

interface

uses
  uValidator;

type
  TValidationItem<T> = class
  private
    FValidator: IValidator;
    FValue: T;

  public
    constructor Create(const Validator: IValidator);
    property Value: T read FValue write FValue;
    function Validate: Boolean;
  end;

implementation

{ TValidationItem<T> }

constructor TValidationItem<T>.Create(const Validator: IValidator);
begin
  FValidator := Validator;
end;

function TValidationItem<T>.Validate: Boolean;
begin
  Result := FValidator.Validate;
end;

end.
