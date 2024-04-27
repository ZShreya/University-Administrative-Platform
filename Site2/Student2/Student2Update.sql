CLEAR Screen;
SET SERVEROUTPUT ON;
SET Verify OFF;
ACCEPT B PROMPT "Enter ID:";
ACCEPT A PROMPT "Enter updated name:";

CREATE OR REPLACE PACKAGE stup1_p AS
	PROCEDURE Studentupdate;
END stup1_p;
/

CREATE OR REPLACE PACKAGE BODY stup1_p AS

	PROCEDURE Studentupdate
	IS
	id Student2.SID%TYPE;
	name Student2.SName%TYPE;
	age Student2.SAge%TYPE;
	address Student2.SAddress%TYPE;
	phone  Student2.SPhone%TYPE;
	n number;
	myExp EXCEPTION;
	BEGIN
		id:=&B;
		n:=0;
		name:='&A';
		Select COUNT(*) into n from Student2 where Student2.SID=id;
		
		IF n>0 THEN
			UPDATE Student2 set Student2.SName= name WHERE Student2.SID=id;
			DBMS_OUTPUT.PUT_LINE('Updated');
			COMMIT;
		ELSE 
			RAISE myExp;
		END IF;
	EXCEPTION
		WHEN myExp THEN DBMS_OUTPUT.PUT_LINE('Student does not exist');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors');
	END Studentupdate;
END stup1_p;
/

BEGIN
	stup1_p.Studentupdate;
END;
/