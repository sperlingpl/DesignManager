unit uValidator;

interface

type
  IValidator<T> = interface(IInterface)
    function Validate(const Value: T): Boolean;
    function GetErrorMessage: String;
  end;

implementation

end.
