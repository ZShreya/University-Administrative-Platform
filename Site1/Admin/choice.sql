clear screen;
SET VERIFY OFF;
SET SERVEROUTPUT ON;
DECLARE
BEGIN
	BEGIN 
		EXECUTE "@F:\4.1\Project_(2)\Admin\r.sql";
	END;
END;
/