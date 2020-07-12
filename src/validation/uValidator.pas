unit uValidator;

interface

type
  IValidator = interface(IInterface)
    function Validate: Boolean;
    function GetErrorMessage: String;
  end;

implementation

end.
