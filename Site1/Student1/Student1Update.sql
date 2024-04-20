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
	id Student1.SID%TYPE;
	name Student1.SName%TYPE;
	age Student1.SAge%TYPE;
	address Student1.SAddress%TYPE;
	phone  Student1.SPhone%TYPE;
	n number;
	myExp EXCEPTION;
	BEGIN
		id:=&B;
		n:=0;
		name:='&A';
		Select COUNT(*) into n from Student1 where Student1.SID=id;
		
		IF n>0 THEN
			UPDATE Student1 set Student1.SName= name WHERE Student1.SID=id;
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