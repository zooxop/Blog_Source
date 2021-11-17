unit uRemoveCharDecimal_Test;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    function RemoveDecimal(const aString: string): string;
    procedure RemoveChar(var s: string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  sValue :String;
begin
  sValue := Edit1.Text;
  RemoveChar(sValue);
  showmessage(sValue);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ShowMessage(RemoveDecimal(Edit1.Text));
end;

procedure TForm1.RemoveChar(var s: string);
var
  i, j: Integer;
  pc: PChar;
begin
  j := 0;
  pc := PChar(@s[1]);
  for i := 0 to Length(s) - 1 do
  begin
    if not (pc[i] in ['0'..'9']) then
      Inc(j)
    else
      pc[i - j] := pc[i];
  end;
  SetLength(s, Length(s) - j);
end;

function TForm1.RemoveDecimal(const aString: string): string;
var
  C:Char; Index:Integer;
begin
  Result := '';
  SetLength(Result, Length(aString));
  Index := 1;
  for C in aString do
  begin
    if not CharInSet(C, ['0' .. '9']) then
    begin
      Result[Index] := C;
      Inc(Index);
    end;
  end;
  SetLength(Result, Index-1);

end;

end.
