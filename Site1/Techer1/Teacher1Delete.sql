CLEAR Screen;
SET SERVEROUTPUT ON;
SET Verify OFF;
ACCEPT B PROMPT "Enter ID:";

CREATE OR REPLACE PACKAGE tcdel1_p AS
	PROCEDURE teacher1delete;
END tcdel1_p;
/

CREATE OR REPLACE PACKAGE BODY tcdel1_p AS

	PROCEDURE teacher1delete
	IS
	id Teacher1.TID%TYPE;
	n number;
	myExp EXCEPTION;
	BEGIN
		id:=&B;
		n:=0;
		Select COUNT(*) into n from Teacher1 where Teacher1.TID=id;
		IF n>0 THEN
			DELETE FROM Teacher1 WHERE Teacher1.TID=id;
			DBMS_OUTPUT.PUT_LINE('Deleted');
		ELSE RAISE myExp;
		END IF;
		EXCEPTION
		WHEN myExp THEN DBMS_OUTPUT.PUT_LINE('Teacher does not exist');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors');
	END teacher1delete;
END tcdel1_p;
/

BEGIN
	tcdel1_p.teacher1delete;
END;
/