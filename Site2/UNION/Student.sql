SET SERVEROUTPUT ON;
SET VERIFY OFF;


SELECT * FROM Student1@site2
UNION
SELECT * FROM Student2;