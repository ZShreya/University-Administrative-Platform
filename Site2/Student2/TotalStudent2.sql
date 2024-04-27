CLEAR Screen;
SET SERVEROUTPUT ON;
SET Verify OFF;

CREATE OR REPLACE PACKAGE ttlst1_p AS
	FUNCTION totalstudent(total in NUMBER)
	RETURN NUMBER;
END ttlst1_p;
/

CREATE OR REPLACE PACKAGE BODY ttlst1_p AS

	FUNCTION totalstudent(total in NUMBER)
	RETURN NUMBER
	IS
	total1 number;
	BEGIN
		total1:=total;
		FOR I in (SELECT * FROM Student2) LOOP
			total1:=total1+1;
		END LOOP;
		RETURN total1;
	END totalstudent;
END ttlst1_p;
/
DECLARE
	n NUMBER;
	total NUMBER;
BEGIN
	total:=0;
	n:= ttlst1_p.totalstudent(total);
	DBMS_OUTPUT.PUT_LINE('Total number of students: '|| n);
END;
/