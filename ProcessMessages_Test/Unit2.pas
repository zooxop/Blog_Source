unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    ButtonWork: TButton;
    Memo1: TMemo;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ButtonWorkClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    WorkLevel : integer;
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  i :Integer;
begin

  for i := 0 to 100 do
  begin
    {Insert Into ....}
    Memo1.Lines.Add(IntToStr(i));
    Application.ProcessMessages;
    Sleep(200);

  end;
  {without Application.ProcessMessages : for문이 끝날때까지 Application은 Lock 상태가 된다.}
  {with Application.ProcessMessages : Sleep 시간을 제외하고는 원활하게 프로그램을 옮기거나 할 수 있다.}
end;

procedure TForm2.ButtonWorkClick(Sender: TObject);
var
  cycle : integer;
begin
  inc(WorkLevel) ;
  for cycle := 1 to 5 do
  begin
    Memo1.Lines.Add('- Work ' + IntToStr(WorkLevel) + ', Cycle ' + IntToStr(cycle) );
    Application.ProcessMessages;
    sleep(1000) ; // or some other work
  end;
  Memo1.Lines.Add('Work ' + IntToStr(WorkLevel) + ' ended.') ;
  dec(WorkLevel) ;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  WorkLevel := 0;
end;

end.
