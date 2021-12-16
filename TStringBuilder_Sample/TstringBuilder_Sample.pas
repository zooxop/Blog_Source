unit TstringBuilder_Sample;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Diagnostics, System.TimeSpan;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    stopWatch :TStopWatch;  //System.Diagnostics

  public
    { Public declarations }

    procedure WatchStart;
    procedure WatchStop;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  I :Integer;
  StringBuilder :TStringBuilder;
  sString :String;
begin
  //����ϴ� Memory �� �׽�Ʈ

  StringBuilder := TStringBuilder.Create;
  try
    for I := 1 to 10 do
    begin
      StringBuilder.Append('a string ');
      StringBuilder.Append(66); //Integer type �����͸� ����ȯ ���� �Է� ����.
      StringBuilder.Append(sLineBreak); //add new line(����), 2byte
    end;

    //StringBuilder�� ���� ũ��(Byte) ���.
    showMessage('Final string builder length: ' + IntToStr(StringBuilder.Length));

    // ToString ���� ������ ���.
    showmessage(StringBuilder.ToString);
  finally
    StringBuilder.Free;
  end;

  sString := '';
  for I := 1 to 10 do
  begin
    sString := sString + 'a string ';
    sString := sString + IntToStr(66);
    sString := sString + sLineBreak;
  end;

  showmessage('Final string length: ' + IntToStr(Length(sString)));

  // ����ϴ� Memory ������
  // TStringBuilder�� String�� ������ ���� �� �� �ִ�.

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  I, Idx :Integer;
  StringBuilder :TStringBuilder;
  sString :String;
begin
  //���� �ð� �� �׽�Ʈ

  Memo1.Lines.Add('1. TStringBuilder');
  for idx := 1 to 10 do
  begin
    StringBuilder := TStringBuilder.Create;
    WatchStart;
    try
      for I := 1 to 10000000 do
      begin
        StringBuilder.Append('a');
      end;
      WatchStop;

    finally
      StringBuilder.Free;
    end;
  end;

  Memo1.Lines.Add('');

  Memo1.Lines.Add('2. String');
  for idx := 1 to 10 do
  begin
    sString := '';
    WatchStart;
    for I := 1 to 10000000 do
    begin
      sString := sString + 'a';
    end;
    WatchStop;
  end;

end;

procedure TForm1.WatchStart;
begin
  stopwatch := TStopwatch.StartNew;
end;

procedure TForm1.WatchStop;
var
  elapsed: TTimeSpan;
  seconds :Double;
begin
  stopWatch.Stop;
  elapsed := stopwatch.elapsed;
  seconds := elapsed.TotalSeconds;
  Memo1.Lines.Add(FloatToStr(seconds));
end;

end.
