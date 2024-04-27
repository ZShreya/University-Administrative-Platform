SET SERVEROUTPUT ON;
SET Verify OFF;
ACCEPT B PROMPT "Enter name :";
ACCEPT C PROMPT "Enter Designation :";
ACCEPT E PROMPT "Course ID :";

CREATE OR REPLACE PACKAGE tcins2_p AS
	PROCEDURE tcrinsert2;
END tcins2_p;
/

CREATE OR REPLACE PACKAGE BODY tcins2_p AS

	PROCEDURE tcrinsert2
	IS
	name Teacher2.TName%TYPE;
	desi Teacher2.Desig%TYPE;
	ccid  Teacher2.CID%TYPE;
	n number;
	t number;
	myExp EXCEPTION;
	BEGIN
		name:='&B';
		desi:= '&C';
		ccid:=&E;
		n:=0;
		t:=0;
		Select max(CID) into n FROM Course1;
		DBMS_OUTPUT.PUT_LINE(n);
		SELECT count(*) into t FROM Course1 WHERE CID=ccid;
		IF t>0 THEN 
			INSERT INTO Teacher2 VALUES ((n+1),name,desi,'EEE',ccid);
			COMMIT;
		ELSE RAISE myExp;
		END IF;
		EXCEPTION
		WHEN myExp THEN DBMS_OUTPUT.PUT_LINE('Course does not exist');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors');
			
	END tcrinsert2;
END tcins2_p;
/
BEGIN
	tcins2_p.tcrinsert2;
End;
/
