unit TestEmptyTextValidator;

interface
uses
  DUnitX.TestFramework, uEmptyTextValidator;

type

  [TestFixture]
  TMyTestObject = class(TObject)
  private
    Validator: TEmptyTextValidator;

  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    [TestCase('Is empty', '')]
    [TestCase('Is empty when spaces', '         ')]
    procedure TestValidateEmpty(const Value: String);

    [Test]
    [TestCase('Is not empty', 'Hello')]
    [TestCase('Is not empty with leading spaces', '     Hello')]
    [TestCase('Is not empty with leading and trailing spaces', '    Hello     ')]
    [TestCase('Is not empty with national characters', 'łąćżźóść')]
    procedure TestValidateNotEmpty(const Value: String);
  end;

implementation

procedure TMyTestObject.Setup;
begin
  Validator := TEmptyTextValidator.Create;
end;

procedure TMyTestObject.TearDown;
begin
end;

procedure TMyTestObject.TestValidateEmpty(const Value: String);
begin
  Assert.IsFalse(Validator.Validate(Value));
end;

procedure TMyTestObject.TestValidateNotEmpty(const Value: String);
begin
  Assert.IsTrue(Validator.Validate(Value));
end;

initialization
  TDUnitX.RegisterTestFixture(TMyTestObject);
end.
