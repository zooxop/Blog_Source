unit GenericSample;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TSample<T> = class  // T : Type. Object type도 인자로 받을 수 있다.
    private
      FValue :T;
    public
      function GetValue :T;
      procedure SetValue(param :T);
      property Value :T  read GetValue write SetValue;
  end;

  TStrHashMap<TSTRING, TValue> = class(TStringList)
    private  
      FKey :array of string;
      FValue :array of TValue;
    public

    function Add(pKey :string; pValue :TValue) :Integer;  
    //function Add(pKey, pValue :T) :Integer;
  end;

  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ THashMap<TKey, TValue> }



procedure TForm1.Button1Click(Sender: TObject);
var
  GenTestInt :TSample<Integer>;
  GenTestStr :TSample<string>;
begin
  //Integer Type
  GenTestInt := TSample<Integer>.Create;
  GenTestInt.Value := 1;
  ShowMessage(IntToStr(GenTestInt.GetValue));

  //String Type
  GenTestStr := TSample<string>.Create;
  GenTestStr.Value := '1';
  ShowMessage(GenTestStr.GetValue);
end;

{ THashMap<Integer> }

function TSample<T>.GetValue: T;
begin
  Result := FValue;
end;

procedure TSample<T>.SetValue(param: T);
begin
  FValue := param;
end;

{ TStrHashMap<TSTRING, TValue> }

function TStrHashMap<TSTRING, TValue>.Add(pKey: string; pValue: TValue): Integer;
begin

end;


end.
