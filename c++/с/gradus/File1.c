#include <stdio.h>
#include <windows.h>

int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);
	float f;
    m:
	printf("Enter F: ");
	scanf("%f", &f);
	printf("C = %0.1f\n",(f-32)*(5.0/9));
	goto m;

}
