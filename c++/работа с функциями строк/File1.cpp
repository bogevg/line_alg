#include <iostream> // cin, cout
#include <windows.h>
using namespace std;
int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);
    char c, c1;
    char ln = '\n';
    char s[] = "���� ����� C++";
    char s1[31];
    char s2[11];
    char* ps;
    int i1, i = 0;
	double r = 0.0;
	do {
        cout << "������ �� �������� ���� s[] \n"
             << "������� ��������������:\n"
             << "  d - ���.����� � ������ � �������\n"
             << "  i - ������ ����� � ������ � �������\n"
             << "  + - ������������ �����\n"
             << "  f - ����� ��������� � ������\n"
             << "  = - ��������� ���� �����\n"
             << "  c - ����������� ����� ������ � ������\n"
             << "variant> ";
        cin >> c;
        getchar(); // ������� '\n' (Enter)
		switch (c) {
			case 'd': {
				cout << "������� ������������ ����� : ";
				cin.getline(s1,sizeof(s1));
				cin.clear();
				r=atof(s1);
				gcvt(r,sizeof(s2)-1,s2);
				cout<<"�������� :"<<s2<<ln;
				break;
            }
			case 'i':{
				cout << "������� ����� ����� : ";
				cin.getline(s1,sizeof(s1));
				cin.clear();
				i = atoi(s1);
				itoa(i,s2,sizeof(s2)-1);
				cout<<"�������� :"<<s2<<ln;
				break;
			}
			case '+': {
				cout << "������� s1 (�� ����� 29 ��������) : ";
				cin.getline(s1,sizeof(s1));
				cin.clear();
				if (strlen(s1) > 29) {
					cout << "out of rahge"<< ln;
					break;
				}
				cout << "������� s2 (� ����� �������� �� ������ ���� ������ 30): ";
				cin.getline(s2,sizeof(s2));
				cin.clear();
				strcat(s1,s2);
				cout << s1 << ln;
				break;
			}
			case 'f':{
				cout << "������� s1 : ";
				cin.getline(s1,sizeof(s1));
				cin.clear();
				cout << "������� s2 : ";
				cin.getline(s2,sizeof(s2));
				cin.clear();
				ps = nullptr;
				ps = strstr(s1,s2);
				if (ps) {
					cout << "�����. " << ps << " ����� =  "<< strlen(ps)<<" ������� = "<< ps - s1<< ln;
				}
				else{
					cout << "�� �����.\n";
                }
				break;
			}
			case '=': {
				cout << "������� s1 : ";
				cin.getline(s1,sizeof(s1));
				cin.clear();
				cout << "������� s2 : ";
				cin.getline(s2,sizeof(s2));
				cin.clear();
				cout << "i : ";
			    cin >> i;
			  //	i1 = strncmp(s1,s2,i);
				if (strncmp(s1,s2,i)) {
					cout <<"�� ���������" <<ln;
				}
				else{
					cout<<"���������" <<ln;
                }
				break;
			}
			case 'c': break;
			default : cout<<"������ � �������\n";
		}
		system("pause");
	}  while (1);

    return 0;
}

