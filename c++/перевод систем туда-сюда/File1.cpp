#include <iostream>
#include <tchar.h>
#include <string>
#include <windows.h>
using namespace std;

int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);
	int n,ss,d,i,m;
	string s;
	while (1) {
		cout << "Enter the type of conversions (d or m) : ";
		cin >> s;
	  /*	cout << "s[0] + 0 = " << s[0] + 0<< endl;
		cout << "s[0] + '0' = " << s[0] + '0'<< endl;
		cout << "char(s[0] + 0) = " << char(s[0] + 0)<< endl;
		cout << "s + '0' = " << s + '0'<< endl;   */
		if (s[0] < 97) {
			s[0] = s[0] + 32;
		};
	    cout << s[0] << endl;       //!!!

		switch (s[0]) {
	  //	case 'D':;
		case 'd': {
			cout << "����� ����� ������� �� 10�� ��\n";
			cout << "Enter n: ";
			cin >> n;
			cout << "Enter ss: ";
			cin >> ss;
			s = "";
			while (n > 0){
				d =  n % ss;
				d = d < 10 ? (n % ss)+48 : (n % ss)+55;
				s = char(d) +s;
				n/=ss;
			}
			cout << s;
            break;
			}
    //    case 'M':;
		case 'm':  {
			cout << "����� ����� ������� � 10�� ��\n";
			cout << "Enter n: ";
			cin >> s;
			cout << "Enter ss: ";
			cin >> ss;
			n = 0;
			m = 1;
			for (i = size(s)-1; i >= 0; i--) {
				d = (s[i] < 57)? int(s[i]-48) : int(s[i]-55);
				n += m*d;
				m *= ss;
			}
			cout << n;
			break;
			}
		default:
			cout << "Error \n";
		}
        cout << "\n";

	}
}
