#include <iostream>
#include <windows.h> //��� SetConsole
int main ( )
{
using namespace std;
SetConsoleCP(1251);
SetConsoleOutputCP(1251);
int i;
unsigned char c,c1;
char c2;
bool b;
char ln='\n';
//
L1:
cout<<"������� ��� (u|i|c|b|s) � �������� : ";
cin>>c1;
switch (c1) {
case 'u':{ scanf("%d",&c);
          b=c;
          c2=c;
          printf("����� %d u������ %c ������ %c ��.����� %d bool %d\n",c,c2,c,c2,b);
        break ;
        }
case 'i':{ scanf("%d",&c2);
          c=c2;
          b=c2;
          printf("����� %d u������ %c ������ %c ��.����� %d bool %d\n",c,c2,c,c2,b);
         break;}
case 'c':{ cin>>c;
          b=c;
          printf("%c ... \n",c);
         break;}
case 'b':{ //scanf("%hhd",&b);
          //boolalpha(cin)
          cin>>b;
          c=b;
          c2=b;
          cout<<boolalpha<<"���������� - "<<b<<ln;
          printf("������ �������� - %hhd .. \n",c);
         break;}
case 's': {system("cls");
           break;}
default:{cout<<"��� ����� �������!"<<endl;
        goto L1;
        }
}// switch
goto L1;
//
system("pause");
}
