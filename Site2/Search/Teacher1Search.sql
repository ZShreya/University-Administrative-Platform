CLEAR Screen;
SET SERVEROUTPUT ON;
SET Verify OFF;
ACCEPT A PROMPT "Enter Teacher ID :";

CREATE OR REPLACE PACKAGE tcsrc1_p AS
	PROCEDURE Srch;
END tcsrc1_p;
/

CREATE OR REPLACE PACKAGE BODY tcsrc1_p AS

	PROCEDURE Srch
	IS
	n NUMBER;
	ID Teacher2.TID%TYPE;
	name Teacher2.TName%TYPE;
	tdesig Teacher2.Desig%TYPE;
	dep Teacher2.TDep%TYPE;
	tcid  Teacher2.CID%TYPE;
	myExp EXCEPTION;
	BEGIN
		n:=0;
		ID:=&A;
		SELECT COUNT(*) into n FROM Teacher2 WHERE TID =ID;
		IF (n>0) THEN
			DBMS_OUTPUT.PUT_LINE('FOUND');
			SELECT TName,Desig,TDep,CID into name, tdesig,dep,tcid From Teacher2 where TID =ID ;
			DBMS_OUTPUT.PUT_LINE('Name: '||name ||'	Designation: '||tdesig||'		Department: '|| dep|| '	CourseID: '|| tcid);
		ELSE RAISE myExp;
		END IF;
	EXCEPTION
		WHEN myExp THEN DBMS_OUTPUT.PUT_LINE('NOT FOUND');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors');

	END Srch;
END tcsrc1_p;
/
BEGIN
	tcsrc1_p.Srch;
END;
/