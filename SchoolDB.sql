USE SchoolDB
GO

CREATE TABLE msSchool(
	SchoolID INTEGER PRIMARY KEY,
	SchoolName VARCHAR(100)
)

CREATE TABLE msTeacher(
	TeacherID VARCHAR(100) PRIMARY KEY,
	TeacherName VARCHAR(100)
)

CREATE TABLE msStudent(
	StudentID VARCHAR(100) PRIMARY KEY,
	StudentName VARCHAR(100)
)

CREATE TABLE msGroup(
	GroupID VARCHAR(100) PRIMARY KEY,
	GroupName VARCHAR(100)
)

CREATE TABLE trMappingTeacherGroup(
	MapID INTEGER PRIMARY KEY,	
	TeacherID VARCHAR(100) FOREIGN KEY REFERENCES msTeacher(TeacherID),
	GroupID VARCHAR(100) FOREIGN KEY REFERENCES msGroup(GroupID)
)

CREATE TABLE trMappingStudentGroup(
	MapID INTEGER,	
	StudentID VARCHAR(100),
	GroupID VARCHAR(100)
)

INSERT INTO msSchool VALUES(1,'Saint George High School')
INSERT INTO msTeacher VALUES('101010','Natasha Hudson'), ('202020','Steve Porter')
INSERT INTO msStudent VALUES('S101010','Peter White'), ('S202020','Geogre Redwood'), ('S303030','Maria Steward'),('S404040','Michael Robinson')
INSERT INTO msGroup VALUES('G01','Advanced English'), ('G02','Java programming course'), ('G03', 'HTML Course')
INSERT INTO trMappingTeacherGroup VALUES(1,'101010','G01'), (2,'101010','G02'), (3,'202020','G03')
INSERT INTO trMappingStudentGroup VALUES(1,'S202020','G01'), (2,'S404040','G01'), (3,'S303030','G01'),(4,'S303030','G02'),(5,'S101010','G02')

--NO 1
--SELECT GroupName
--FROM msGroup  
--WHERE GroupId IN ( 
--	SELECT GroupID
--	FROM trMappingTeacherGroup a JOIN msTeacher b ON a.TeacherID = b.TeacherID
--	WHERE b.TeacherName LIKE 'Steve Porter' AND b.TeacherID LIKE '202020' 
--)

-- NO 2
--SELECT StudentName
--FROM msStudent
--WHERE StudentID IN(
--	SELECT StudentID
--	FROM trMappingStudentGroup a JOIN msGroup b ON a.GroupID = b.GroupID
--	WHERE a.StudentID LIKE 'S404040' AND b.GroupName LIKE 'Advanced English'
--)

-- NO 3
--SELECT StudentName
--FROM msStudent  
--WHERE StudentID IN ( 
--	SELECT msS.StudentID
--	FROM msStudent msS JOIN trMappingStudentGroup trMSG ON msS.StudentID = trMSG.StudentID
--		 JOIN trMappingTeacherGroup trMTG ON trMTG.GroupID = trMSG.GroupID 
--		 JOIN msTeacher msT ON msT.TeacherID = trMTG.TeacherID
--	WHERE msT.TeacherName LIKE 'Natasha Hudson' AND msT.TeacherID LIKE '101010' 
--)
