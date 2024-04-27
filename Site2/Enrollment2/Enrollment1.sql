CLEAR Screen;
SET SERVEROUTPUT ON;
SET Verify OFF;
ACCEPT A PROMPT "Enter Student ID Number :";
ACCEPT B PROMPT "Enter Course ID Number :";

CREATE OR REPLACE PACKAGE enr1_p AS
	PROCEDURE Enrl1;
END enr1_p;
/

CREATE OR REPLACE PACKAGE BODY enr1_p AS

	PROCEDURE Enrl1
	IS
	stid Enrollment2.SID%TYPE;
	crsid Enrollment2.CID%TYPE;
	pcname Course3.PreCName%TYPE;
	cidd Course3.C3ID%TYPE;
	total1 int;
	total2 int;
	total3 int;
	n number;

	tocre number;
	myExp1 EXCEPTION;
	myExp2 EXCEPTION;
	myExp3 EXCEPTION;
	BEGIN
		stid :=&A;
		crsid :=&B;
		total1:=0;
		total2:=0;
		total3:=0;
		tocre:=0;	
		n:=0;
		Select  max(EID) into n from Enrollment2;
		--course exists/not
		Select COUNT(*) into total1 FROM Course3 where Course3.C3ID= crsid;
		Select COUNT(*) into total3 FROM Student2 where Student2.SID= stid;
		DBMS_OUTPUT.PUT_LINE(total3);
		DBMS_OUTPUT.PUT_LINE(total1);
		IF (total1>0 and total3>0) THEN 
			
			--if exists then tar previous course name find out.
			Select SUM(Course3.Credit) into tocre FROM Course3 Inner JOIN
			Enrollment2 ON Course3.C3ID = Enrollment2.CID Where (Enrollment2.SID = stid);
			DBMS_OUTPUT.PUT_LINE(tocre);
			IF tocre<15 THEN 
				SELECT PreCName into pcname from Course3 where C3ID = crsid;
				DBMS_OUTPUT.PUT_LINE(pcname);
				--pre course empty /not
				IF (pcname!=' ') THEN
					--find out the id of that pre course
					SELECT CID into cidd from Course1 where pcname=Course1.CName;
					--check if that student had enrolled that course
					SELECT COUNT(*) into total2 from Enrollment2 WHERE (CID= cidd and SID =stid);
					--if yes then 
					DBMS_OUTPUT.PUT_LINE(total2);
					IF total2>0 THEN
						INSERT into Enrollment2 VALUES((n+1),crsid,stid);
						DBMS_OUTPUT.PUT_LINE('Inserted');
						COMMIT;
					ELSE Raise myExp3;
					End If;
				
				ELSE 
					INSERT into Enrollment2 VALUES((n+1),crsid,stid);
					DBMS_OUTPUT.PUT_LINE('Inserted');
					COMMIT;
					
				End If;
			ELSE
			Raise myExp2;
			END IF;
			
		ELSE 
			Raise myExp1;
		End IF;
	EXCEPTION
		WHEN myExp1 THEN  DBMS_OUTPUT.PUT_LINE('Course or Student does not exist');
		WHEN myExp2 THEN DBMS_OUTPUT.PUT_LINE('You have taken max course');
		WHEN myExp3 THEN DBMS_OUTPUT.PUT_LINE('Complete the previous Course');	
		WHEN OTHERS THEN
			DBMS_OUTPUT.PUT_LINE('Other errors');

	End Enrl1;
END enr1_p;
/
BEGIN
	enr1_p.Enrl1;
End;
/