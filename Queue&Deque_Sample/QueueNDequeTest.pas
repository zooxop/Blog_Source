unit QueueNDequeTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Generics.Collections;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
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

procedure TForm1.Button1Click(Sender: TObject);
var
  Queue :TQueue<String>;  //System.Generics.Collections
begin
  try
    Queue := TQueue<String>.Create; //Queue 생성

    { Enqueue() : queue의 끝에 item을 추가한다. }
    Queue.Enqueue('John');
    Queue.Enqueue('Mary');
    Queue.Enqueue('Bob');
    Queue.Enqueue('Anna');
    Queue.Enqueue('Erica');

    { Peek() : 가장 먼저 추가한 요소를 삭제없이 리턴한다.}
    Memo1.Lines.Add('첫번째 요소 : "' + Queue.Peek());

    { Extract : 가장 먼저 추가한 요소를 삭제한다. }
    Queue.Extract;

    { TrimExcess : Queue의 공간을 재조정(빈공간 해제)한다. }
    Queue.TrimExcess;

    { Count : Queue의 개수를 리턴한다. }
    Memo1.Lines.Add('The queue now contains ' + IntToStr(Queue.Count) + ' elements.');

    { Dequeue() : 가장 먼저 추가한 요소를 리턴 후 삭제한다. }
    Memo1.Lines.Add('First enqueued element was: "' + Queue.Dequeue() + '".');

    Queue.Clear;  //Clear the Queue

  finally
    Queue.Free;  //Queue를 Destroy한다.
  end;
end;

end.
