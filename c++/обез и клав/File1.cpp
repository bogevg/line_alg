#include <iostream> // cin, cout
#include <windows.h>
#include <string>

using namespace std;

int main()
{
    SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
	string s,s1 = string();
	int i,n,j;
	char c;
	while (1){
	cout <<"������� �����, ������� ����� ������: \n";
	cin >> s;
	n = s.length();
	i = 0, j = 0;
	while(i != n){
		c=(rand()%26+97);
		cout << c;
		if (c == s[i] ) {
			++i;
		}
		else if (c == s[0])
			 {
				i = 1;
			 }
			 else{
				i = 0;
			 };
		++j;
	};
	cout << endl<< "i = "<< j<<endl;
	};
	}
}
