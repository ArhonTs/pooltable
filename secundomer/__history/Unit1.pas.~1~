unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    Timer1: TTimer;            
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  hour, min, sec: integer;

implementation

{$R *.dfm}  

procedure TForm1.FormCreate(Sender: TObject);
begin
  hour:=0;
  min:=0;
  sec:=0;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
if Timer1.Enabled=False
then begin
  Timer1.Enabled:=True;
  Button1.Caption:='Стоп'
end else begin
  Timer1.Enabled:=False;
  Button1.Caption:='Старт'
end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
sec:=sec+1;
if sec>=60 then begin
  sec:=0;
  min:=min+1
end;
if min>=60 then begin
  min:=0;
  hour:=hour+1
end;

Edit1.Text:=IntToStr(hour);
Edit2.Text:=IntToStr(min);
Edit3.Text:=IntToStr(sec);
end;

end.
