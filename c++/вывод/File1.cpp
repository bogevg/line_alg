#include <iostream>
#include <windows.h>
#include  <iomanip>

using namespace std;
int main()
{
  SetConsoleCP(1251);
  SetConsoleOutputCP(1251);
  double a = -112.023456789;
  double b = 4.98239811122233;
  int c = 18;
  char ch = 'f';
  bool b1;

/*  cout.width(10);   // �������� ������ �� 1 ���
  cout << c << endl;
  cout << c << endl;
  /////
  cout<<"//////////\n";
  cout.fill('0');
  cout.width(10);
  cout<<c<<endl;
  cout.fill(' ');
  cout<<setfill('+')<<endl;

   ///
  cout<<"//////////\n";
  cout << setw(10)<<c<<"   "<<setw(20)<<c<<endl;
  cout<<left<<setw(20)<<b<<c<<endl;
  cout<<internal<<setw(20)<<c<<endl;
  cout<<"//////////\n";
  cout << setw(10)<<c<<"   "<<setw(20)<<c<<endl;
  cout<<left<<setw(20)<<c<<c<<endl;
  cout<<internal<<setw(20)<<-c<<endl;
  /////
//  cout<<setfill('_')<<setw(20)<<c<<endl;
	cout<<"//////////\n";
    cout << b<< endl;
	cout.precision(7);
	cout << b<< endl;
	cout << a<< endl;
	cout.precision(6);
	cout << b<< endl;
	cout << a<< endl;
	cout.precision(2);
	cout << b / 2<< endl;
	///
	cout<<setprecision(7)<<fixed<<a<<"   "<<b<<endl;
	cout<<showpos<< c <<endl<< c<<endl<<-c<<endl;
	cout<< noshowpos<<c <<endl;
	///
	cout<<"//////////\n";
	cout<<scientific<<a<<endl<<b<<endl;
    cout<<scientific<<setprecision(3)<<a<<endl<<b<<endl;
	cout<<setprecision(7)<< fixed;
	cout <<"����� setprecision(7)<< fixed  \n"<< a<< endl;
	cout<<scientific<<setprecision(3)<<123453456780.0<<endl;
    cout<<setprecision(3)<< fixed;
    cout<<"//////////\n";
    cout<<showbase<<hex<<c<<endl;
	cout<<showbase<<dec<<c<<endl;
	cout<<showbase<<oct<<c<<endl;
	cout<<showbase<<hex;
	cout << c << endl<<a<< endl;
	cout<<showbase<<dec;
	//
	cout << resetiosflags(ios_base::floatfield);
	cout << "����� resetiosflags(ios_base::floatfield) \n ";
	cout << a << endl<< b<<endl;    */
	b1 = true;
	cout <<b1<<endl;
    cout << true << endl;
	cout<<boolalpha<<b1<<"	"<<!b1<<"	"<< true<<endl;
	cout<< noboolalpha<<b1<<endl;

  system("pause");

}
