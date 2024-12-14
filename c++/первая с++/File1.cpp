#include <iostream>
#include <tchar.h>
#include <string>
#include <windows.h>
using namespace std;

int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);
	int n,ss,c,d;
	string s;
	while (1) {
		cout << "Enter the type of conversions (d or m) : ";
		cin >> s;
		switch (s[0]) {
		case 'd': {
			cout << "«десь будет перевод из 10ой сс\n";
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
			cout << s <<"\n";  */
            break;
			}
		case 'm':  {
			cout << "«десь будет перевод в 10ую сс\n";
			cout << "Enter n: ";
			cin >> s;
			cout << "Enter ss: ";
			cin >> ss;


			break;
			}
		default:
			cout << "Error \n";
			;
		}
	}
}
