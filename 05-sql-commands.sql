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
