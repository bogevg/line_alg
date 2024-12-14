unit service;

interface
//
uses
  System.SysUtils, Classes;
  //
type td1=array of ansistring;
     tstr=ansistring;
     thelp=array of array [1..3] of tstr;

var help : thelp;
    s0,s1,s2,s3:ansistring;

// Help
procedure fhelp(var help:thelp; s:tstr='');
// Остановка
procedure contin;
// Преобразование предложения в массив слов
function seqtowords(s: ansistring): td1;
// Механизмы передачи параметров
procedure test(const s0:tstr;s1:tstr; var s2:tstr; out s3:tstr;out i:uint16);
//
implementation
//Service
// Help
procedure fhelp(var help:thelp; s:tstr='');
var s_list: TStringList;
    n,i,j,k:uint8;
begin
if help=nil then begin
                   //writeln('reading help');
                   s_list:=TStringList.Create;
                   s_List.LoadFromFile('help.hlp');//0..n-1
                   n:=s_List.Count;
                   if not (n mod 3=0) then begin
                                             s_list.Free;
                                             raise Einouterror.Create('Ошибка в файле справки');
                                           end;
                   k:=0;
                   setlength(help,n div 3);
                   repeat
                      for j := 0 to 2 do
                        help[k,j+1]:=s_list[3*k+j];
                        inc(k);
                   until k=(n div 3);
                 end;
k:=length(help);
if s<>'' then begin
  for I:=0 to k-1 do
  begin
  if help[i,1]<>s then continue;
  writeln(help[i,3]);
  writeln('Синтаксис : ',help[i,2]);
  exit;
  end;
  if s<>'___' then writeln(s+' - справка отсутствует');
  exit;
  end;
// help
for I := 0 to k-1 do
  writeln(help[i,1]:8,' - '+help[i,3]);
end;
//
procedure contin;
begin
  write('Press Enter to continue. . .');
  readln;
  writeln;
end;
// Преобразование предложения в массив слов
function seqtowords(s: ansistring): td1;
var
  c: ansichar;
  st: ansistring;
begin
  s := trim(s) + ' ';
  result := nil;
  st := '';
  for c in s do
    if c in ['0' .. '9','.','-','+','*','/','=','_','a' .. 'z','A'..'Z'] then
      st := st + c
    else if st <> '' then
    begin
      result := result + [st];
      st := '';
    end;
  if result= nil then
    raise EinoutError.Create('Команда отсутствует');
end;
// Механизмы передачи параметров
procedure test(const s0:tstr;s1:tstr; var s2:tstr; out s3:tstr;out i:uint16);
begin
writeln('Adr const s0[1]= ',int32(@s0[1]),#10,
'Adr copy s1[1]= ',int32(@s1[1]),#10,
'Adr var s2[1]=',int32(@s2[1]),#10,'Adr out s3[1]= ','Error'{int32(@s3[1])});
//writeln(s3); //пока не доступна по чтению
//s3[1]:='1';// и по записи к отдельным элементам
//s0:='test_const'; //нельзя Error
s3:='test_out';// только так !!!
writeln(s3,' Adr out s3[1] в п/п = ',int32(@s3[1]));
writeln('в test i=',i,' adr i=',int32(@i));
i:=11;
end;
//
initialization
fhelp(help,'___');
end.
