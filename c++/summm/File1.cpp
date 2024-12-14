#include <iostream>
#include <tchar.h>
using namespace std;

int main()
{
	int i,n;
	char ln = '\n';
	i = 0; n = 0;

	do
		i += ++n;
	while (i <= 1000);

	cout << n << " " << i << ln;

	if (i> 1000) i = 5, n = 3, cout << n+i << ln;
	cin >> i;

}
