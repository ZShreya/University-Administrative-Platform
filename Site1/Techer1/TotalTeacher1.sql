CLEAR Screen;
SET SERVEROUTPUT ON;
SET Verify OFF;

CREATE OR REPLACE PACKAGE ttltc1_p AS
	FUNCTION totalteacher1(total in NUMBER)
	RETURN NUMBER;
END ttltc1_p;
/

CREATE OR REPLACE PACKAGE BODY ttltc1_p AS

	FUNCTION totalteacher1(total in NUMBER)
	RETURN NUMBER
	IS
	total1 number;
	BEGIN
		total1:=total;
		FOR I in (SELECT * FROM Teacher1) LOOP
			total1:=total1+1;
		END LOOP;
		RETURN total1;
	END totalteacher1;
END ttltc1_p;
/
DECLARE
	n NUMBER;
	total NUMBER;
BEGIN
	total:=0;
	n:=ttltc1_p.totalteacher1(total);
	DBMS_OUTPUT.PUT_LINE('Total number of Teachers: '|| n);
END;
/