-- Create Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    EnrollmentDate DATE
);

-- Create Teachers table
CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    HireDate DATE,
    Subject NVARCHAR(50)
);

-- Create Classes table
CREATE TABLE Classes (
    ClassID INT PRIMARY KEY IDENTITY(1,1),
    ClassName NVARCHAR(100) NOT NULL,
    TeacherID INT,
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);

-- Create Enrollments table (junction table)
CREATE TABLE Enrollments (
    StudentID INT,
    ClassID INT,
    PRIMARY KEY (StudentID, ClassID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

-- Insert Records into Students
INSERT INTO Students (FirstName, LastName, DateOfBirth, EnrollmentDate) 
VALUES 
('Aarav', 'Sharma', '2008-04-15', '2023-06-10'),
('Vivaan', 'Verma', '2009-06-25', '2023-06-10'),
('Diya', 'Singh', '2007-08-20', '2023-06-10'),
('Aanya', 'Kumar', '2010-09-10', '2023-06-10'),
('Ishaan', 'Gupta', '2009-02-18', '2023-06-10'),
('Ananya', 'Patel', '2008-07-22', '2023-06-10'),
('Rohan', 'Agarwal', '2010-12-05', '2023-06-10'),
('Meera', 'Reddy', '2009-11-17', '2023-06-10'),
('Kavya', 'Nair', '2008-03-29', '2023-06-10'),
('Aryan', 'Das', '2010-01-14', '2023-06-10');


-- Insert Records into Teachers
INSERT INTO Teachers (FirstName, LastName, HireDate, Subject) 
VALUES 
('Raj', 'Mehta', '2015-01-15', 'Math'),
('Neha', 'Saxena', '2016-03-22', 'Science'),
('Vikram', 'Pandey', '2018-07-05', 'History'),
('Smita', 'Rao', '2019-09-10', 'English'),
('Anil', 'Joshi', '2017-04-12', 'Geography'),
('Priya', 'Bhatt', '2020-01-25', 'Physics'),
('Sanjay', 'Kapoor', '2014-11-18', 'Chemistry'),
('Lakshmi', 'Iyer', '2021-05-06', 'Biology'),
('Sunita', 'Mishra', '2013-08-09', 'Computer Science'),
('Ravi', 'Kulkarni', '2019-10-11', 'Physical Education');


-- Insert Records into Classes

INSERT INTO Classes (ClassName, TeacherID, StartDate, EndDate)
VALUES
('Mathematics', 1, '2023-06-15', '2024-04-30'),
('Science', 2, '2023-06-15', '2024-04-30'),
('History', 3, '2023-06-15', '2024-04-30'),
('English', 4, '2023-06-15', '2024-04-30'),
('Geography', 5, '2023-06-15', '2024-04-30'),
('Physics', 6, '2023-06-15', '2024-04-30'),
('Chemistry', 7, '2023-06-15', '2024-04-30'),
('Biology', 8, '2023-06-15', '2024-04-30'),
('Computer Science', 9, '2023-06-15', '2024-04-30'),
('Physical Education', 10, '2023-06-15', '2024-04-30');

-- Insert into Enrollments
INSERT INTO Enrollments (StudentID, ClassID) 
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 1);

-- Delete a student
DELETE FROM Students WHERE StudentID = 1;

-- Select all students
SELECT * FROM Students;

-- Select distinct subjects taught by teachers
SELECT DISTINCT Subject FROM Teachers;

-- Select students enrolled in a specific class
SELECT s.* 
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.ClassID = 1;

-- Select students born between a specific range
SELECT * FROM Students WHERE DateOfBirth BETWEEN '2009-01-01' AND '2010-12-31';

-- Select teachers whose IDs are in a given list
SELECT * FROM Teachers WHERE TeacherID IN (1, 2);


-- Group by class and having a condition on student count
SELECT c.ClassID, COUNT(e.StudentID) AS StudentCount 
FROM Classes c
INNER JOIN Enrollments e ON c.ClassID = e.ClassID
GROUP BY c.ClassID 
HAVING COUNT(e.StudentID) > 1;

-- Order students by last name
SELECT * FROM Students ORDER BY LastName DESC;


-- Get count, max, min, and avg age of students
SELECT 
    COUNT(*) AS StudentCount, 
    MAX(DATEPART(YEAR, GETDATE()) - DATEPART(YEAR, DateOfBirth)) AS MaxAge, 
    MIN(DATEPART(YEAR, GETDATE()) - DATEPART(YEAR, DateOfBirth)) AS MinAge, 
    AVG(DATEPART(YEAR, GETDATE()) - DATEPART(YEAR, DateOfBirth)) AS AvgAge 
FROM Students;


-- Join Students and Enrollments to get student-class information
SELECT s.StudentID, s.FirstName, s.LastName, c.ClassName 
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Classes c ON e.ClassID = c.ClassID;


-- Join Students and Enrollments to get student-class information
SELECT s.StudentID, s.FirstName, s.LastName, c.ClassName 
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Classes c ON e.ClassID = c.ClassID;


-- Cartesian product of Students and Classes
SELECT * 
FROM Students, Classes;


-- Union of two select statements
SELECT FirstName, LastName FROM Students
UNION
SELECT FirstName, LastName FROM Teachers;


