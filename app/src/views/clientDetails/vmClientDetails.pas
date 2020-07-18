unit vmClientDetails;

interface

uses
  uViewModel, uValidationItem;

type
  TClientDetailsVM = class
  private
    FName: TValidationItem<String>;
    FOnCanSaveChanged: TOnPropertyChanged<Boolean>;

    procedure SetName(const Value: String);
    function GetName: String;
    function GetCanSave: Boolean;

  public
    constructor Create;
    destructor Destroy; override;

    property Name: String read GetName write SetName;
    property CanSave: Boolean read GetCanSave;
    property OnCanSaveChanged: TOnPropertyChanged<Boolean> read FOnCanSaveChanged write FOnCanSaveChanged;
  end;

implementation

uses
  uEmptyTextValidator;

{ TClientDetailsVM }

constructor TClientDetailsVM.Create;
begin
  FName := TValidationItem<String>.Create(TEmptyTextValidator.Create);
end;

destructor TClientDetailsVM.Destroy;
begin
  FName.Free;
  inherited;
end;

function TClientDetailsVM.GetCanSave: Boolean;
begin
  Result := False;
end;

function TClientDetailsVM.GetName: String;
begin
  Result := FName.Value;
end;

procedure TClientDetailsVM.SetName(const Value: String);
begin
  FName.Value := Value;
  OnCanSaveChanged(FName.Validate);
end;

end.
