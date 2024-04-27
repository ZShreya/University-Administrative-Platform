SET SERVEROUTPUT ON;
SET Verify OFF;
ACCEPT B PROMPT "Enter Course name :";

CREATE OR REPLACE PACKAGE cin1_p AS
	PROCEDURE crse1;
END cin1_p;
/

CREATE OR REPLACE PACKAGE BODY cin1_p AS

	PROCEDURE crse1
	IS
	Cname Course1.CName%TYPE;
	n number;
	BEGIN
		Cname:='&B';
		n:=0;
		For I in (SELECT *FROM Course1 WHERE Course1.BID=2)LOOP
			n:=n+1;
		END LOOP;
		INSERT INTO Course1 VALUES ((n+100),Cname,2);
		INSERT INTO Course1@site2 VALUES ((n+100),Cname,2);
		COMMIT;	
	END crse1;

END cin1_p;
/
BEGIN
	cin1_p.crse1;
End;
/
