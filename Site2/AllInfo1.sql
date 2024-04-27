SET LINESIZE 1000;
clear screen;
DROP TABLE Enrollment2;
DROP TABLE Student2;
Drop Table Teacher2;
DROP TABLE Branch2;
DROP TABLE Course3;
DROP TABLE Course1;


CREATE TABLE Branch2 (
	BID int, 
	Bname varchar2(30), 
	Password varchar2(20), 
    PRIMARY KEY(BID));

CREATE TABLE Student2(
	SID INT, 
	SName varchar2(30), 
	SAge int, 
	SAddress varchar2(30), 
	SPhone varchar2(11),
	BID int,
    PRIMARY KEY(SID),
	FOREIGN KEY(BID) REFERENCES Branch2(BID)
	);
	
	
CREATE TABLE Course1(
	CID int, 
	CName varchar2(30), 
	BID int,
    PRIMARY KEY(CID)
	);
CREATE TABLE Course3(
	C3ID int,  
	Credit int, 
	CDep varchar2(30), 
	PreCName  varchar2(30) NULL,
	CID int,
    PRIMARY KEY(C3ID),
	FOREIGN KEY(CID) REFERENCES Course1(CID)
	);
	
	
CREATE TABLE Teacher2(
	TID int, 
	TName varchar2(30), 
	Desig varchar2(30), 
	TDep varchar2(30), 
	CID int,
    PRIMARY KEY(TID),
	FOREIGN KEY(CID) REFERENCES Course1(CID)
	);
	
	
	CREATE TABLE Enrollment2(
	EID int,  
	CID int,
	SID int,
    PRIMARY KEY(EID),
	FOREIGN KEY(SID) REFERENCES Student2(SID)
	);
	
	
	INSERT INTO Branch2 values (2, 'CTG','ctg');
	
	INSERT INTO Student2 values (100, 'Farhan',20,'Basabo',01716551990,2);
	INSERT INTO Student2 values (101, 'Abid',25,'Khilgaon',01715661990,2);
	INSERT INTO Student2 values (102, 'Abed',30,'Tejgaon',01719922990,2);
	
	INSERT INTO Course1 values (100, 'EEE1',2);
	INSERT INTO Course1 values (101, 'EEE2',2);
	INSERT INTO Course1 values (102, 'x',2);
	INSERT INTO Course1 values (103, 'x1',2);
	INSERT INTO Course1 values (104 ,'y',2);
	INSERT INTO Course1 values (105 ,'yd',2);
	
	INSERT INTO Course3 values (100,3,'EEE',' ',100);
	INSERT INTO Course3 values (101,3,'EEE','EEE1',101);
	INSERT INTO Course3 values (102,3,'EEE',' ',102);
	INSERT INTO Course3 values (103,3,'EEE','x',103);
	INSERT INTO Course3 values (104,3,'EEE',' ',104);
	INSERT INTO Course3 values (105,3,'EEE',' ',105);
	
	
	
	INSERT INTO Teacher2 values (100, 'A','Lecturer','EEE',100);
	INSERT INTO Teacher2 values (101, 'B','Lecturer','EEE',101);
	INSERT INTO Teacher2 values (102, 'C','Lecturer','EEE',102);
	INSERT INTO Teacher2 values (103, 'D','Lecturer','EEE',103);
	INSERT INTO Teacher2 values (104, 'E','Lecturer','EEE',104);
	
	INSERT INTO Enrollment2 values (100,100,100);
	INSERT INTO Enrollment2 values (101,101,101);
	INSERT INTO Enrollment2 values (102,102,102);
	
	INSERT INTO Course1 values (1,'DDS',1);
    INSERT INTO Course1 values (2,'CN',1);
    INSERT INTO Course1 values (3,'C',1);
    INSERT INTO Course1 values (4,'DB',1);
    INSERT INTO Course1 values (5,'DCOM',1);

	commit;
	SELECT *FROM Branch2;
	SELECT *FROM Student2;
	SELECT *FROM Course1;
	SELECT *FROM Course3;
	SELECT *FROM Teacher2;
	SELECT *FROM Enrollment2;