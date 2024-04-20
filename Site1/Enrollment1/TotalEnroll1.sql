CLEAR Screen;
SET SERVEROUTPUT ON;
SET Verify OFF;

CREATE OR REPLACE PACKAGE tnrl1_p AS
	FUNCTION totalenroll1(total in NUMBER)
	RETURN NUMBER;
END tnrl1_p;
/

CREATE OR REPLACE PACKAGE BODY tnrl1_p AS

	FUNCTION totalenroll1(total in NUMBER)
	RETURN NUMBER
	IS
	total1 number;
	BEGIN
		total1:=total;
		FOR I in (SELECT * FROM Enrollment1) LOOP
			total1:=total1+1;
		END LOOP;
		RETURN total1;
	END totalenroll1;
END tnrl1_p;
/
DECLARE
	n NUMBER;
	total NUMBER;
BEGIN
	total:=0;
	n:=tnrl1_p.totalenroll1(total);
	DBMS_OUTPUT.PUT_LINE('Total number of Enrollments: '|| n);
END;
/