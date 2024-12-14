#include <iostream>
#include <windows.h>
using namespace std;

int main()
{   do {
    SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
    char c;
    char ln ='\n';
	char sch[1000] = "Привет, всем!"; // это массив символов для 999 символов
    char sch1[20];
    char sch2[10]; //включая '\0'
    char* psch;
    int i=257;
	double r=3.14;

    cout<< "sch : "<<sch <<" size"<<size(sch)<<" sizeof"<<
	sizeof(sch)<< " Длина strlen(sch)"<<strlen(sch)<<ln;

/*	cin >> sch2;
	cout << sch2 << ln;
	cout << *(&sch2[0] - 1)<< ln;
    cin.getline(sch1,10);// Привет!
	cout<< sch1<<ln;

    cin>>sch1;// Наша Маша 12345
	cout<<sch1<<ln;// Наша



	system("pause");

    cout<<"Введите строку sch2[10] scanf('%7s',sch2) \n"; //I want to know C++
    scanf("%7s",sch2);
    cout<<sch2<<" Длина "<<strlen(sch2)<<endl;
    cout<<"Stop 2\n";
		//scanf чувствителен к пробелам как cin<<       */


    cout<<"Введите строку sch1[20] оператором cin \n"; //I want to know C++
    cin>>sch1;//a - до пробела, б - выход за границу
    cout<<" sch1 "<<sch1<<" !!! "<<ln;
    cout<<"sch1 :"<<sch1<<" sch :"<<sch<<endl;
    cout<<"Конкатенация \n";
    strcat(sch1,sch);
    cout<< "sch1+sch : "<<sch1 <<" size"<<size(sch1)<<" sizeof"<<
    sizeof sch1<< " Длина"<<strlen(sch1)<<ln;
	cout<<"Stop 3 strcopy \n";


	} while (1);
}
