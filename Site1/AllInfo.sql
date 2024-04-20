SET LINESIZE 1000;
clear screen;
DROP TABLE Enrollment1;
DROP TABLE Student1 ;
Drop Table Teacher1;
DROP TABLE Branch1 ;
DROP TABLE Course2;
DROP TABLE Course1;


CREATE TABLE Branch1 (
	BID int, 
	Bname varchar2(30), 
	Password varchar2(20), 
    PRIMARY KEY(BID));

CREATE TABLE Student1(
	SID INT, 
	SName varchar2(30), 
	SAge int, 
	SAddress varchar2(30), 
	SPhone varchar2(11),
	BID int,
    PRIMARY KEY(SID),
	FOREIGN KEY(BID) REFERENCES Branch1(BID)
	);
	
	
CREATE TABLE Course1(
	CID int, 
	CName varchar2(30),
	BID int,	
    PRIMARY KEY(CID)
	);
CREATE TABLE Course2(
	C2ID int,  
	Credit int, 
	CDep varchar2(30), 
	PreCName  varchar2(30) NULL,
	CID int,
    PRIMARY KEY(C2ID),
	FOREIGN KEY(CID) REFERENCES Course1(CID)
	);
	
	
CREATE TABLE Teacher1(
	TID int, 
	TName varchar2(30), 
	Desig varchar2(30), 
	TDep varchar2(30), 
	CID int,
    PRIMARY KEY(TID),
	FOREIGN KEY(CID) REFERENCES Course1(CID)
	);
	
	
	CREATE TABLE Enrollment1(
	EID int,  
	CID int,
	SID int,
    PRIMARY KEY(EID),
	FOREIGN KEY(SID) REFERENCES Student1(SID)
	);
	
	
	INSERT INTO Branch1 values (1, 'Dhaka','dhaka');
	INSERT INTO Student1 values (1, 'Sohel',20,'Tejgaon',01716371990,1);
	INSERT INTO Student1 values (2, 'Rana',25,'Khilgaon',01715571990,1);
	INSERT INTO Student1 values (3, 'Masud',30,'Basabo',01719991990,1);
	
	INSERT INTO Course1 values (1,'DDS',1);
	INSERT INTO Course1 values (2,'CN',1);
	INSERT INTO Course1 values (3,'C',1);
	INSERT INTO Course1 values (4,'DB',1);
	INSERT INTO Course1 values (5,'DCOM',1);
	
	INSERT INTO Course1 values (100, 'EEE1',2);
    INSERT INTO Course1 values (101, 'EEE2',2);
    INSERT INTO Course1 values (102, 'x',2);
    INSERT INTO Course1 values (103, 'x1',2);
    INSERT INTO Course1 values (104 ,'y',2);
	
	INSERT INTO Course2 values (1,3,'CSE','DB',1);
	INSERT INTO Course2 values (2,3,'CSE','DCOM',2);
	INSERT INTO Course2 values (3,3,'CSE',' ',3);
	INSERT INTO Course2 values (4,3,'CSE',' ',4);
	INSERT INTO Course2 values (5,3,'CSE',' ',5);
	
	
	
	INSERT INTO Teacher1 values (1, 'Shejuti','Lecturer','CSE',1);
	INSERT INTO Teacher1 values (2, 'Joy','Lecturer','CSE',2);
	INSERT INTO Teacher1 values (3, 'Belal','Lecturer','CSE',3);
	INSERT INTO Teacher1 values (4, 'Hasib','Lecturer','CSE',4);
	INSERT INTO Teacher1 values (5, 'Maruf','Lecturer','CSE',5);
	
	INSERT INTO Enrollment1 values (1,1,1);
	INSERT INTO Enrollment1 values (2,4,2);
	INSERT INTO Enrollment1 values (3,5,3);
	INSERT INTO Enrollment1 values (4,5,2);
	commit;
	SELECT *FROM Branch1;
	SELECT *FROM Student1;
	SELECT *FROM Course1;
	SELECT *FROM Course2;
	SELECT *FROM Teacher1;
	SELECT *FROM Enrollment1;