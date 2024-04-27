SET SERVEROUTPUT ON;
SET Verify OFF;
ACCEPT B PROMPT "Enter your name :";
ACCEPT C PROMPT "Enter your age :";
ACCEPT D PROMPT "Enter your Address :";
ACCEPT E PROMPT "Enter your phone :";

CREATE OR REPLACE PACKAGE stins2_p AS
	PROCEDURE stdnt2;
END stins2_p;
/

CREATE OR REPLACE PACKAGE BODY stins2_p AS
	PROCEDURE stdnt2
	IS
	Sname Student2.SName%TYPE;
	Sage Student2.SAge%TYPE;
	SAddress Student2.SAddress%TYPE;
	Sphone  Student2.SPhone%TYPE;
	n number;
	BEGIN
		Sname:='&B';
		SAge:= &C;
		SAddress:='&D';
		SPhone:='&E';
		n:=0;
		SELECT MAX(SID) into n FROM Student2;
		INSERT INTO Student2 VALUES ((n+1),Sname,Sage,SAddress,SPhone,2);
		COMMIT;	
	END stdnt2;
END stins2_p;
/

BEGIN
	stins2_p.stdnt2;
End;
/
