#include <iostream> // cin, cout
#include <windows.h>
using namespace std;
int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);
    char c, c1;
    char ln = '\n';
    char s[] = "Хочу знать C++";
    char s1[31];
    char s2[11];
    char* ps;
    int i1, i = 0;
	double r = 0.0;
	do {
        cout << "Работа со строками типа s[] \n"
             << "Функции преобразования:\n"
             << "  d - вещ.числа в строку и обратно\n"
             << "  i - целого числа в строку и обратно\n"
             << "  + - конкатенация строк\n"
             << "  f - поиск подстроки в строке\n"
             << "  = - сравнение двух строк\n"
             << "  c - копирование одной строки в другую\n"
             << "variant> ";
        cin >> c;
        getchar(); // удаляет '\n' (Enter)
		switch (c) {
			case 'd': {
				cout << "Введите вещественное число : ";
				cin.getline(s1,sizeof(s1));
				cin.clear();
				r=atof(s1);
				gcvt(r,sizeof(s2)-1,s2);
				cout<<"Проверка :"<<s2<<ln;
				break;
            }
			case 'i':{
				cout << "Введите целое число : ";
				cin.getline(s1,sizeof(s1));
				cin.clear();
				i = atoi(s1);
				itoa(i,s2,sizeof(s2)-1);
				cout<<"Проверка :"<<s2<<ln;
				break;
			}
			case '+': {
				cout << "Введите s1 (не более 29 символов) : ";
				cin.getline(s1,sizeof(s1));
				cin.clear();
				if (strlen(s1) > 29) {
					cout << "out of rahge"<< ln;
					break;
				}
				cout << "Введите s2 (в сумме символов не должно быть больше 30): ";
				cin.getline(s2,sizeof(s2));
				cin.clear();
				strcat(s1,s2);
				cout << s1 << ln;
				break;
			}
			case 'f':{
				cout << "Введите s1 : ";
				cin.getline(s1,sizeof(s1));
				cin.clear();
				cout << "Введите s2 : ";
				cin.getline(s2,sizeof(s2));
				cin.clear();
				ps = nullptr;
				ps = strstr(s1,s2);
				if (ps) {
					cout << "нашли. " << ps << " длина =  "<< strlen(ps)<<" позиция = "<< ps - s1<< ln;
				}
				else{
					cout << "не нашли.\n";
                }
				break;
			}
			case '=': {
				cout << "Введите s1 : ";
				cin.getline(s1,sizeof(s1));
				cin.clear();
				cout << "Введите s2 : ";
				cin.getline(s2,sizeof(s2));
				cin.clear();
				cout << "i : ";
			    cin >> i;
			  //	i1 = strncmp(s1,s2,i);
				if (strncmp(s1,s2,i)) {
					cout <<"не совпадают" <<ln;
				}
				else{
					cout<<"совпадают" <<ln;
                }
				break;
			}
			case 'c': break;
			default : cout<<"Ошибка в команде\n";
		}
		system("pause");
	}  while (1);

    return 0;
}

