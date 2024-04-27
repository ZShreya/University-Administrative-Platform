CLEAR Screen;
SET SERVEROUTPUT ON;
SET Verify OFF;
ACCEPT B PROMPT "Enter ID:";

CREATE OR REPLACE PACKAGE tcdel2_p AS
	PROCEDURE teacher2delete;
END tcdel2_p;
/

CREATE OR REPLACE PACKAGE BODY tcdel2_p AS

	PROCEDURE teacher2delete
	IS
	id Teacher2.TID%TYPE;
	n number;
	myExp EXCEPTION;
	BEGIN
		id:=&B;
		n:=0;
		Select COUNT(*) into n from Teacher2 where Teacher2.TID=id;
		IF n>0 THEN
			DELETE FROM Teacher2 WHERE Teacher2.TID=id;
			DBMS_OUTPUT.PUT_LINE('Deleted');
			COMMIT;
		ELSE RAISE myExp;
		END IF;
		EXCEPTION
		WHEN myExp THEN DBMS_OUTPUT.PUT_LINE('Teacher does not exist');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors');
	END teacher2delete;
END tcdel2_p;
/

BEGIN
	tcdel2_p.teacher2delete;
END;
/