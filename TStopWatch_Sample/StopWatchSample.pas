unit StopWatchSample;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Diagnostics, System.TimeSpan;

type
  TForm1 = class(TForm)
    ButtonTest: TButton;
    procedure ButtonTestClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ButtonTestClick(Sender: TObject);
var
  stopWatch :TStopWatch;  //System.Diagnostics
  elapsed: TTimeSpan;     //System.TimeSpan
  i :integer;
  seconds :Double;
begin
  try
    stopwatch := TStopwatch.StartNew;
    for i := 0 to 1000000 do
    begin
      //doSomething..
    end;
    elapsed := stopwatch.elapsed;  //stopWatch 의 시간 경과를 elapsed 객체에 저장.

    seconds := elapsed.TotalSeconds;  //double으로 초단위 시간을 return.

    Showmessage(FloatToStr(seconds));   //e.g.) 0.0014983 표시.
  finally
    stopWatch.Stop;
  end;
end;

end.
