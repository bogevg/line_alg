#include <stdio.h>
#include <windows.h>

int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);
	int i,j;
	i = 2;
	printf("i = %d\n", i);
	j = i++ ;
	printf("j (i++) = %d\n", j);
	j = ++i;
	printf("j (++i) = %d\n", j);
    getchar();

}
