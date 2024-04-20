CLEAR Screen;
SET SERVEROUTPUT ON;
SET Verify OFF;
ACCEPT A PROMPT "Enter ID Number :";

CREATE OR REPLACE PACKAGE srcst_p AS
	PROCEDURE Srch;
END srcst_p;
/

CREATE OR REPLACE PACKAGE BODY srcst_p AS

	PROCEDURE Srch
	IS
	n NUMBER;
	ID Student1.SID%TYPE;
	name Student1.SName%TYPE;
	age Student1.SAge%TYPE;
	address Student1.SAddress%TYPE;
	phone  Student1.SPhone%TYPE;
	bid Student1.BID%TYPE;
	myExp EXCEPTION;
	BEGIN
		n:=0;
		ID:=&A;
		SELECT COUNT(*) into n FROM Student1 WHERE SID =ID;
		IF (n>0) THEN
			DBMS_OUTPUT.PUT_LINE('FOUND');
			SELECT SName,SAge,SAddress,SPhone,BID into name, age,address,phone,bid From Student1 where SID =ID ;
			DBMS_OUTPUT.PUT_LINE('Name: '||name ||'	Age: '||age||'		Address: '|| address|| '	Phone: '|| Phone || '	Branch ID: '||bid);
		ELSE
			RAISE myExp;
		END IF;
		EXCEPTION
		WHEN myExp THEN DBMS_OUTPUT.PUT_LINE('NOT FOUND');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors');

	END Srch;
END srcst_p;
/
BEGIN
	srcst_p.Srch;
END;
/