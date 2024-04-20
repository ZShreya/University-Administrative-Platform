clear screen;
SET VERIFY OFF;
SET SERVEROUTPUT ON;
ACCEPT A Char PROMPT "Enter your Username :";
ACCEPT B Char PROMPT "Enter your password : ";

CREATE OR REPLACE PACKAGE lg1_p AS
	PROCEDURE Adminlog(n IN Branch1.Bname%TYPE,pass IN Branch1.Password%TYPE);
END lg1_p;
/
CREATE OR REPLACE PACKAGE BODY lg1_p AS

	PROCEDURE Adminlog(n IN Branch1.Bname%TYPE,pass IN Branch1.Password%TYPE)
	IS
	myExp EXCEPTION;
	BEGIN
		IF (n ='Dhaka' AND pass ='dhaka')THEN		
			DBMS_OUTPUT.PUT_LINE('Logged In');			
		ELSE RAISE myExp;
			
		END IF;
		EXCEPTION
		WHEN myExp THEN DBMS_OUTPUT.PUT_LINE('Wrong Username or Password');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors');
	END Adminlog;
	
	
END lg1_p;
/
DECLARE
	n Branch1.Bname%TYPE:='&A';
	pass Branch1.Password%TYPE:='&B';
BEGIN
	lg1_p.Adminlog(n,pass);
END;
/