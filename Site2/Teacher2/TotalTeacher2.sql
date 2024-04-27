CLEAR Screen;
SET SERVEROUTPUT ON;
SET Verify OFF;

CREATE OR REPLACE PACKAGE ttltc2_p AS
	FUNCTION totalteacher2(total in NUMBER)
	RETURN NUMBER;
END ttltc2_p;
/

CREATE OR REPLACE PACKAGE BODY ttltc2_p AS

	FUNCTION totalteacher2(total in NUMBER)
	RETURN NUMBER
	IS
	total1 number;
	BEGIN
		total1:=total;
		FOR I in (SELECT * FROM Teacher2) LOOP
			total1:=total1+1;
		END LOOP;
		RETURN total1;
	END totalteacher2;
END ttltc2_p;
/
DECLARE
	n NUMBER;
	total NUMBER;
BEGIN
	total:=0;
	n:=ttltc2_p.totalteacher2(total);
	DBMS_OUTPUT.PUT_LINE('Total number of Teachers: '|| n);
END;
/