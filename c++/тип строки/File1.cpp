#include <iostream> // cin, cout
#include <windows.h> //setconsole..
#include <string>

using namespace std;

int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);
    string s,s1,s2=string(10,'A');
	string s3=string();

	s3 = "sfwwvf";
	cout <<"s3 = "<< s3 << "	s3.length()= " << s3.length() <<"	s3.max_size()= " <<s3.max_size() << "	s3.capacity()= "
		<< s3.capacity()<< endl;
	cout <<"s = "<< s << "		s.length()= " <<  s.length()  <<"	s.max_size()= " <<s.max_size()   << "	s.capacity()= "
		<< s.capacity()<< endl;
  /*	cout << "������� ������ ";
	cin >> s;
	cout << s << endl;
	getline(cin,s1);  // ��� ����� ����, ����� �������� ����� ����� (��� ������� ������ "���� ����� ������ ���")
	cout << s1<<endl;

	cout<<"������� ������ � ���������: \n";
	getline(cin,s1,'\n');  // ������� ������ ��� ������ �� ���������� �������
	cout<<s1<<endl;     */

    char c;             /*
	cout<<"������� ������ � ���������: \n";
	do {                                               // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
		cin>>s;
		cout<<s<<endl;
		c=getchar();                                  //��� "��������" �������
	} while (c==' ');
                                                    */
	//string *s;
	c= 'c';
	s1 = c;
	s3 = s1 + "fe";

/*	cout << "Enter s= ";
	cin >> s;
	s2 = s;
	cout << "s= "<< s << "; s2 (s2 = s) = "<<s2<<endl;
	cout << "Enter s3= ";
	cin >> s3;
	cout << "s2 + s3 = "<< s2 + s3 << " s2 < s3 = "<<s2<<endl;        */

  /*	cout << "Enter s1= ";
	cin >> s1;
	cout << "Enter s2= ";
	cin >> s2;
	s.assign(s1,0,s1.size());
	cout << "s.assign(s1,0,15)= "<< s<<endl;
	s.append(s2,0,s2.size());
	cout << "s.append(s2,0,s2.size());= "<< s<<endl;
	s1.swap(s2);
	cout << "After swap: "<< " s1 = "<< s1 << "  s2 = "<< s2<<endl;  */
 /*
	s = "aaaaggggggghhhhaaaaagggggsssqqqqqaaahhha";
	cout << s<<endl;
	cout << "s.find(ggg) = "<< s.find("ggg") << "	 s.find(sss)= " << s.find("sss")<< "     s.rfind(aaa)= "<< s.rfind("aaa")<<endl;
   */
   while (1)
   {
   cout << "������� �����: ";
   cin >> s;
   if (s == "e") {
	   break;
   }
   cout << "stoi(s)= "<< stoi(s) << endl << "stol(s)= "<< stol(s) << endl  << "stod(s)= "<< stod(s)
   << endl << "stof(s)= "<< stof(s) << endl;
   cout << "�������� ��������������. ������� �����: ";
   double i;
   cin  >> i;
   cout << "to_string(i)= "<< to_string(i)<< endl;
   }




	system("pause");              // ������ ����� �����, �� ���� ������ ����������� ���� ������

}

