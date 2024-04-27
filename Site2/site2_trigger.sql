-- INSERT TRIGGERS
create or replace trigger student_insert
after insert on Student2
DECLARE
BEGIN
	dbms_output.put_line('[Site 2] New Student Inserted.');
END;
/

create or replace trigger teacher_insert
after insert on Teacher2
DECLARE
BEGIN
	dbms_output.put_line('[Site 2] New Teacher Inserted.');
END;
/

create or replace trigger course_insert1
after insert on Course1
DECLARE
BEGIN
	dbms_output.put_line('[Site 1] New Course Inserted.');
	dbms_output.put_line('[Site 2] New Course Inserted.');
END;
/
create or replace trigger course_insert2
after insert on Course3
DECLARE
BEGIN
	dbms_output.put_line('[Site 2] New Course Inserted.');
END;
/

create or replace trigger enrollment_insert
after insert on Enrollment2
DECLARE
BEGIN
	dbms_output.put_line('[Site 2 New Enrollment Inserted.');
END;
/
-- DELETE TRIGGERS
create or replace trigger student_delete
after delete on Student2
DECLARE
BEGIN

	dbms_output.put_line('[Site 2] Student Deleted.');
END;
/

create or replace trigger teacher_delete
after delete on Teacher2
DECLARE
BEGIN
	dbms_output.put_line('[Site 2] Teacher Deleted.');
END;
/

create or replace trigger course_delete1
after delete on course1
DECLARE
BEGIN
	dbms_output.put_line('[Site 1] Course Deleted.');
	dbms_output.put_line('[Site 2] Course Deleted.');
END;
/
create or replace trigger course_delete2
after delete on course3
DECLARE
BEGIN
	dbms_output.put_line('[Site 2] Course Deleted.');
END;
/
create or replace trigger enrollment_delete
after delete on Enrollment2
DECLARE
BEGIN
	dbms_output.put_line('[Site 2] Enrollment Deleted.');
END;
/
-- UPDATE TRIGGERS
create or replace trigger student_update
after update on Student2 for each row
DECLARE
BEGIN
	dbms_output.put_line('[Site 2] Student Updated');
END;
/