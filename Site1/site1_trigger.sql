-- INSERT TRIGGERS
create or replace trigger student_insert
after insert on Student1
DECLARE
BEGIN
	dbms_output.put_line('[Site 1] New Student Inserted.');
END;
/

create or replace trigger teacher_insert
after insert on Teacher1
DECLARE
BEGIN
	dbms_output.put_line('[Site 1] New Teacher Inserted.');
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
after insert on Course2
DECLARE
BEGIN
	dbms_output.put_line('[Site 1] New Course Inserted.');
END;
/

create or replace trigger enrollment_insert
after insert on Enrollment1
DECLARE
BEGIN
	dbms_output.put_line('[Site 1] New Enrollment Inserted.');
END;
/
-- DELETE TRIGGERS
create or replace trigger student_delete
after delete on Student1
DECLARE
BEGIN
	dbms_output.put_line('[Site 1] Student Deleted.');
	dbms_output.put_line('[Site 2] Student Deleted.');
END;
/

create or replace trigger teacher_delete
after delete on Teacher1
DECLARE
BEGIN
	dbms_output.put_line('[Site 1] Teacher Deleted.');
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
after delete on course2
DECLARE
BEGIN
	dbms_output.put_line('[Site 1] Course Deleted.');
END;
/
create or replace trigger enrollment_delete
after delete on Enrollment1
DECLARE
BEGIN
	dbms_output.put_line('[Site 1] Enrollment Deleted.');
END;
/
-- UPDATE TRIGGERS
create or replace trigger student_update
after update on Student1 for each row
DECLARE
BEGIN
	dbms_output.put_line('[Site 1] Student Updated');
	dbms_output.put_line('[Site 2] Student Updated');
END;
/