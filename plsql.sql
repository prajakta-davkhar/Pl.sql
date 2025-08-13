CREATE OR REPLACE PROCEDURE proc_Grade (
    p_name IN VARCHAR2,
    p_marks IN NUMBER
) AS
    v_class VARCHAR2(30);
BEGIN
    IF p_marks >= 990 AND p_marks <= 1500 THEN
        v_class := 'Distinction';
    ELSIF p_marks >= 900 AND p_marks <= 989 THEN
        v_class := 'First Class';
    ELSIF p_marks >= 825 AND p_marks <= 899 THEN
        v_class := 'Higher Second Class';
    ELSE
        v_class := 'Not Classified';
    END IF;

    INSERT INTO results (name, class)
    VALUES (p_name, v_class);
END;
/

BEGIN
    FOR rec IN (SELECT name, total_marks FROM stude_marks) LOOP
        proc_Grade(rec.name, rec.total_marks);
    END LOOP;
END;

/



    

SQL*Plus: Release 21.0.0.0.0 - Production on Wed Aug 13 21:42:08 2025
Version 21.3.0.0.0

Copyright (c) 1982, 2021, Oracle.  All rights reserved.

Enter user-name: system
Enter password:
Last Successful login time: Wed Aug 13 2025 21:39:35 +05:30

Connected to:
Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

SQL> create table stude_marks(
  2  name varchar(30),
  3  total_marks number
  4  );

Table created.

SQL> create table results  (
  2  roll number generated always as identity primary key,
  3  name varchar(20),
  4  class varchar(30)
  5  );

Table created.

SQL> INSERT INTO Stud_Marks (Name, Total_Marks) VALUES ('prajakta', 1200);

1 row created.

SQL> INSERT INTO Stude_marks (name, total_marks) VALUES ('prajakta', 1100);

1 row created.

SQL> INSERT INTO Stude_marks (name, total_marks) VALUES ('pranat', 1200);

1 row created.

SQL> INSERT INTO Stude_marks (name, total_marks) VALUES ('pooja', 900);

1 row created.

SQL> INSERT INTO Stude_marks (name, total_marks) VALUES ('divya', 850);

1 row created.

SQL> commit;

Commit complete.

SQL> select * from stude_marks;

NAME                           TOTAL_MARKS
------------------------------ -----------
prajakta                              1100
pranat                                1200
pooja                                  900
divya                                  850

SQL> select * from results;

no rows selected

SQL> SET SERVEROUTPUT ON;
SQL> @C:\Users\Prajakta\Desktop\PLsql\plsql.sql

Procedure created.


PL/SQL procedure successfully completed.

SQL> select * from stude_marks;

NAME                           TOTAL_MARKS
------------------------------ -----------
prajakta                              1100
pranat                                1200
pooja                                  900
divya                                  850

SQL> select * from results;

      ROLL NAME                 CLASS
---------- -------------------- ------------------------------
         1 prajakta             Distinction
         2 pranat               Distinction
         3 pooja                First Class
         4 divya                Higher Second Class

SQL> select class, count(*) as total_students
  2  from results
  3  group by class;

CLASS                          TOTAL_STUDENTS
------------------------------ --------------
Distinction                                 2
First Class                                 1
Higher Second Class                         1

SQL> select prajakta
  2  from results
  3  where class = 'Distinction';
select prajakta
       *
ERROR at line 1:
ORA-00904: "PRAJAKTA": invalid identifier


SQL> select prajakta
  2  from results
  3  where class = 'Distinction';
select prajakta
       *
ERROR at line 1:
ORA-00904: "PRAJAKTA": invalid identifier


SQL> select name
  2  from results
  3  where class = 'Distinction'
  4  and name = 'prajakta';

NAME
--------------------
prajakta

SQL>


