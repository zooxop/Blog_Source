unit TstringBuilder_Sample;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Diagnostics, System.TimeSpan, Winapi.PsAPI;

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

    function CurrentMemoryUsage :Cardinal;
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
  //사용하는 Memory 비교 테스트

  StringBuilder := TStringBuilder.Create;
  try
    for I := 1 to 10 do
    begin
      StringBuilder.Append('a string ');
      StringBuilder.Append(66); //Integer type 데이터를 형변환 없이 입력 가능.
      StringBuilder.Append(sLineBreak); //add new line(개행), 2byte
    end;

    //StringBuilder의 현재 크기(Byte) 출력.
    showMessage('Final string builder length: ' + IntToStr(StringBuilder.Length));

    // ToString 으로 변수값 출력.
    showmessage(StringBuilder.ToString);
  finally
    StringBuilder.Free;
  end;

  CurrentMemoryUsage;

  sString := '';
  for I := 1 to 10 do
  begin
    sString := sString + 'a string ';
    sString := sString + IntToStr(66);
    sString := sString + sLineBreak;
  end;

  showmessage('Final string length: ' + IntToStr(Length(sString)));

  CurrentMemoryUsage;

  // 차지하는 Memory 공간은 String과 StringBuilder가 동일하지만,
  // String은 + 연산을 통한 return을 받을 때 마다 변수 공간을 새로 할당받으면서
  // 불필요한 Buffer size가 늘어나게 된다.

  // 위처럼 반복을 통해 String 변수 값을 + 연산으로 처리하는 경우는
  // StringBuilder를 사용하는 것이 효율적이다.
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  I, Idx :Integer;
  StringBuilder :TStringBuilder;
  sString :String;
begin
  //동작 시간 비교 테스트

  Memo1.Lines.Add('1. TStringBuilder');
  for idx := 1 to 10 do
  begin
    StringBuilder := TStringBuilder.Create;
    WatchStart;
    try
      for I := 1 to 10000000 do
      begin
        StringBuilder.Append('asdfasdf');
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
      sString := sString + 'asdfasdf';
    end;
    WatchStop;
  end;

end;

function TForm1.CurrentMemoryUsage: Cardinal;
var
  PMCnt :TProcessMemoryCounters;
begin
  PMCnt.cb := SizeOf(PMCnt);
  if GetProcessMemoryInfo(GetCurrentProcess, @PMCnt, SizeOf(PMCnt)) then
    result := PMCnt.WorkingSetSize
  else
    RaiseLastOSError;

  showmessage(UIntToStr(REsult));
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
