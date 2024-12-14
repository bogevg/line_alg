program pr_LA;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  func in 'func.pas',
  service in 'service.pas';
//
var ar:td;
    arr, ar1, ar2: tdr;
    ar_w: td1;
    i,j,n,m:uint16;
    k_r:int16=0;
    fname:string;
    diap:uint32=100;
    el:real;
    S :ansistring;
    code,count_op:int32;
    n_com, c_par:int8;
//
type tr = record
          kind:byte; //0-free,1-matr('A'),2-scalar,3-both('a')
          ar:tdr;
          f:real;
          n,m:uint8;
          end;
     tar = array ['A'..'Z'] of tr;
var ar_dat : tar;
    id_m, c,c1 :ansichar;
    rec:tr;
    k: uint8 = 10;
    d: uint8 = 2;
    cfile:ansichar = 'n';
//
begin
  repeat
  try
  write(#10,'> ');
  readln(s);
  ar_w:=seqtowords(s);
  c_par:=length(ar_w);
  arr:=nil;
  // ����� ������ ����������� ������ �������
  j:=length(help);
  n_com:=-1;
  for i:=0 to j-1 do
   if help[i,1]<>ar_w[0] then continue
     else n_com:=i;
  if n_com=-1 then
    raise EinoutError.Create('������� �����������');
  //
  if (c_par>1) and (n_com in [0..3,5,9,10,13]) and
    not (ar_w[1][1] in ['A'..'Z']) then
    raise Einouterror.Create('������ � ����� �������.');
//
  case n_com of
  // ��������� ������������� �������
  0: begin
      if c_par>=4 then begin
                      id_m:=ar_w[1][1];
                      val(ar_w[2], n, code);
                      if code <> 0 then
                       raise EinoutError.Create('�� ����� �� �����');
                      val(ar_w[3], m, code);
                      if code <> 0 then
                       raise EinoutError.Create('�� ����� �� �����');
                      if c_par=5 then randseed:=strtoint(ar_w[4]);
                      end
      else begin
           write('��� ������� : ');
           readln(id_m);
           write('������� n m : ');
           readln(n,m);
           write('Randseed=');
           readln(randseed);
           end;
      arr:=gen_ar(n,m,randseed,diap,k_r);
     end;
  // ���� �������
  1: begin
      if c_par>=2 then begin
                        id_m:=ar_w[1][1];
                        fname:='';
                        if c_par=3 then fname:=ar_w[2];
                      end else
      begin
      write('Id_m ����� : ');
      readln(id_m);
      write('��� ����� ����� ������� :');
      readln(fname);
      end;
      arr:=inp_r_ar(fname);
     end;
  // ����� �������
  2: begin
      if c_par>=2 then begin
                         id_m:=ar_w[1][1];
                         if (ar_dat[id_m].ar=nil) then
                          raise EinoutError.Create('������� �����������');
                         fname:='';
                         if c_par=3 then fname:=ar_w[2];
                       end else
      begin
      write('������� Id_m :');
      readln(id_m);
      if ar_dat[id_m].ar=nil then  raise EinoutError.Create('������� �����������');
      write('��� ����� ������ ������� :');
      readln(fname);
      end;
      ar_out(ar_dat[id_m].ar,fname,cfile,k,d);//k=10 d = 2
     end;
     // �������������� �������� �������
  3: begin
       if c_par=5 then begin
                       id_m:=ar_w[1][1];
                       i:=strtoint(ar_w[2]);
                       j:=strtoint(ar_w[3]);
                       el:=strtofloat(ar_w[4]);
                       end
       else
       begin
       write('Id_m :');
       readln(id_m);
       write('������� ���������� �������� : ');
       readln(i,j);
       writeln('������� �������� ������ �������� : ');
       readln(el);
       end;
       edit_1el(ar_dat[id_m].ar,i,j,el);
     end;
     // ������� ������ ��� ������
  4: begin
      for c := low(ar_dat) to High(ar_dat) do
        ar_dat[c].ar := nil;
        arr:=nil;
       exit;
     end;
  //���������������� �������
 5: begin
      if (c_par <> 3 ) then raise Einouterror.Create('������ � ���������� ');
      c1 := ar_w[1][1];
      c:= ar_w[2][1];
      if not((c in ['A'..'Z']) and (c1 in ['A'..'Z'])) then raise Einouterror.Create('������ � ���������� ');
      if ar_dat[c].ar = nil then  raise Einouterror.Create('������� ����� ');
      id_m := c1;
      arr:= tr_m(ar_dat[c].ar);
     end;
  // ������� ������
  6: begin
     if c_par=1 then fhelp(help);
     if c_par>=2 then fhelp(help,ar_w[1]);
     end;
  // ��������� �������� ����������
  7: begin
        s0:='test_in';//const
        s1:='�������� ��������� ';//copy
        s2:='�������� ����������';//var
        s3:=s1+s2; //out
        writeln(s3,' Adr out s3[1] � ��� �� = ',uint32(@s3[1]));
        writeln('Adress s0[1]= ',uint32(@s0[1]),#10,'Adress s1[1]= ',uint32(@s1[1]),
        #10,'Adress s2[1]=',uint32(@s2[1]),#10,'Adress s3[1]=',uint32(@s3[1]));
        i:=10;
        writeln('i=',i,' adr i=',int32(@i));
        test(s0,s1,s2,s3,i);
        writeln(s3,' Adr out s3[1] � ��� �����= ',uint32(@s3[1]));
        writeln('i= �����=',i,' adr i=',int32(@i));
     end;
  //������� ���������� ��� ���������� diap*random+k
  8: begin
     if c_par=3 then begin
                       diap:=strtoint(ar_w[1]);
                       k_r:=strtoint(ar_w[2]);
                       continue
                     end;
      write('������� diap ��� random : ');
      readln(diap);
      write('������� �������� "���������" k_r : ');
      readln(k_r);
     end;
     // ��������� ������������� �������
  9: begin
      if c_par>=4 then begin
                      id_m:=ar_w[1][1];
                      n:=strtoint(ar_w[2]);
                      m:=strtoint(ar_w[3]);
                      if c_par=5 then randseed:=strtoint(ar_w[4]);
                      end
      else begin
           write('��� ������� : ');
           readln(id_m);
           write('������� n m : ');
           readln(n,m);
           write('Randseed=');
           readln(randseed);
           end;
      arr:=gen_ari(n,m,randseed,diap,k_r);
     end;
     // calc A = B + C
 10: begin
     if (c_par=6) and (ar_w[2][1]= '=') then begin //OK
         id_m:=ar_w[1][1];
         if not (ar_w[4][1] in ['+','-','*','/']) then
           raise Einouterror.Create('������ � ��������');
         c:=ar_w[4][1]; // operation
         end
     else raise Einouterror.Create('������ � ���������� ���������� ��� ��� =');
     //
     case c of
    '+','-':arr:=m_sum(ar_dat[ar_w[3][1]].ar,ar_dat[ar_w[5][1]].ar,c);
        //
    '*','/':begin
        c1:=ar_w[5][1];
        case c1 of
        // ������ * �������
        'A'..'Z': begin
          if c = '/'  then raise Einouterror.Create('������ � ��������');
          arr:=mult(ar_dat[ar_w[3][1]].ar,ar_dat[ar_w[5][1]].ar,count_op);
        end;
        //������� �� ������
        'a'..'z':if ar_dat[ansiuppercase(ar_w[5])[1]].kind>=2 then
                        begin
                        el:= ar_dat[ansiuppercase(ar_w[5])[1]].f;
                        if (c = '/') then if (abs(el) > 1e-8) then el := 1 / el
                                else raise Einouterror.Create('������ ������ �� ����');
                        arr:= sc_mult_m(ar_dat[ar_w[3][1]].ar,el,count_op);
                        end
                  else raise Einouterror.Create('� ���� ������� ��� �������')
        else begin
             val(ar_w[5],el,code);
             if code<>0 then
                raise Einouterror.Create('������ � ��������� ���������');
             if (c = '/') then if (abs(el) > 1e-8) then el := 1 / el
                                else raise Einouterror.Create('������ ������ �� ����');
             arr:= sc_mult_m(ar_dat[ar_w[3][1]].ar,el,count_op);
             end;
        end;//case1
        end;//*
     end;//case
     end;//10
 11: begin
     writeln('������ ������',#10,'���',#9,'n',#9,'m');
     for c := 'A' to 'Z' do
       begin
       rec:=ar_dat[c];
       if odd(rec.kind) then writeln(c:2,#9,rec.n,#9,rec.m);
       end;
     end;
 12: begin
     writeln('������ ��������� ��������',#10,'���',#9,'��������');
     for c := 'A' to 'Z' do
       begin
       rec:=ar_dat[c];
       if rec.kind>=2 then
         writeln(ansilowercase(c):2,#9,rec.f:0:6);
       end;
     end;
  // ��������� ������� E(n,k) � 1 �� k-� �����
 13: begin
      if (c_par <> 4) then raise Einouterror.Create('������ � ����������!!');
      arr:= gen_e(strtoint(ar_w[2]),strtoint(ar_w[3]));
      id_m := ar_w[1,1];
     end;
  // ��������� ������� E1(n,1) �� n ������
 14: begin
      if (c_par <> 3) then raise Einouterror.Create('������ � ����������!!');
      arr:= gen_e1(strtoint(ar_w[2]));
      id_m := ar_w[1,1];
     end;
  //��������� ��������� ������� ������� n, n - ����� �����
 15: begin
      if c_par <> 3 then  raise Einouterror.Create('������ � ����������!!');
      arr:=genI(strtoint(ar_w[2]));
      id_m:= ar_w[1,1];
     end;
 // ���������� ������
 16: begin
       if c_par <> 4 then  raise Einouterror.Create('������ � ����������!!');
       id_m := ar_w[1,1];
       arr:= metg_1(ar_dat[ar_w[2,1]].ar, ar_dat[ar_w[3,1]].ar, count_op);
       n:= length(arr);
       writeln('teor c_op = ',Trunc((n * (n -1) * (n + 2.5)) / 3));
     end;
 // ����� �������� ����������� (�������) ��� �������� �������
 17: begin
       if  c_par <> 3 then  raise Einouterror.Create('������ � ����������!!');
       id_m := ar_w[1,1];
       arr:= metrs_1(ar_dat[ar_w[2,1]].ar,count_op);
       n:= length(arr);
       writeln('teor c_op = ',Trunc( (n * (n + 1) /2)) );
     end;

 18: begin
      if c_par <2 then   raise Einouterror.Create('������ � ����������!!');
      k :=  strtoint(ar_w[1]);
      d :=  strtoint(ar_w[2]);
      if c_par = 4 then
        cfile :=  ar_w[3,1];
     end;
 // ����������� ������ �� ��������  J(A|B)
 19: begin
      if c_par < 4 then raise Einouterror.Create('������ � ����������!!');
      id_m :=  ar_w[1,1];
      arr:= join_col(ar_dat[ar_w[2,1]].ar,ar_dat[ar_w[3,1]].ar);
     end;
 // LU
 20: begin
       if c_par<>4 then raise Einouterror.Create('������ � �������');
       id_m:=ar_w[1][1];
       c:= ar_w[2][1];
       c1:=ar_w[3][1];
       ar1:=nil;
       arr:=LU(ar_dat[c1].ar,ar1,count_op);
       n:=length(arr);
       ar_dat[c].ar:=nil;
       ar_dat[c].ar:=ar1;
       ar_dat[c].n:=n;
       ar_dat[c].m:=n;
       if not odd(ar_dat[c].kind) then ar_dat[c].kind:=ar_dat[c].kind+1;
       i:=n*(n*n-1) div 3;
       writeln('������������� count_op=',i);
     end;
 21: begin
       if c_par<>4 then raise Einouterror.Create('������ � �������');
       id_m:=ar_w[1][1];
       arr :=  dirsmet(ar_dat[ar_w[2,1]].ar,ar_dat[ar_w[3,1]].ar,count_op );
       n := length(arr);
       i := n * (n -1) div 2;
       writeln('������������� count_op = ',i);
     end;
 22: begin
       if c_par<>4 then raise Einouterror.Create('������ � �������');
       id_m:=ar_w[1][1];
       arr := revsmet(ar_dat[ar_w[2,1]].ar,ar_dat[ar_w[3,1]].ar,count_op );
       n := length(arr);
       i := n * (n + 1) div 2;
       writeln('������������� count_op = ',i);
     end;
 // swap
 23: begin
       if c_par<>4 then raise Einouterror.Create('������ � �������');
       id_m := ar_w[1][1];
       swap_str(ar_dat[ar_w[1,1]].ar, strtoint(ar_w[2]), strtoint(ar_w[3]) );
     end;
 // LUP
 24: begin
       if c_par<>5 then raise Einouterror.Create('������ � �������');
       id_m := ar_w[1][1];
       c:= ar_w[2][1];
       c1:=ar_w[3][1];
       ar1:=nil;
       ar2:= nil;
       arr := LUP(ar_dat[ar_w[4,1]].ar,ar1,ar2, count_op );
       n:=length(arr);
       ar_dat[c].ar:=nil;
       ar_dat[c].ar:=ar1;
       ar_dat[c].n:=n;
       ar_dat[c].m:=n;
       ar_dat[c1].ar:=nil;
       ar_dat[c1].ar:=ar2;
       ar_dat[c1].n:=n;
       ar_dat[c1].m:=n;
       if not odd(ar_dat[c].kind) then ar_dat[c].kind:=ar_dat[c].kind+1;
       if not odd(ar_dat[c1].kind) then ar_dat[c1].kind:=ar_dat[c].kind+1;
     end;
 // swap for v
 25: begin
      if c_par<>4 then raise Einouterror.Create('������ � �������');
      id_m := ar_w[3][1];
      arr := swap_v(ar_dat[ar_w[1,1]].ar,ar_dat[ar_w[2,1]].ar);
     end;


  // ������ � �������
  else begin
       writeln('������ � �������.');
       end;
  end;
  //
  { TODO : ��������  ������������� ������� � ������ }
  except
  on E:EinoutError do
    if E.ErrorCode=103 then writeln('���� ',fname,' �� ������')
        else writeln(E.Message);
  on E:Exception do
    writeln(E.ClassName,'  ',E.Message);
  end;
  // ������ � �������
  if arr<>nil then
    if length(arr)*length(arr[0])=1 then
       begin
         if ar_dat[id_m].kind<2 then inc(ar_dat[id_m].kind,2);
         ar_dat[id_m].f:=arr[0,0];
       end
     else begin
          ar_dat[id_m].ar:=nil;//����� ������ ������ !
          if odd(ar_dat[id_m].kind) then dec(ar_dat[id_m].kind);
          ar_dat[id_m].ar:=arr;
          inc(ar_dat[id_m].kind);
          ar_dat[id_m].n:=length(arr);
          ar_dat[id_m].m:=length(arr[0]);
         end;
  if count_op<>0 then writeln('count_op = ',count_op);//!!!
  count_op:=0;//!!!
  ar_w:=nil;
  until false;
end.
