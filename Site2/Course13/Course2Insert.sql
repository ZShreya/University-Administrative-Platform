SET SERVEROUTPUT ON;
SET Verify OFF;
ACCEPT C PROMPT "Enter Credit: ";
ACCEPT D PROMPT "Enter Department: ";
ACCEPT E PROMPT "Enter Pre Course Name: ";
ACCEPT F PROMPT "Enter Course ID: ";

CREATE OR REPLACE PACKAGE cin2_p AS
	PROCEDURE crse2;
END cin2_p;
/

CREATE OR REPLACE PACKAGE BODY cin2_p AS

	PROCEDURE crse2
	IS
	ccredit Course3.Credit%TYPE;
	cdep Course3.CDep%TYPE;
	cpre Course3.PreCName%TYPE;
	ccid Course3.CID%TYPE;
	n number;
	c1 number;
	c2 number;
	t number;
	myExp1 EXCEPTION;
	myExp2 EXCEPTION;
	BEGIN
		ccredit:=&C;
		cdep:='&D';
		cpre:='&E';
		ccid:=&F;
		n:=0;
		c1:=0;
		c2:=0;
		t:=0;
		SELECT count(*) into c1 FROM Course1 WHERE ccid= Course1.CID;
		SELECT count (*) into t FROM Course3 Where ccid= Course3.CID;
		IF ((c1>0) AND (t=0)AND (cdep='EEE')) THEN
			IF(cpre!='') THEN
				SELECT count(*) into c2 FROM Course1 WHERE cpre= Course1.CName;
				IF(c2>0) THEN 			
					Select MAX(C3ID) into n from Course3;
					INSERT INTO Course3 VALUES ((n+1),ccredit,cdep,cpre,ccid);
					COMMIT;	
				ELSE RAISE myExp1;
				END IF;
			ELSE			
				Select MAX(C3ID) into n from Course3;
				INSERT INTO Course3 VALUES ((n+1),ccredit,cdep,cpre,ccid);
				COMMIT;
			END IF;			
		ELSE RAISE myExp2;
		END IF;
	EXCEPTION
		WHEN myExp1 THEN DBMS_OUTPUT.PUT_LINE('NO PRE COURSE WITH THIS NAME');
		WHEN myExp2 THEN DBMS_OUTPUT.PUT_LINE('NO COURSE WITH ID OR DETAILS OF THIS ID IS ALREADY FILLED UP OR department is not CSE');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors');
	END crse2;

END cin2_p;
/

BEGIN
cin2_p.crse2;
End;
/
