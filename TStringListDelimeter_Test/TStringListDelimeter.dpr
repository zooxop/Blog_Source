program TStringListDelimeter;

uses
  Vcl.Forms,
  TStringListDelimeter_Test in 'TStringListDelimeter_Test.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
