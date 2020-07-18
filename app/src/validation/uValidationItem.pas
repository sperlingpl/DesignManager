unit uValidationItem;

interface

uses
  uValidator;

type
  TValidationItem<T> = class
  private
    FValidator: IValidator<T>;
    FValue: T;

  public
    constructor Create(const Validator: IValidator<T>);
    property Value: T read FValue write FValue;
    function Validate: Boolean;
  end;

implementation

{ TValidationItem<T> }

constructor TValidationItem<T>.Create(const Validator: IValidator<T>);
begin
  FValidator := Validator;
end;

function TValidationItem<T>.Validate: Boolean;
begin
  Result := FValidator.Validate(FValue);
end;

end.
