#include <iostream>
#include <tchar.h>
#include <windows.h>
using namespace std;

int main()
{
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	string s;
	char c,e;
	e = '\n';
	double a,b;
	cout<< "" ;
	while (1){
		cout << "Enter numder (C,F,L,G,I,CM)" <<e;
		cin >> a >> c;
		switch (c) {
		case 'C':  {
			b = float(9)/5 * a +32;
			break;
			}
		case 'F':  {
			b = float(5)/9 * (a -32);
			break;
			}
		case 'L':  {
			b = a/3.78541;
			break;
			}
		case 'G':  {
			b = 3.78541*a;
			break;
			}
		case 'I':  {
			b = a / 2.54 ;
			break;
			}
		case 'CM':  {
			b = 2.54 *a;
			break;
			}



        default:
			;
		}
		cout << b<<e;




	};
}
