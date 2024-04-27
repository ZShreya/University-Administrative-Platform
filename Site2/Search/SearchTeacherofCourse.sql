SET LINESIZE 1000;
SET SERVEROUTPUT ON;
SET Verify OFF;
ACCEPT A PROMPT "Enter Course ID :";

CREATE OR REPLACE PACKAGE srctc_p AS
	PROCEDURE TjoinC;
END srctc_p;
/

CREATE OR REPLACE PACKAGE BODY srctc_p AS

	PROCEDURE TjoinC
	IS
	ccid Course1.CID%TYPE;
	cccid Course1.CID%TYPE;
	ccname Course1.CName%TYPE;
	cccredit Course3.Credit%TYPE;
	ccdep Course3.CDep%TYPE;
	ccpname Course3.PreCName%TYPE;

	ttid Teacher2.TID%TYPE;
	ttname Teacher2.TName%TYPE;
	ttdesig Teacher2.Desig%TYPE;
	ttdep Teacher2.TDep%TYPE;
	n number;
	myExp EXCEPTION;

	BEGIN
		n:=0;
		ccid:= &A;
		SELECT COUNT(*) into n FROM Course1 WHERE Course1.CID=ccid;
		IF n>0 THEN
			SELECT Course1.CID,Course1.CName,Teacher2.TID,Teacher2.TName,Teacher2.Desig,Teacher2.TDep into
			cccid,ccname,ttid,ttname,ttdesig,ttdep FROM Course1
			INNER JOIN Teacher2 ON Course1.CID = Teacher2.TID  where  Course1.CID = ccid;
			SELECT Course3.Credit,Course3.CDep,Course3.PreCName into cccredit,ccdep,ccpname FROM Course3 where Course3.C3ID=ccid;
			DBMS_OUTPUT.PUT_LINE('CID'||chr(9)||'CName'||chr(9)||'Credit'||CHR(9)||'CDept'||chr(9)||'PrevCName'||chr(10)||cccid ||chr(9)||ccname||chr(9)||cccredit||chr(9)||ccdep||chr(9)||ccpname);
			DBMS_OUTPUT.PUT_LINE(CHR(10)||'TID'||chr(9)||'TName'||chr(9)||'TDesig'||chr(9)||CHR(9)||'TDept'||CHR(10)||ttid||CHR(9)||ttname||CHR(9)||ttdesig||CHR(9)||ttdep);
		ELSE RAISE myExp;
		
		END IF;
	EXCEPTION
		WHEN myExp THEN DBMS_OUTPUT.PUT_LINE('NOT FOUND');
		WHEN OTHERS THEN 
			DBMS_OUTPUT.PUT_LINE('Other Errors');
		
	END TjoinC;
END srctc_p;
/
BEGIN
	srctc_p.TjoinC;
END;
/