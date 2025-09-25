-- ---------------------------------------------------------
-- Task 3: Basic SELECT Queries
-- Database: internship
-- Table   : employee
-- Objective: Practice SELECT, WHERE, LIKE, BETWEEN, ORDER BY, LIMIT
-- ---------------------------------------------------------

-- Create a new database
CREATE DATABASE internship;

-- Switch to the new database
USE internship;

-- Create employee table
CREATE TABLE employee (
    empid INT PRIMARY KEY,        -- Unique Employee ID
    ename VARCHAR(20) NOT NULL,   -- Employee Name (cannot be NULL)
    age INT,                      -- Employee Age
    salary INT                    -- Employee Salary
);

-- Insert sample records
INSERT INTO employee VALUES (1, 'Amith',   23, 50000);
INSERT INTO employee VALUES (2, 'Kishore', 28, 65000);
INSERT INTO employee VALUES (3, 'Koushik', 21, 35000);
INSERT INTO employee VALUES (4, 'Ravi',    22, 55000);
INSERT INTO employee VALUES (5, 'Sandeep', 34, 80000);

-- ---------------------------------------------------------
-- Basic SELECT Queries
-- ---------------------------------------------------------

-- Select all columns from employee
SELECT * FROM employee;

-- Select only specific columns (empid, age, salary)
SELECT empid, age, salary FROM employee;

-- ---------------------------------------------------------
-- WHERE Clause Examples
-- ---------------------------------------------------------

-- Employees with age > 21 AND salary >= 5000
SELECT * 
FROM employee
WHERE (age > 21 AND salary >= 5000);

-- Employees with age > 21 OR salary >= 5000
SELECT * 
FROM employee
WHERE (age > 21 OR salary >= 5000);

-- ---------------------------------------------------------
-- LIKE Operator Examples
-- ---------------------------------------------------------

-- Names starting with 'K'
SELECT * 
FROM employee
WHERE ename LIKE 'K%';

-- Names with 'a' as the second character
SELECT * 
FROM employee
WHERE ename LIKE '_a%';

-- Names ending with 'p'
SELECT * 
FROM employee
WHERE ename LIKE '%p';

-- ---------------------------------------------------------
-- BETWEEN Example
-- ---------------------------------------------------------

-- Employees aged between 21 and 24 (inclusive)
SELECT * 
FROM employee
WHERE age BETWEEN 21 AND 24;

-- ---------------------------------------------------------
-- ORDER BY & LIMIT Examples
-- ---------------------------------------------------------

-- Employees sorted by salary (highest to lowest)
SELECT * 
FROM employee
ORDER BY salary DESC;

-- Top 3 highest paid employees
SELECT * 
FROM employee
ORDER BY salary DESC
LIMIT 3;
