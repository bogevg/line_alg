unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    B1: TButton;
    procedure B1Click(Sender: TObject);
  private
    { Private declarations }
  public
    //type recorde pl
      
    
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2;

procedure TForm1.B1Click(Sender: TObject);
begin
// ��������������
if B1.Font.Size < 30 then 
  B1.Font.Size :=  B1.Font.Size +2
else
  B1.Font.Size :=  15;
 // Form2.Show; // ��������� ����� ����, �� �� ��������� ����������
  Form1.Visible := false;
  Form2.Show;

end;

end.
