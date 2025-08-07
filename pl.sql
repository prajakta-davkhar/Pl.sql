declare 
r number(3);
bn varchar(20);
amt number(6,2);
rd date;
di date;
day number(3);
begin
r :=&r;
bn :='&bn';
select issuedate into di from Borrower where rollno=r and nameofbook=bn and status='I';
rd :=sysdate;
day :=rd - di;
if day<15 then
dbms_output.put_line('No Fine');
update Borrower set status='R' where rollno=r and nameofbook=bn;
elsif day>15 and day<30 then 
amt :=day*5;
update borrower set status='R' where rollno=r and nameofbook=bn;
elsif day>30 then
amt :=day*50;
update borrower set status='R' where rollno=r and nameofbook=bn;
else
dbms_output.put_line('no record found');
end if;
if amt>0 then
insert into fine values(r,rd,amt);
end if;
end;
/
