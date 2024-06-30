-- Switch to the 'SqlPractical' database
USE SqlPractical;

-- Create the 'Employees' table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    JobTitle VARCHAR(100),
    Salary DECIMAL(10, 2)
);
GO

-- Create the 'EmployeeArchive' table
CREATE TABLE EmployeeArchive (
    EmployeeID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    JobTitle VARCHAR(100),
    Salary DECIMAL(10, 2)
);
GO

-- Insert a single record into the 'Employees' table
INSERT INTO Employees (FirstName, LastName, JobTitle, Salary)
VALUES ('John', 'Doe', 'Software Engineer', 60000.00);
GO

-- Insert multiple records into the 'Employees' table
INSERT INTO Employees (FirstName, LastName, JobTitle, Salary)
VALUES 
    ('Jane', 'Smith', 'Project Manager', 75000.00),
    ('Emily', 'Johnson', 'Data Analyst', 55000.00),
    ('Michael', 'Brown', 'QA Engineer', 50000.00);
GO

-- Insert the results of a query into the 'EmployeeArchive' table
INSERT INTO EmployeeArchive (EmployeeID, FirstName, LastName, JobTitle, Salary)
SELECT EmployeeID, FirstName, LastName, JobTitle, Salary
FROM Employees
WHERE Salary > 55000;
GO



