program TStringBuilderSample;

uses
  Vcl.Forms,
  TstringBuilder_Sample in 'TstringBuilder_Sample.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
