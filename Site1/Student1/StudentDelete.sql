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
	id Student1.SID%TYPE;
	n number;
	n1 number;
	myExp EXCEPTION;
	BEGIN
		id:=&B;
		n:=0;
		Select COUNT(*) into n from Student1 where Student1.SID=id;
		Select COUNT(*) into n1 from Enrollment1 where Enrollment1.SID=id;
		IF (n>0 and n1>0) THEN
			DELETE FROM Enrollment1 WHERE Enrollment1.SID=id;
			DELETE FROM Student1 WHERE Student1.SID=id;
			DBMS_OUTPUT.PUT_LINE('Deleted');
			COMMIT;
		ELSIF (n>0 and n1=0) THEN 
			DELETE FROM Student1 WHERE Student1.SID=id;
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