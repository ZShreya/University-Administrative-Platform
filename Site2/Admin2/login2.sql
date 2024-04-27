clear screen;
SET VERIFY OFF;
SET SERVEROUTPUT ON;
ACCEPT A Char PROMPT "Enter your Username :";
ACCEPT B Char PROMPT "Enter your password : ";

CREATE OR REPLACE PACKAGE lg2_p AS
	PROCEDURE Adminlog(n IN Branch2.Bname%TYPE,pass IN Branch2.Password%TYPE);
END lg2_p;
/
CREATE OR REPLACE PACKAGE BODY lg2_p AS

	PROCEDURE Adminlog(n IN Branch2.Bname%TYPE,pass IN Branch2.Password%TYPE)
	IS
	myExp EXCEPTION;
	BEGIN
		IF (n ='CTG' AND pass ='ctg')THEN		
			DBMS_OUTPUT.PUT_LINE('Logged In');			
		ELSE RAISE myExp;
			
		END IF;
		EXCEPTION
		WHEN myExp THEN DBMS_OUTPUT.PUT_LINE('Wrong Username or Password');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors');
	END Adminlog;
	
	
END lg2_p;
/
DECLARE
	n Branch2.Bname%TYPE:='&A';
	pass Branch2.Password%TYPE:='&B';
BEGIN
	lg2_p.Adminlog(n,pass);
END;
/