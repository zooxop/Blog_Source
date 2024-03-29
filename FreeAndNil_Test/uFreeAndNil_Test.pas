unit uFreeAndNil_Test;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFormFreeAndNil = class(TForm)
    ButtonExecTwice: TButton;
    ButtonFreeAndFreeAndNil: TButton;
    ButtonIndividually: TButton;
    ButtonReuse: TButton;
    procedure ButtonExecTwiceClick(Sender: TObject);
    procedure ButtonFreeAndFreeAndNilClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ButtonIndividuallyClick(Sender: TObject);
    procedure ButtonReuseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFreeAndNil: TFormFreeAndNil;

implementation

{$R *.dfm}

procedure TFormFreeAndNil.ButtonIndividuallyClick(Sender: TObject);
var
  myList :TList;
begin
  myList := TList.Create;

  myList.Free;

  myList := nil;

  //It is not create Error even if the order changed.
end;

procedure TFormFreeAndNil.ButtonReuseClick(Sender: TObject);
var
  myStringList :TStringList;
begin
  myStringList := TStringList.Create;

  myStringList.Add('Item1');
  myStringList.Add('Item2');

  myStringList.free;

  //Check the object is freed.
  if PULONG_PTR(PByte(myStringList) - sizeof(ULONG_PTR))^ and 1 <> 0 then
    showmessage('myStringList is Freed.');

  myStringList.Add('Item3');  //This line is not create error.

  //ReCheck but It is still free
  if PULONG_PTR(PByte(myStringList) - sizeof(ULONG_PTR))^ and 1 <> 0 then
    showmessage('myStringList is Freed.');

  ShowMessage(myStringList[0]);    //message : "Item3"

  FreeAndNil(myStringList);

  myStringList.Add('Item4');  //This line is create Error : "Invalid pointer operation."

  //myStringList 의 메모리는 해제되었지만, 여전히 TStringList 로서의 기능은 작동을 한다. (Free를 해줬음에도, Add() 가 작동함.)
  //하지만 Free 시켜주기 전에 Add 해주었던 Item 2개는 초기화 되었음을 확인할 수 있다. (myStringList[0] 을 출력했을 때, "Item3" 이 출력됨.)
  //FreeAndNil 을 호출한 뒤 Add 를 하면 Runtime Error가 발생하는것을 확인할 수 있다.
  //-> 객체가 nil을 point 하도록 FreeAndNil 이 처리해주었기 때문에, 더이상 TStirngList 로서의 작동을 할 수 없다.
  //--> 따라서 Free 만을 사용하는 경우, 런타임 에러는 없지만 개발자가 예상하지 못한 에러가 발생할 가능성이 커질 것으로 생각한다.
  //---> 가급적이면 FreeAndNil 을 사용하여 메모리를 해제하고, 객체를 사용하기 전에는 Assigned(TObject) Function을 활용하여 런타임 에러를 피하자.
end;

procedure TFormFreeAndNil.ButtonExecTwiceClick(Sender: TObject);
var
  myList :TList;
begin
  myList := TList.Create;

  //FreeAndNil myList object.
  FreeAndNil(myList);

  //Again but safety : it ignores nil objects.
  FreeAndNil(myList);
end;

procedure TFormFreeAndNil.ButtonFreeAndFreeAndNilClick(Sender: TObject);
var
  myList :TList;
begin
  myList := TList.Create;

  //Only "Free" myList object.
  myList.Free;

  //It create Error "Invalid pointer operation" : FreeAndNil() is ignore "nil objects"
  //but, myList is still point [TList]. => Not "nil objects"
  FreeAndNil(myList);

  //Memo : Execute Twice "myList.Free" is create same error content. (Invalid pointer operation)
end;

procedure TFormFreeAndNil.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
