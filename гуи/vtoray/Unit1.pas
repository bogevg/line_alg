unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Ani;

type
  TForm1 = class(TForm)
    Button1: TButton;
    FloatKeyAnimation1: TFloatKeyAnimation;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  tree = class
    private
    name: ansistring;
    quantity, square: uint16;
    public
  end;


var
  Form1: TForm1;


implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
   var newbutton: Tbutton;
begin
  //new (newbutton);
  newbutton.create(self);
  newbutton.Parent:= self;
  newbutton.Height :=  30;
  newbutton.Margins.left:= 50;
  newbutton.margins.top:= 50;
  form1.ActiveControl:=newbutton;

end;

end.
