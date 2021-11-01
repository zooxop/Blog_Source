unit uEnum_sample;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TMyColor = (mcRed, mcBlue, mcYellow = 5, mcBlack = mcBlue + mcYellow);

  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    function getColorName(mcColor :TMyColor) :string;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  eColor :TMyColor;
begin
  eColor := TMyColor(5);
  showmessage(getColorName(eColor));

  if eColor in [mcRed..mcBlue] then
    ShowMessage('1')
  else
  if eColor in [mcYellow..mcBlack] then
    ShowMessage('2');
end;

function TForm1.getColorName(mcColor: TMyColor): string;
begin
  case mcColor of
    mcRed: Result := 'Red';
    mcBlue: Result := 'Blue';
    mcYellow: Result := 'Yellow';
    mcBlack: Result := 'Black';
  end;
end;

end.
