CREATE DATABASE OnlineCourseDB

CREATE TABLE Courses(
     Id  int IDENTITY(1,1) NOT NULL  PRIMARY KEY,
     Name VARCHAR(100) NOT NULL ,
     Duration int NOT NULL
)

CREATE TABLE Teachers(
     Id int IDENTITY(1,1) NOT NULL PRIMARY KEY ,
     Name VARCHAR(500) NOT NULL ,
     Experience int 
)

CREATE TABLE Schedules(
     Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
     TeacherId int NOT NULL ,
     CourseId int NOT NULL,
     Day VARCHAR(100) NOT NULL,
     StartTime TIME NOT NULL,
     EndTime TIME NOT NULL,
     CONSTRAINT FK_Teacher_Schedules FOREIGN KEY (TeacherId) REFERENCES Teachers(Id),
     CONSTRAINT FK_Courses_Schedules FOREIGN KEY (CourseId) REFERENCES Courses(Id),
)

CREATE TABLE Students (
     Id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
     Name VARCHAR(500) NOT NULL,
     Age int NOT NULL
)

CREATE TABLE Students_Courses(
Id int  IDENTITY(1,1)  NOT NULL PRIMARY KEY,
StudentId int NOT NULL ,
CourseId int NOT NULL ,
ScheduleId int NOT NULL ,
CONSTRAINT FK_Students_Courses_Students FOREIGN KEY (StudentId) REFERENCES Students(Id),
CONSTRAINT FK_Students_Courses_Courses FOREIGN KEY (CourseId) REFERENCES Courses(Id),
CONSTRAINT FK_Students_Courses_Schedules FOREIGN KEY (ScheduleId) REFERENCES Schedules(Id),
)

INSERT INTO Courses VALUES
('Computer Science', 15),
('Mathematics', 10),
('Physics', 12),
('Chemistry', 14);

INSERT INTO Teachers (Name, Experience) VALUES
('Teacher 1', 10),
('Teacher 2', 5),
('Teacher 3', 8),
('Teacher 4', 7);

INSERT INTO Schedules (TeacherID, CourseID, Day, StartTime, EndTime) VALUES
(1, 1, 'Monday', '12:00', '13:00'),
(1, 1, 'Wednesday', '16:00', '17:00'),
(1, 1, 'Friday', '12:00', '13:00'),
(2, 2, 'Tuesday', '10:00', '11:00'),
(2, 2, 'Thursday', '10:00', '11:00'),
(3, 3, 'Monday', '14:00', '15:00'),
(3, 3, 'Wednesday', '14:00', '15:00'),
(4, 4, 'Friday', '09:00', '10:00'),
(4, 4, 'Saturday', '09:00', '10:00');

INSERT INTO Students  VALUES
('Student 1', 20 ),
('Student 2', 22 ),
('Student 3', 19 ),
('Student 4', 21);


INSERT INTO Students_Courses  VALUES
(1, 1, 1),
(1, 2, 4),
(2, 1, 2),
(2, 3, 6),
(3, 4, 8),
(3, 1, 3),
(4, 2, 5),
(4, 3, 7);

