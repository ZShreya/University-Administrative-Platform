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
		FOR I in (SELECT * FROM Course1 WHERE Course1.BID=1) LOOP
			n:=n+1;
		END LOOP;
		dbms_output.put_line(n);
		INSERT INTO Course1 VALUES ((n+1),Cname,1);
		INSERT INTO Course1@site1 VALUES ((n+1),Cname,1);
		COMMIT;	
	END crse1;

END cin1_p;
/
BEGIN
	cin1_p.crse1;
End;
/
