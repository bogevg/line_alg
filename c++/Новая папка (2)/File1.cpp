#include <iostream>
#include <windows.h>
using namespace std;

int main()
{   do {
    SetConsoleCP(1251);
	SetConsoleOutputCP(1251);
    char c;
    char ln ='\n';
	char sch[1000] = "������, ����!"; // ��� ������ �������� ��� 999 ��������
    char sch1[20];
    char sch2[10]; //������� '\0'
    char* psch;
    int i=257;
	double r=3.14;

    cout<< "sch : "<<sch <<" size"<<size(sch)<<" sizeof"<<
	sizeof(sch)<< " ����� strlen(sch)"<<strlen(sch)<<ln;

/*	cin >> sch2;
	cout << sch2 << ln;
	cout << *(&sch2[0] - 1)<< ln;
    cin.getline(sch1,10);// ������!
	cout<< sch1<<ln;

    cin>>sch1;// ���� ���� 12345
	cout<<sch1<<ln;// ����



	system("pause");

    cout<<"������� ������ sch2[10] scanf('%7s',sch2) \n"; //I want to know C++
    scanf("%7s",sch2);
    cout<<sch2<<" ����� "<<strlen(sch2)<<endl;
    cout<<"Stop 2\n";
		//scanf ������������ � �������� ��� cin<<       */


    cout<<"������� ������ sch1[20] ���������� cin \n"; //I want to know C++
    cin>>sch1;//a - �� �������, � - ����� �� �������
    cout<<" sch1 "<<sch1<<" !!! "<<ln;
    cout<<"sch1 :"<<sch1<<" sch :"<<sch<<endl;
    cout<<"������������ \n";
    strcat(sch1,sch);
    cout<< "sch1+sch : "<<sch1 <<" size"<<size(sch1)<<" sizeof"<<
    sizeof sch1<< " �����"<<strlen(sch1)<<ln;
	cout<<"Stop 3 strcopy \n";


	} while (1);
}
