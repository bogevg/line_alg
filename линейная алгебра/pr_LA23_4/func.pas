unit func;


interface
//
uses
  System.SysUtils;

type td = array of array of integer;
     tdr = array of array of real;
// ����� �������
procedure ar_out(ar:tdr;fname:string; c:ansichar='n'; k:uint8=10;d:uint8=2);
// ������� ��������� ������� real ������
function gen_ar(n,m:int16; r:int32; d:uint16=1000; b:int16=0):tdr;
// ������� ��������� ������� int ������
function gen_ari(n,m:int16; r:int32; d:uint16=1000;b:int16=0):tdr;
// ������� �����
function inp_r_ar(fname:string):tdr;
// �������������� 1 �������� �������
procedure edit_1el(var ar:tdr;i,j:int32; new:real);
// ��������� ������� �� ������
function sc_mult_m(const ar:tdr; a:real; out c_op:int32):tdr;
// �������������� �������� ������
function m_sum(const a:tdr;const b:tdr;c:ansichar='+'):tdr;//c='-' - ���������
// ��������� ������
function mult(const a:tdr;const b:tdr; out c_op:int32):tdr;
// ���������������� �������
function tr_m(const ta:tdr):tdr;
// ��������� ������� E(n,k) � 1 �� k-� �����
function gen_e(n,k:uint8):tdr;
// ��������� ������� E1(n,1) �� n ������
function gen_e1(n:uint8):tdr;
// ��������� ��������� �������
function genI(n:uint8):tdr;
//  ����� ���������� ������
function metg_1(const a:tdr;const b:tdr;out c_op:int32):tdr;
// ����� �������� ����������� (�������) ��� �������� ������� R(n,n+1) metg_1
function metrs_1(const r:tdr;out c_op:int32):tdr;
// ����������� ������ �� ��������  J(A|B)
function join_col(const a:tdr;const b:tdr):tdr;
// ���������� A(n,n) �� ������� L � U - � ���� ����� ��������� ������� L|U(n,2n)
function A_to_LU(const a:tdr;out c_op:int32):tdr;
// ���������� A(n,n) �� ������� L � U
function LU(const a:tdr;out U:tdr;out c_op:int32):tdr;
//���������� �������� ������� U(k,m) �� �������� �� ������� L(k,n) � ����� ������� U(k,m-n)
function slice(var a:tdr;k:uint8):tdr;
//Direct sustitution method ���������� ������� C(n,1): L*C = B, L-������ ����������� �������
function dirsmet(const L:tdr;const b:tdr;out c_op:int32):tdr;
// ����� �������� ����������� (�������) ��� ������� U(n,n) � ������� C(n,1)
function revsmet(const u:tdr;const c:tdr;out c_op:int32):tdr;
// swap rows matrix A
procedure swap_str(var a: tdr; k1,k2:int32);
//LUP L U P ���������� A(n,n) ���������� ������� � �� ������� L U � ������� ������������ �
function LUP(const a:tdr;out U:tdr; out P: tdr; out c_op:int32):tdr;
//swap ��� �������
function swap_v(const p:tdr; const b:tdr): tdr;
//
implementation
// ����� �������
procedure ar_out(ar:tdr;fname:string; c:ansichar='n';k:uint8=10;d:uint8=2); //
var i, j :integer;
    f:textfile;
begin
if fname<>'' then fname:=fname+'.txt';
if fileexists(fname) and (c='n') then
  raise EinoutError.Create('���� � ����� ������ ����������');
assignfile(f,fname);
rewrite(f);
writeln(f,length(ar),'  ',length(ar[0]));
for i:=0 to high(ar) do
begin
for j:=0 to high(ar[0]) do
    write(f,ar[i,j]:k:d);
writeln(f);
end;
closefile(f);
if fname<>'' then writeln('���� ������ ',fname,' �������');
end;
// ������� ��������� ������� real ������
function gen_ar(n,m:int16; r:int32; d:uint16=1000;b:int16=0):tdr;
var i,j:int32;
begin
   result:=nil;
   if (n>0)and (m>0) then setlength(result,n,m)
    else raise EinoutError.Create('������ � ���������� n,m gen_ar_int');
  if r=-1 then randseed:= 0 else randseed:=r;
  for i:=0 to n-1 do
	for j:=0 to m-1 do
       result[i,j]:=d*random+b;
