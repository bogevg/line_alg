#include <iostream>
#include <tchar.h>

using namespace std;

int main()
{
	int n,ss,c;
	char s[10];
	while (1) {
		cout << "Enter n: ";
		cin >> n;
		cout << "Enter ss: ";
		cin >> ss;
		c = 0;

		while ( n > 0){
			s[c]= char((n % ss)+48);
			n/=ss;
			++c;
		}


		for (c = c-1; c >= 0 ; c--) {
			cout << s[c];
			s[c] =' ';
		}
		cout << "\n";
	}
}
