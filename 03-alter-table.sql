-- Switch to the 'SqlPractical' database
USE SqlPractical;

-- Create a table named 'Students' with columns 'FirstName' and 'LastName'
CREATE TABLE Students (
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

-- Create a table named 'Courses' with an auto-incrementing primary key 'Id' and a 'Title' column
CREATE TABLE Courses(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Title VARCHAR(100)
);

-- Add a new column 'RollNo' to the 'Students' table, which is an integer and cannot be NULL
ALTER TABLE Students 
ADD RollNo INT NOT NULL;

-- Add a new column 'City' to the 'Students' table, which is a fixed-length character string of 50 characters
ALTER TABLE Students
ADD City CHAR(50);

-- Add multiple new columns to the 'Students' table: 
-- 'Email' which is a variable character string of 100 characters and cannot be NULL
-- 'Phone' which is a variable character string of 10 characters
ALTER TABLE Students
ADD 
    Email VARCHAR(100) NOT NULL,
    Phone VARCHAR(10);

-- Add a NOT NULL constraint to the 'FirstName' column, ensuring it cannot be NULL
ALTER TABLE Students
ALTER COLUMN FirstName VARCHAR(50) NOT NULL;

-- Add a UNIQUE constraint to the 'Email' column to ensure all email addresses are unique
ALTER TABLE Students
ADD UNIQUE (Email);

-- Modify the 'City' column data type to variable character string of 100 characters
ALTER TABLE Students
ALTER COLUMN City VARCHAR(100);

-- Add a PRIMARY KEY constraint to the 'RollNo' column
ALTER TABLE Students
ADD PRIMARY KEY (RollNo);

-- Add a new column 'CourseId' to the 'Students' table, which is an integer and cannot be NULL
ALTER TABLE Students
ADD CourseId INT NOT NULL;

-- Add a FOREIGN KEY constraint to the 'CourseId' column, linking it to the 'Id' column in the 'Courses' table
ALTER TABLE Students
ADD FOREIGN KEY (CourseId) REFERENCES Courses(Id);

-- Drop the 'Phone' column from the 'Students' table
ALTER TABLE Students
DROP COLUMN Phone;

-- Drop the primary key constraint from the 'Students' table
-- Note: Replace 'PK__Students__7886D5A0D07311B0' with your actual primary key constraint name
ALTER TABLE Students
DROP CONSTRAINT PK__Students__7886D5A0D07311B0;

-- Drop multiple constraints from the 'Students' table
-- Note: Replace 'FK__Students__Course__3A81B327' and 'UQ__Students__A9D1053440146D7E' with your actual constraint names
ALTER TABLE Students
DROP CONSTRAINT 
    FK__Students__Course__3A81B327, -- Foreign key constraint
    UQ__Students__A9D1053440146D7E; -- Unique key constraint

-- Drop multiple columns from the 'Students' table: 'RollNo', 'City', 'Email', and 'CourseId'
ALTER TABLE Students
DROP COLUMN RollNo, City, Email, CourseId;