end;
// ������� ��������� ������� int ������
function gen_ari(n,m:int16; r:int32; d:uint16=1000;b:int16=0):tdr;
var i,j:int32;
begin
   result:=nil;
   if (n>0)and (m>0) then setlength(result,n,m)
    else raise EinoutError.Create('������ � ���������� n,m gen_ar_int');
  if r=-1 then randseed:= 0 else randseed:=r;
  for i:=0 to n-1 do
	for j:=0 to m-1 do
       result[i,j]:=random(d)+b;
end;
// ����
function inp_r_ar(fname:string):tdr;
var f:textfile;
    i,j,n,m:int32;
begin
  result:=nil;
  if fname='' then begin
                     write('������� n (rows), m (colums) : ');
                     readln(n,m);
                   end
  else fname:=fname+'.txt';
  assignfile(f,fname);
  {$I-}
  reset(f);// �������� ��� �����?
  if fname<>'' then readln(f,n,m);
  setlength(result,n,m);
  for I := 0 to n-1 do
   begin
     if fname='' then writeln('������ ',m,' ��������� ������');
     for j := 0 to m-1 do
       read(f,result[i,j]);
     readln(f);
   end;
   closefile(f);
end;
// �������������� 1 �������� �������
procedure edit_1el(var ar:tdr;i,j:int32; new:real);
var n,m : uint32;
begin
{ TODO : �������� ���������������� ��������� ������ 1 }
  if ar=nil then begin
                   writeln('������ �����������.');
                   exit;
                 end;
  n:=length(ar);
  m:=length(ar[0]);
{ TODO : �������� ���������������� ��������� ������ 2 }
  if (i>=0)and (i<n) and (j>=0) and (j<m) then
       ar[i,j]:=new
  else writeln('������ � ��������.');
end;
// ��������� ������� �� ������
function sc_mult_m(const ar:tdr; a:real; out c_op:int32):tdr;
var i,j,n,m:int16;
begin
  result:=nil;
  if ar=nil then begin
                   writeln('������ �����������.');
                   exit;
                 end;
  n:=length(ar);
  m:=length(ar[0]);
  setlength(result,n,m);
  for I := 0 to n-1 do
    for j := 0 to m-1 do
       result[i,j]:=ar[i,j]*a;
  inc(c_op,(m-1)*(n-1));
end;
// �������������� �������� ������
function m_sum(const a:tdr;const b:tdr;c:ansichar='+'):tdr;//c='-' - ���������
var i,j,n,m:int32;
begin
  n:=length(a); m:=length(a[0]);
  result:=nil;
  if (n<>length(b)) or (m<>length(b[0])) then
    raise Einouterror.Create('�� ��������� ������� ������');
  setlength(result,n,m);
  if c='+' then
    for i := 0 to n-1 do
      for j := 0 to m-1 do
         result[i,j]:=a[i,j]+b[i,j]
  else
  for i := 0 to n-1 do
    for j := 0 to m-1 do
      result[i,j]:=a[i,j]-b[i,j];
end;
// ��������� ������
function mult(const a:tdr;const b:tdr; out c_op:int32):tdr;
var i,j,k,na,ma,nb,mb:uint16;
    r:real;
begin
result:=nil;
if (a=nil) or (b=nil) then
  raise Einouterror.Create('����������� ���� �� ������');
  na:=length(a);
  ma:=length(a[0]);
  nb:=length(b);
  mb:=length(b[0]);
if ma<>nb then
  raise EinoutError.Create('�� ������������� ������� ������');
// ����� �����������
setlength(result,na,mb);
for i := 0 to na-1 do
   for j := 0 to mb-1 do
   begin
     r:=0;
     for k := 0 to ma-1 do
       r:=r+a[i,k]*b[k,j];
     inc(c_op,ma);
     result[i,j]:=r;
   end;
