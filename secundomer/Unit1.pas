unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Vcl.Imaging.jpeg,IniFiles,DateUtils;

type
  TForm1 = class(TForm)
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Timer1: TTimer;
    Label4: TLabel;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Timer2: TTimer;
    Edit4: TEdit;
    Button3: TButton;
    Button4: TButton;
    Edit5: TEdit;
    Edit6: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Timer3: TTimer;
    Edit7: TEdit;
    Button5: TButton;
    Button6: TButton;
    Edit8: TEdit;
    Edit9: TEdit;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
     procedure Timer2Timer(Sender: TObject);
     procedure Timer3Timer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
   min,sec,minn,secc,minnn,seccc: integer;
   Inisoub:TInifile;
   databegin,databeginn,databeginnn:TDateTime;
   status,statuss,statusss:string;
implementation

{$R *.dfm}  



procedure TForm1.Button2Click(Sender: TObject);
var
price:real;
Tprice:real;
begin
 status:='False';
Timer1.Enabled:=False;
price:=StrToFloat(StringReplace(Edit1.Text,'.',',', [ rfReplaceAll, rfIgnoreCase ]));
   Tprice:= min*price;
   Label3.Caption:= FloatToStr(Tprice);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
statuss:='True';
databeginn:=Now;//���� ������
minn:=0;
secc:=0;
Label10.Caption:= '0';
 Timer2.Enabled:=True;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
pricee:real;
Tpricee:real;
begin
statuss:='False';
Timer2.Enabled:=False;
 pricee:=StrToFloat(StringReplace(Edit4.Text,'.',',', [ rfReplaceAll, rfIgnoreCase ]));
   Tpricee:= minn*pricee;
    Label10.Caption:= FloatToStr(Tpricee);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
statusss:='True';
databeginnn:=Now;//���� ������
Label15.Caption:= '0';
minnn:=0;
seccc:=0;
 Timer3.Enabled:=True;
end;

procedure TForm1.Button6Click(Sender: TObject);
var
 pricee:real;
Tpricee:real;
begin
statusss:='False';
Timer3.Enabled:=False;
 pricee:=StrToFloat(StringReplace(Edit7.Text,'.',',', [ rfReplaceAll, rfIgnoreCase ]));
   Tpricee:= minnn*pricee;
    Label15.Caption:= FloatToStr(Tpricee);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Inisoub:=TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Config.ini');
 Inisoub.WriteString('option','Edit1',Edit1.Text);
 Inisoub.WriteString('option','Edit4',Edit4.Text);
 Inisoub.WriteString('option','Edit7',Edit7.Text);

 Inisoub.WriteString('option','enabled',status);
 Inisoub.WriteString('option','enabled1',statuss);
 Inisoub.WriteString('option','enabled2',statusss);

 Inisoub.WriteString('option','data',DateTimeToStr(databegin));
 Inisoub.WriteString('option','data1',DateTimeToStr(databeginn));
 Inisoub.WriteString('option','data2',DateTimeToStr(databeginnn));

 Inisoub.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

Inisoub:=TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Config.ini');
Edit1.Text:=IniSoub.ReadString('option','Edit1','');
Edit4.Text:=IniSoub.ReadString('option','Edit4','');
Edit7.Text:=IniSoub.ReadString('option','Edit7','');


status:=IniSoub.ReadString('option','enabled','');
statuss:=IniSoub.ReadString('option','enabled1','');
statusss:=IniSoub.ReadString('option','enabled2','');

if(status='True')then
begin
databegin:=StrToDateTime(IniSoub.ReadString('option','data',''));
min:=MinutesBetween(Now,databegin);
sec:=0;
 Timer1.Enabled:=True;
end;

 if(statuss='True')then
begin
databeginn:=StrToDateTime(IniSoub.ReadString('option','data1',''));
minn:=MinutesBetween(Now,databeginn);
secc:=0;
 Timer2.Enabled:=True;
end;

if(statusss='True')then
begin
databeginnn:=StrToDateTime(IniSoub.ReadString('option','data2',''));
minnn:=MinutesBetween(Now,databeginnn);
seccc:=0;
 Timer3.Enabled:=True;
end;


  Inisoub.Free;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
status:='True';
databegin:=Now;//���� ������
Label3.Caption:= '0';
min:=0;
sec:=0;
 Timer1.Enabled:=True;
end;


procedure TForm1.Timer1Timer(Sender: TObject);
begin
sec:=sec+1;
if sec>=60 then begin
  sec:=0;
  min:=min+1
end;

Edit2.Text:=IntToStr(min);
Edit3.Text:=IntToStr(sec);
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
secc:=secc+1;
if secc>=60 then begin
  secc:=0;
  minn:=minn+1
end;

Edit5.Text:=IntToStr(minn);
Edit6.Text:=IntToStr(secc);
end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
seccc:=seccc+1;
if seccc>=60 then begin
  seccc:=0;
  minnn:=minnn+1
end;

Edit8.Text:=IntToStr(minnn);
Edit9.Text:=IntToStr(seccc);
end;


end.
