unit TStringListDelimeter_Test;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  sList :TStringList;
begin
  try
    sList := TStringList.Create;
    sList.Delimiter := '|';
    sList.DelimitedText := 'AAA|BB B|CCC|DDD|EEE';

    Memo1.Lines.Clear;
    Memo1.Lines := sList;

  finally
    sList.Free;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  sList :TStringList;
begin
  try
    sList := TStringList.Create;
    sList.Delimiter := '|';
    sList.DelimitedText := 'AAA|BBB|CCC|DDD|EEE';

    Memo1.Lines.Clear;
    Memo1.Lines.Text := sList.CommaText;

  finally
    sList.Free;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  sList :TStringList;
  idx :Integer;
begin
  try
    sList := TStringList.Create;
    sList.LineBreak := '<>';
    sList.Text := 'AAA<>BBB<>CCC<>DDD<>EEE';

    Memo1.Lines.Clear;
    Memo1.Lines := sList;

  finally
    sList.Free;
  end;
end;

end.