end;
// ���������������� �������
function tr_m(const ta:tdr):tdr;
var n,m,i,j: uint16;
begin
  result:= nil;
  n:= length(ta);
  m:= length(ta[0]);
  setlength(result, m , n);
  for I := 0 to n-1 do
    for j := 0 to m-1 do
      result[j,i] := ta[i,j];
end;
// ��������� ������� E(n,k) � 1 �� k-� �����
function gen_e(n,k:uint8):tdr;
var i:uint16;
begin
  result:= nil;
  if (n = 0) or (k >= n) then raise EinoutError.Create('������ � ����������!');
  setlength(result,n,1);
  for i  := 0 to n-1 do
      result[i,0]:= 0;
  result[k,0]:= 1;
end;
// ��������� ������� E1(n,1) �� n ������
function gen_e1(n:uint8):tdr;
var i:uint16;
begin
  result:= nil;
  if (n = 0) then raise EinoutError.Create('������ � ����������!');
  setlength(result,n,1);
  for i  := 0 to n-1 do
      result[i,0]:= 1;
end;
// ��������� ��������� �������
function genI(n:uint8):tdr;
var i,j:uint16;
begin
  result:= nil;
  if n = 0 then raise EinoutError.Create('������ � ����������!');
  setlength(result,n,n);
  for i := 0 to n - 1 do
  begin
    for j := 0 to n - 1 do
      result[i, j] := 0;
    result[i, i]:=1;
  end;
end;

//  ����� ���������� ������
function metg_1(const a:tdr;const b:tdr;out c_op:int32):tdr;  // � - ������� �����������, � - �������(�������) � ���, ���  ������ =
var i,j,l,n,m,g:uint16;
    k: real;
    vs: tdr;
begin
  result := nil;
  m := length(a[0]);
  n := length(a);
  if n<>m then raise EinoutError.Create('������� �� n*n');
  if n <> length(b) then raise EinoutError.Create('������ �� ��������� � ��������');
  setlength(result, n, n+1);
  for i := 0 to n-1 do  // ����������� �������� ������� � ���������
  begin
    result[i,n]:= b[i,0];
    for j := 0 to n-1 do
      result[i,j]:=a[i,j];
  end;
  c_op:= 0;
  for j := 0 to n-2 do
    {//�������� �� �� ���� �������� ������������
    setlength(vs,1,n);
    if (result[j,j] = 0) then
     for i := j+1  to n-1 do
       if result[i,j] <> 0 then
        begin
         vs:= nil;
         vs[0] := result[j];
         result[j] := result[i];
         result[i]:= vs[0];
         break;
        end;       }
    //���������� �������������
    for i := j+1 to n-1 do
    begin
      if abs(result[j,j])<=1e-8 then raise EinoutError.Create('������� ������� '+inttostr(j)+' <=eps');
      if result[i,j]=0 then continue;// !!!
      k:= result[i,j] / result[j,j];
      result[i,j]:= 0;
      for l := j+1 to n-1 do
        result[i,l]:= result[i,l] - result[j,l] * k;
      inc(c_op,n-j+1);
      result[i,n]:= result[i,n] - k * result[j,n];
    end;
end;

// ����� �������� ����������� (�������) ��� �������� ������� R(n,n+1) metg_1
function metrs_1(const r:tdr;out c_op:int32):tdr;
var i,j,n:uint16;
    x: real;
begin
  n := length(r);
  if (n <> length(r[0]) -1 ) then raise EinoutError.Create('������ � ���������� �������');
  if r = nil then raise EinoutError.Create('������� �����������');
  result := nil;
  setlength(result, n,1);
  c_op:= 0;
  for I := (n-1) downto 0 do
  begin
    x:= 0;
    for j := n-1 downto i+1 do
       x := x +  r[i,j] * result[j,0];
    result[i,0] := (r[i, n] - x) / r[i,i];
    inc(c_op,n-i);
  end;
end;

