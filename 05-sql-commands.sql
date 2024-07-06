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

INSERT INTO Students (FirstName, LastName, AGE, EnrollmentDate) VALUES
('Aarav', 'Sharma', 14, '2023-06-15'),
('Vivaan', 'Verma', 15, '2023-06-15'),
('Aditya', 'Kumar', 14, '2023-06-15'),
('Vihaan', 'Gupta', 13, '2023-06-15'),
('Arjun', 'Singh', 15, '2023-06-15'),
('Sai', 'Iyer', 14, '2023-06-15'),
('Reyansh', 'Mehta', 13, '2023-06-15'),
('Krishna', 'Patel', 15, '2023-06-15'),
('Ishaan', 'Chopra', 14, '2023-06-15'),
('Raghav', 'Nair', 13, '2023-06-15');


INSERT INTO Teachers (FirstName, LastName, HireDate, Subject) VALUES
('Ananya', 'Sharma', '2019-08-01', 'Mathematics'),
('Aditi', 'Verma', '2018-07-10', 'English'),
('Riya', 'Kumar', '2020-06-15', 'Science'),
('Diya', 'Gupta', '2017-05-20', 'History'),
('Ishita', 'Singh', '2021-09-25', 'Geography'),
('Nisha', 'Iyer', '2016-04-18', 'Physics'),
('Tanya', 'Mehta', '2019-10-30', 'Chemistry'),
('Pooja', 'Patel', '2018-11-15', 'Biology'),
('Meera', 'Chopra', '2020-01-20', 'Computer Science'),
('Sneha', 'Nair', '2021-03-10', 'Economics');

INSERT INTO Classes (ClassName, TeacherID, StartDate, EndDate) VALUES
('Mathematics 101', 1, '2023-06-15', '2023-12-15'),
('English 101', 2, '2023-06-15', '2023-12-15'),
('Science 101', 3, '2023-06-15', '2023-12-15'),
('History 101', 4, '2023-06-15', '2023-12-15'),
('Geography 101', 5, '2023-06-15', '2023-12-15'),
('Physics 101', 6, '2023-06-15', '2023-12-15'),
('Chemistry 101', 7, '2023-06-15', '2023-12-15'),
('Biology 101', 8, '2023-06-15', '2023-12-15'),
('Computer Science 101', 9, '2023-06-15', '2023-12-15'),
('Economics 101', 10, '2023-06-15', '2023-12-15');


-- Update the age of the student with StudentID = 1 to 16
UPDATE Students
SET AGE = 16
WHERE StudentID = 1;


-- Insert a new student record
INSERT INTO Students (FirstName, LastName, AGE, EnrollmentDate)
VALUES ('Rohit', 'Shah', 15, '2023-06-15');


-- Delete the student record with StudentID = 2
DELETE FROM Students
WHERE StudentID = 2;

-- Select the first name, last name, and age of all students
SELECT FirstName, LastName, AGE
FROM Students;

-- Select distinct subjects taught by teachers
SELECT DISTINCT Subject
FROM Teachers;


-- Select students whose age is greater than 14
SELECT FirstName, LastName, AGE
FROM Students
WHERE AGE > 14;

-- Select teachers who teach either Mathematics or Science
SELECT FirstName, LastName
FROM Teachers
WHERE Subject IN ('Mathematics', 'Science');

-- Select students whose age is between 13 and 15
SELECT FirstName, LastName, AGE
FROM Students
WHERE AGE BETWEEN 13 AND 15;



-- Group teachers by subject and count the number of teachers per subject
SELECT Subject, COUNT(*) AS NumberOfTeachers
FROM Teachers
GROUP BY Subject;


-- Group teachers by subject and select subjects with more than one teacher
SELECT Subject, COUNT(*) AS NumberOfTeachers
FROM Teachers
GROUP BY Subject
HAVING COUNT(*) > 1;

-- Group teachers by subject and select subjects with more than one teacher
SELECT Subject, COUNT(*) AS NumberOfTeachers
FROM Teachers
GROUP BY Subject
HAVING COUNT(*) > 1;


-- Select all students and order them by age in descending order
SELECT FirstName, LastName, AGE
FROM Students
ORDER BY AGE DESC;

-- Calculate the total age of all students
SELECT SUM(AGE) AS TotalAge
FROM Students;

-- Calculate the average age of all students
SELECT AVG(AGE) AS AverageAge
FROM Students;

-- Count the number of students
SELECT COUNT(*) AS NumberOfStudents
FROM Students;


-- Count the number of students
SELECT COUNT(*) AS NumberOfStudents
FROM Students;

-- Find the maximum age among all students
SELECT MAX(AGE) AS OldestStudentAge
FROM Students;

-- Find the minimum age among all students
SELECT MIN(AGE) AS YoungestStudentAge
FROM Students;

