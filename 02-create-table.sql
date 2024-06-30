-- Switch to the newly created database so that subsequent operations are performed within it
USE SqlPractical;

-- Create a new table named 'Students' with the following columns and constraints
CREATE TABLE Students(
    -- 'Id' is an integer column that serves as the primary key for the table
    -- The IDENTITY(1,1) function automatically generates a unique value for this column, starting at 1 and incrementing by 1
    Id INT PRIMARY KEY IDENTITY(1,1),

    -- 'FirstName' is a variable character column that can store up to 50 characters and cannot be NULL
    FirstName VARCHAR(50) NOT NULL,

    -- 'MiddleName' is a variable character column that can store up to 50 characters and can be NULL
    MiddleName VARCHAR(50),

    -- 'LastName' is a variable character column that can store up to 50 characters and cannot be NULL
    LastName VARCHAR(50) NOT NULL,

    -- 'Email' is a variable character column that can store up to 100 characters, cannot be NULL, and must be unique across the table
    Email VARCHAR(100) NOT NULL UNIQUE,

    -- 'PermanentAddress' is a text column that can store variable-length text and can be NULL
    PermanentAddress TEXT,

    -- 'Age' is an integer column that cannot be NULL and must be greater than 15
    Age INT NOT NULL CHECK (Age > 15),

    -- 'Country' is a variable character column that can store up to 100 characters and defaults to 'India' if no value is provided
    Country VARCHAR(100) DEFAULT 'India',

    -- 'DateOfBirth' is a date column that cannot be NULL
    DateOfBirth DATE NOT NULL,

    -- 'Height' is a decimal column with a precision of 10 digits and a scale of 2 digits (e.g., 12345678.90), and cannot be NULL
    Height DECIMAL(10,2) NOT NULL
);
