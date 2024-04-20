SET LINESIZE 1000;
clear screen;
SET SERVEROUTPUT ON;
SET Verify OFF;
DECLARE
	n1 NUMBER;
	n2 NUMBER;
	n3 NUMBER;
	n4 NUMBER;
	n5 NUMBER;
	n6 NUMBER;
	n7 NUMBER;
BEGIN
	--Total Teacher
	SELECT COUNT(*) into n1 from Teacher1;
	SELECT COUNT(*) into n2 from Teacher2@site1;
	DBMS_OUTPUT.PUT_LINE(n1+n2);
	--total Course
	SELECT COUNT(*) into n3 from Course1;
	DBMS_OUTPUT.PUT_LINE(n3);
	--total Student
	SELECT COUNT(*) into n4 from Student1;
	SELECT COUNT(*) into n5 from Student2@site1;
	DBMS_OUTPUT.PUT_LINE(n4+n5);
	--total Enroll
	SELECT COUNT(*) into n6 from Enrollment1;
	SELECT COUNT(*) into n7 from Enrollment2@site1;
	DBMS_OUTPUT.PUT_LINE(n6+n7);
	--
END;
/