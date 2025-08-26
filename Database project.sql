CREATE DATABASE StudentDB;
USE StudentDB;

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    DeptID INT,
    GPA FLOAT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Semester VARCHAR(10),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Departments VALUES 
(1, 'Computer Science'),
(2, 'Electrical Engineering'),
(3, 'Business Administration');

INSERT INTO Students VALUES 
(101, 'Ali Khan', 20, 'Male', 1, 3.5),
(102, 'Sara Ahmed', 21, 'Female', 1, 3.9),
(103, 'Usman Tariq', 22, 'Male', 2, 3.2),
(104, 'Zara Shah', 20, 'Female', 3, 3.0);

INSERT INTO Courses VALUES 
(201, 'Database Systems', 1),
(202, 'Circuit Analysis', 2),
(203, 'Marketing Basics', 3);

INSERT INTO Enrollments VALUES 
(1, 101, 201, 'Fall'),
(2, 102, 201, 'Fall'),
(3, 103, 202, 'Spring'),
(4, 104, 203, 'Fall');


SELECT * FROM Students WHERE GPA > 3.2;

SELECT S.Name 
FROM Students S
JOIN Departments D ON S.DeptID = D.DeptID
WHERE D.DeptName = 'Computer Science';

SELECT C.CourseName 
FROM Courses C
JOIN Enrollments E ON C.CourseID = E.CourseID
JOIN Students S ON E.StudentID = S.StudentID
WHERE S.Name = 'Ali Khan';
SELECT D.DeptName, COUNT(*) AS TotalStudents
FROM Departments D
JOIN Students S ON D.DeptID = S.DeptID
GROUP BY D.DeptName;