create database ss3_student_management;
use ss3_student_management;
create table class(
classID int primary key auto_increment,
className varchar(20),
startDate date,
status int
);
create table student(
studentID int primary key auto_increment,
studentName	varchar(50),
address varchar(50),
phone int,
status int,
classID int,
foreign key(classID) references class(classID)
);
create table subject(
subID int primary key auto_increment,
subName varchar(20),
credit int,
status int
);
create table mark(
markID int primary key auto_increment,
subID int,
studentID int,
mark int,
examTimes int,
foreign key(subID) references subject(subID),
foreign key(studentID) references student(studentID)
);
INSERT INTO class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO class
VALUES (3, 'B3', current_date, 0);

INSERT INTO student (studentName, address, phone, status, classId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO student (studentName, address, status, classId)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO student (studentName, address, phone, status, classId)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO subject
VALUES (1, 'CF', 5, 1),
 (2, 'C', 6, 1),
 (3, 'HDJ', 5, 1),
 (4, 'RDBMS', 10, 1);
 INSERT INTO mark (subId, studentId, mark, examTimes)
VALUES (1, 1, 8, 1),
 (1, 2, 10, 2),
 (2, 1, 12, 1);