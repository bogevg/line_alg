#include <stdio.h>
#include <windows.h>

int main()
{
	SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
    __int8 c1;
	int i;
    float r1;
    double r2;
    char c;
	short j;
	unsigned char c3;
	printf("size int = %i byte\n",sizeof(i));
	printf("size short = %i byte\n",sizeof(j));
	printf("size float = %d byte\n",sizeof(r1));
	printf("size double = %d byte \n",sizeof(r2));
	printf("size char = %d byte \n",sizeof(c));
    while (1)
    {
		printf("������� ������ : ");
		scanf("%c",&c);
		getc(stdin);//�������� #10
		printf("c= %d %c\n",c,c);
        printf("c+25 = %d\n", c+25);
		printf("������� ������ : ");
		//c=getc(stdin);
		scanf("%c",&c3);
		printf("c3= %d %c\n",c3,c3);
    	system("pause");
    }
    getc(stdin);
	//return 0;
}
