CLEAR Screen;
SET SERVEROUTPUT ON;
SET Verify OFF;
--ACCEPT B PROMPT "Enter ID:";

CREATE OR REPLACE PACKAGE enrd1_p AS
	PROCEDURE coursedelete;
END enrd1_p;
/

CREATE OR REPLACE PACKAGE BODY enrd1_p AS

	PROCEDURE coursedelete
	IS
	id Enrollment1.EID%TYPE;
	n1 number;
	n2 number;
	myExp EXCEPTION;
	BEGIN
		id:=&id;
		n1:=0;
		n2:=0;
		Select COUNT(*) into n1 from Enrollment1 where Enrollment1.EID=id;
		--Select COUNT(*) into n2 from Course2 where Course2.CID=id;
		--DBMS_OUTPUT.PUT_LINE(n2);
		IF (n1>0 ) THEN
			--DELETE FROM Course2 WHERE Course2.CID=id;
			DELETE FROM Enrollment1 WHERE Enrollment1.EID=id;
			DBMS_OUTPUT.PUT_LINE('Deleted');
			commit;
		ELSE RAISE myExp;
		END IF;
	EXCEPTION
		WHEN myExp THEN DBMS_OUTPUT.PUT_LINE('Course does not exist');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors');
	END coursedelete;
END enrd1_p;
/
show error;

BEGIN
	enrd1_p.coursedelete;
END;
/