// ����������� ������ �� ��������  J(A|B)
function join_col(const a:tdr;const b:tdr):tdr;
var i,j,k,n,ma,mb: uint16;
begin
  result := nil;
  if (a = nil ) or (b = nil) then raise EinoutError.Create('������� �����������');
  n := length(a);
  if n <> length(b) then  raise EinoutError.Create('������� ������ �� ���������');
  ma := length(a[0]);
  mb := length(b[0]);
  setlength(result, n, ma+mb);
  for I := 0 to n-1 do
  begin
    for j := 0 to ma-1 do
      result[i,j] := a[i,j];
    for k := 0 to mb-1 do
      result[i,ma+k] := b[i,k];
  end;
end;

// ���������� A(n,n) �� ������� L � U - � ���� ����� ��������� ������� L|U(n,2n)
function A_to_LU(const a:tdr;out c_op:int32):tdr;
var n, i, j, l: uint16;
    k : real;
begin
  result:= nil;
  n := length(a);
  setlength(result, n, n*2);
  for i := 0 to n-1 do  // ����������� �������� ������� � ���������
    for j := 0 to n-1 do
      result[i,j]:=a[i,j];
  for i := 0 to n - 1 do
  begin
    for j := 0 to n - 1 do
      result[i, n + j] := 0;
    result[i, n + i] := 1;
  end;

  for j := 0 to n-2 do
    for i := j+1 to n-1 do
      begin
        if abs(result[j,j])<=1e-8 then raise EinoutError.Create('������� ������� '+inttostr(j)+' <=eps');
        if result[i,j]=0 then continue;// !!!
        k:= result[i,j] / result[j,j];
        result[i,n + j] := k;
        result[i,j]:= 0;
        inc(c_op,n-j+1);
        for l := j+1 to n-1 do
          result[i,l]:= result[i,l] - result[j,l] * k;
      end;
end;

// ���������� A(n,n) �� ������� L � U
function LU(const a:tdr;out U:tdr;out c_op:int32):tdr;
var i,i1,j,n:int32;
    k:real;
begin
result:=nil;
//��������
n:=length(a);
if n<>length(a[0]) then raise EinoutError.Create('������� �� n*n');
//
result:=genI(n);
setlength(U,n,n);
//Copy
for i := 0 to n-1 do
  for j := 0 to n-1 do
    U[i,j]:=a[i,j];
c_op:=0;
//
for i := 0 to n-2 do
  for i1 := i+1 to n-1 do
    begin
    if abs(U[i,i])<=1e-8 then raise
       EinoutError.Create('������� ������� '+inttostr(i)+' <=eps');// L
    if U[i1,i]=0 then continue;
    k:=U[i1,i]/U[i,i];
    U[i1,i]:=0;
    result[i1,i]:=k;//������������ ������� L
    inc(c_op);
    for j := i+1 to n-1 do
        U[i1,j]:=U[i1,j]-k*U[i,j];
    //n-1 -i-1+1
    inc(c_op,n-i-1);
    end;
end;

//���������� �������� ������� U(k,m) �� �������� �� ������� L(k,n) � ����� ������� U(k,m-n)
function slice(var a:tdr;k:uint8):tdr;
var i, j, n, m : uint16;
    b : tdr;
begin
  result := nil;
  n := length(a);
  m := length(a[0]);
  if m <= k then raise EinoutError.Create('������ � ��������');
  setlength(result,n,k);
  for i := 0 to n - 1 do
    for j := 0 to k - 1 do
      result[i,j] := a[i,j]; //�������� � ����� ������� ������� U

  setlength(b,n,m - k);
  for i := 0 to n - 1 do
    for j := k to m-1 do
    b[i,j-n]:= a[i,j];
  setlength(a,n,m - k);
  a := b;
end;

//Direct sustitution method ���������� ������� C(n,1): L*C = B, L-������ ����������� �������
function dirsmet(const L:tdr;const b:tdr;out c_op:int32):tdr;
var n, i, j: int16;
    bx : real;
