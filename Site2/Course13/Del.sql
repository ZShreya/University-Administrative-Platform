CLEAR Screen;
SET SERVEROUTPUT ON;
SET Verify OFF;
--ACCEPT B PROMPT "Enter ID:";

CREATE OR REPLACE PACKAGE del_p AS
	PROCEDURE coursedelete;
END del_p;
/

CREATE OR REPLACE PACKAGE BODY del_p AS
	PROCEDURE coursedelete
	IS
	id Course1.CID%TYPE;
	n1 number;
	n2 number;
	n3 number;
	myExp EXCEPTION;
	BEGIN
		id:=&id;
		n1:=0;
		n2:=0;
		n3:=0;
		Select COUNT(*) into n1 from Course1 where Course1.CID=id;
		Select COUNT(*) into n2 from Course3 where Course3.CID=id;
		Select COUNT(*) into n3 from Teacher2 where Teacher2.CID=id;
		DBMS_OUTPUT.PUT_LINE(n2);
		IF (n3>0) THEN DBMS_OUTPUT.PUT_LINE('Delete teacher for this course at first');
		ELSE 
			IF (n1>0 and n2>0) THEN
				DELETE FROM Course3 WHERE Course3.CID=id;
				DELETE FROM Course1 WHERE Course1.CID=id;
				DELETE FROM Course1@site2 WHERE Course1.CID=id;
				DBMS_OUTPUT.PUT_LINE('Deleted');
				COMMIT;
			ELSIF (n1>0 and n2=0) THEN 
				DELETE FROM Course1 WHERE Course1.CID=id;
				DELETE FROM Course1@site2 WHERE Course1.CID=id;
				DBMS_OUTPUT.PUT_LINE('Deleted');
				COMMIT;
			ELSE RAISE myExp;
			END IF;
		END IF;
		
	EXCEPTION
		WHEN myExp THEN DBMS_OUTPUT.PUT_LINE('Course does not exist');
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors');
	END coursedelete;
END del_p;
/
show error;

BEGIN
	del_p.coursedelete;
END;
/