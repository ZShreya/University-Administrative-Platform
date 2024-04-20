SET SERVEROUTPUT ON;
SET Verify OFF;
ACCEPT B PROMPT "Enter your name :";
ACCEPT C PROMPT "Enter your age :";
ACCEPT D PROMPT "Enter your Address :";
ACCEPT E PROMPT "Enter your phone :";

CREATE OR REPLACE PACKAGE stins1_p AS
	PROCEDURE stdnt1;
END stins1_p;
/

CREATE OR REPLACE PACKAGE BODY stins1_p AS
	PROCEDURE stdnt1
	IS
	Sname Student1.SName%TYPE;
	Sage Student1.SAge%TYPE;
	SAddress Student1.SAddress%TYPE;
	Sphone  Student1.SPhone%TYPE;
	n number;
	BEGIN
		Sname:='&B';
		SAge:= &C;
		SAddress:='&D';
		SPhone:='&E';
		n:=0;
		FOR I in (SELECT * FROM Student1) LOOP
			n:=n+1;
		END LOOP;
		INSERT INTO Student1 VALUES ((n+1),Sname,Sage,SAddress,SPhone,1);
		COMMIT;	
	END stdnt1;
END stins1_p;
/

BEGIN
	stins1_p.stdnt1;
End;
/
