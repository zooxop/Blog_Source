unit FileLoadParsing;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.IOUtils;

const
  ROOT_DIRECTORY = 'C:\apache-tomcat-9.0.39\webapps\ROOT\';

type
  TForm1 = class(TForm)
    ButtonLoadFile: TButton;
    MemoContent: TMemo;
    FileOpenDialog1: TFileOpenDialog;
    MemoNotFounded: TMemo;
    procedure ButtonLoadFileClick(Sender: TObject);
  private
    { Private declarations }
    function getParseContent(FilePath, FileName, TargetStr :String) :string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ButtonLoadFileClick(Sender: TObject);
var
  SL: TStringList;
  Path, File_Str :String;

begin
  if Win32MajorVersion >= 6 then
  begin
    with TFileOpenDialog.Create(nil) do
    begin
      try
        Options := [fdoPickFolders];
        Title := 'Select Directory';
        Options := [fdoPickFolders, fdoPathMustExist, fdoForceFileSystem];
        OkButtonLabel := 'Select';

        if Execute then
        begin
        //한 뎁스 더 들어가서 조회.
//          for Path in TDirectory.GetDirectories(FileName) do
//          begin
//            for File_Str in TDirectory.GetFiles(Path) do
//            begin
//              getParseContent(ExtractFileName(File_Str), File_Str, '설명 :');
//            end;
//          end;

          for File_Str in TDirectory.GetFiles(FileName) do
          begin
            getParseContent(ExtractFileName(File_Str), File_Str, '설명 :');
          end;


        end;

      finally
        Free;
      end;
    end;
  end;
end;

function TForm1.getParseContent(FilePath, FileName, TargetStr: String): string;
var
  sl :TStringList;
  Content, temp :String;
  isFind :Boolean;
begin
  sl := TStringList.Create;
  try
    sl.LoadFromFile(FileName, TEncoding.UTF8);
    for Content in sl do
    begin
      isFind := False;
      if pos(TargetStr, Content) > 0 then
      begin
        isFind := True;
        temp := Trim(Content);
        temp := copy(temp, pos(':', temp) + 2, pos('\n', temp) - pos(':', temp) - 2);
        MemoContent.Lines.add(FilePath + '&&' + temp + '&&' + StringReplace(FileName, ROOT_DIRECTORY, '', [rfReplaceAll]));
        break;
      end;
    end;

    if not isFind then
    begin
      MemoNotFounded.lines.Add(FilePath + '&&' + StringReplace(FileName, ROOT_DIRECTORY, '', [rfReplaceAll]));
    end;
  finally
    sl.Free;
  end;
end;

end.
