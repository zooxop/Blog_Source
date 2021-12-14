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
    elapsed := stopwatch.elapsed;  //stopWatch �� �ð� ����� elapsed ��ü�� ����.

    seconds := elapsed.TotalSeconds;  //double���� �ʴ��� �ð��� return.

    Showmessage(FloatToStr(seconds));   //e.g.) 0.0014983 ǥ��.
  finally
    stopWatch.Stop;
  end;
end;

end.
