program FreeAndNil_Test;

uses
  Vcl.Forms,
  uFreeAndNil_Test in 'uFreeAndNil_Test.pas' {FormFreeAndNil};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormFreeAndNil, FormFreeAndNil);
  Application.Run;
end.
