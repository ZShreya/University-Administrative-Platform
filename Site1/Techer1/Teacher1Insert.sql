SET SERVEROUTPUT ON;
SET Verify OFF;
ACCEPT B PROMPT "Enter name :";
ACCEPT C PROMPT "Enter Designation :";
ACCEPT E PROMPT "Course ID :";

CREATE OR REPLACE PACKAGE tcins1_p AS
	PROCEDURE tcrinsert1;
END tcins1_p;
/

CREATE OR REPLACE PACKAGE BODY tcins1_p AS

	PROCEDURE tcrinsert1
	IS
	name Teacher1.TName%TYPE;
	desi Teacher1.Desig%TYPE;
	ccid  Teacher1.CID%TYPE;
	n number;
	t number;
	myExp EXCEPTION;
	BEGIN
		name:='&B';
		desi:= '&C';
		ccid:=&E;
		n:=0;
		t:=0;
		FOR I in (SELECT * FROM Teacher1) LOOP
			n:=n+1;
		END LOOP;
		SELECT count(*) into t FROM Course1 WHERE CID=ccid;
		IF t>0 THEN 
			INSERT INTO Teacher1 VALUES ((n+1),name,desi,'CSE',ccid);
			COMMIT;
		ELSE RAISE myExp;
		END IF;
		EXCEPTION
		WHEN myExp THEN DBMS_OUTPUT.PUT_LINE('Course does not exist');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors');
			
	END tcrinsert1;
END tcins1_p;
/
BEGIN
	tcins1_p.tcrinsert1;
End;
/
