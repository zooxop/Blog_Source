program Enum_sample;

uses
  Vcl.Forms,
  uEnum_sample in 'uEnum_sample.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
