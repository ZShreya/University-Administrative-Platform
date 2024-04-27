CLEAR Screen;
SET SERVEROUTPUT ON;
SET Verify OFF;
ACCEPT B PROMPT "Enter ID:";

CREATE OR REPLACE PACKAGE stdel1_p AS
	PROCEDURE studentdelete;
END stdel1_p;
/

CREATE OR REPLACE PACKAGE BODY stdel1_p AS

	PROCEDURE studentdelete
	IS
	id Student2.SID%TYPE;
	n number;
	n1 number;
	myExp EXCEPTION;
	BEGIN
		id:=&B;
		n:=0;
		Select COUNT(*) into n from Student2 where Student2.SID=id;
		Select COUNT(*) into n1 from Enrollment2 where Enrollment2.SID=id;
		IF (n>0 and n1>0)THEN
			DELETE FROM Enrollment2 WHERE Enrollment2.SID=id;
			DELETE FROM Student2 WHERE Student2.SID=id;
			DBMS_OUTPUT.PUT_LINE('Deleted');
			COMMIT;
		ELSIF (n>0 and n1=0) THEN 
			DELETE FROM Student2 WHERE Student2.SID=id;
			DBMS_OUTPUT.PUT_LINE('Deleted');
			COMMIT;
		ELSE RAISE myExp;
		END IF;
		EXCEPTION
		WHEN myExp THEN DBMS_OUTPUT.PUT_LINE('Student does not exist');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors');
	END studentdelete;
END stdel1_p;
/

BEGIN
	stdel1_p.studentdelete;
END;
/