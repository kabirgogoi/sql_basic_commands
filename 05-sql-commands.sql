-- Create Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    AGE INT,
    EnrollmentDate DATE
);

-- Create Teachers table
CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    HireDate DATE,
    Subject VARCHAR(50)
);

-- Create Classes table
CREATE TABLE Classes (
    ClassID INT PRIMARY KEY IDENTITY(1,1),
    ClassName VARCHAR(100) NOT NULL,
    TeacherID INT,
    StartDate DATE,
    EndDate DATE,
   
);




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


