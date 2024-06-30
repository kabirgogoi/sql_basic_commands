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

-- Insert sample data into the 'Employees' table
INSERT INTO Employees (FirstName, LastName, JobTitle, Salary)
VALUES 
    ('John', 'Doe', 'Software Engineer', 60000.00),
    ('Jane', 'Smith', 'Project Manager', 75000.00),
    ('Emily', 'Johnson', 'Data Analyst', 55000.00),
    ('Michael', 'Brown', 'QA Engineer', 50000.00);
GO

-- Delete the employee with EmployeeID 1
DELETE FROM Employees
WHERE EmployeeID = 1;
GO


-- Delete all employees with a salary less than 60000
DELETE FROM Employees
WHERE Salary < 60000;
GO


-- Delete all records from the 'Employees' table
DELETE FROM Employees;
GO


