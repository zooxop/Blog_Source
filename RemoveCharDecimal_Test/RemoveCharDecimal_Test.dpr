program RemoveCharDecimal_Test;

uses
  Vcl.Forms,
  uRemoveCharDecimal_Test in 'uRemoveCharDecimal_Test.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