begin
  result:= nil;
  c_op := 0;
  if (L = nil) or (b = nil)  then  raise EinoutError.Create('����������� ���� �� ������');
  n := length(l);
  if n <> length(L[0]) then  raise EinoutError.Create('L �� ����������');
  if length(L[0]) <> length(b) then  raise EinoutError.Create('������ � ��������');
  setlength(result, length(L[0]), 1);
  for i := 0 to n-1 do
  begin
    bx := b[i,0];
    for j := 0 to i-1 do
      bx := bx - result[j,0] * L[i,j];
    inc(c_op,i);
    result[i,0] := bx;
  end;
end;

// ����� �������� ����������� (�������) ��� ������� U(n,n) � ������� C(n,1)
function revsmet(const u:tdr;const c:tdr;out c_op:int32):tdr;
var i,j,n:uint16;
    x: real;
begin
  n := length(u);
  if (n <> length(u[0]))  or (n <> length(c))  then raise EinoutError.Create('������ � ���������� �������');
  if u = nil then raise EinoutError.Create('������� �����������');
  if c = nil then raise EinoutError.Create('������ �����������');
  result := nil;
  setlength(result, n,1);
  c_op:= 0;
  for I := (n-1) downto 0 do
  begin
    x:= 0;
    for j := n-1 downto i+1 do
       x := x + u[i,j] * result[j,0];
    result[i,0] := (c[i, 0] - x) / u[i,i];
    inc(c_op,n-i);
  end;
end;
// swap rows matrix A
procedure swap_str(var a: tdr; k1,k2:int32);
var i, j, n, m :uint16;
    r : real;
begin
  if a = nil then raise EinoutError.Create('������� �����������');
  n := length(a);
  if (k1 >= n) or (k2 >= n) then  raise EinoutError.Create('����� ������ ���');
  if k1 = k2 then exit;
  m := length(a[0]);
  for j:= 0 to m-1 do
    begin
      r := a[k1,j];
      a[k1,j] := a[k2,j];
      a[k2,j] := r;
    end;
end;

//LU_p L U P ���������� A(n,n) ���������� ������� � �� ������� L U � ������� ������������ �
function LUP(const a:tdr;out U:tdr; out P: tdr; out c_op:int32):tdr;
var i,i1,j,n,l:int32;
    k:real;
begin
result:=nil;
//��������
n:=length(a);
if n<>length(a[0]) then raise EinoutError.Create('������� �� n*n');
//
U := nil;
P := nil;
result:=genI(n);  //L
setlength(U,n,n);
P := genI(n);
//Copy
for i := 0 to n-1 do
  for j := 0 to n-1 do
    U[i,j]:=a[i,j];
c_op:=0;
//
for i := 0 to n-2 do
  for i1 := i+1 to n-1 do
    begin
    if abs(U[i,i])<=1e-8 then //raise EinoutError.Create('������� ������� '+inttostr(i)+' <=eps');// L
       for l := i+1  to n-1 do
         if abs(U[l,i]) > 1e-8 then
          begin
           swap_str(U,i,l);
           swap_str(P, i, l);
           break;
          end;
    //
    if abs(U[i,i])<=1e-8 then raise EinoutError.Create('������� �����������');
    if U[i1,i]=0 then continue;
    k:=U[i1,i]/U[i,i];
    U[i1,i]:=0;
    result[i1,i]:=k;//������������ ������� L
    inc(c_op);
    for j := i+1 to n-1 do
        U[i1,j]:=U[i1,j]-k*U[i,j];
    //n-1 -i-1+1
    inc(c_op,n-i-1);
    end;
if U[n-1,n-1] = 0 then  raise EinoutError.Create('������� �����������');
end;

//swap ��� �������
function swap_v(const p:tdr; const b:tdr): tdr;
var n, i, j, k:uint16;
r: real;
begin
if (p = nil) or (b = nil) then raise EinoutError.Create('����������� ���� �� ������');
if length(p) <> length(p[0]) then raise EinoutError.Create('������� P �� n*n');
n := length(b);
if length(p) <> n then raise EinoutError.Create('������ � �������� ������');

result:= nil;
setlength(result, n, 1);
for i := 0 to n-1 do
  for j := 0 to n-1 do
    if p[i,j] = 1 then
      result[i,0] := b[j,0];
end;

end.
