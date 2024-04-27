CLEAR Screen;
SET SERVEROUTPUT ON;
SET Verify OFF;

CREATE OR REPLACE PACKAGE tc1_p AS
	FUNCTION totalcourse1(total in NUMBER)
	RETURN NUMBER;
END tc1_p;
/
CREATE OR REPLACE PACKAGE BODY tc1_p AS
	FUNCTION totalcourse1(total in NUMBER)
	RETURN NUMBER
	IS
	total1 number;
	BEGIN
		total1:=total;
		FOR I in (SELECT * FROM Course3) LOOP
			total1:=total1+1;
		END LOOP;
		RETURN total1;
	END totalcourse1;
END tc1_p;
/

DECLARE
	n NUMBER;
	total NUMBER;
BEGIN
	total:=0;
	n:=tc1_p.totalcourse1(total);
	DBMS_OUTPUT.PUT_LINE('Total number of EEE courses: '|| n);
END;
/