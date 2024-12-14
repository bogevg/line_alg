#include <stdio.h>
#include <windows.h>

int main()
{
    SetConsoleCP(1251);
	SetConsoleOutputCP(1251);

   int i,j,n;
    m:
    printf("Enter i = ");
    scanf("%d", &i);
    printf("Enter j = ");
    scanf("%d", &j);
    printf("i+j = %d\n", i+j);
    printf("i-j = %d\n", i - j);
	printf("i*j = %d\n", i * j);
	printf("i mod j = %d\n",i % j);
    printf("i/j = %f\n", (float)i / j);
    goto m;
	getch();
	//return 0;


}
