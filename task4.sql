-- Task 4: Aggregate Functions, Grouping, and HAVING with LIKE Example

-- Create Students table
CREATE TABLE Students (
    student_id INT,
    name TEXT,
    department TEXT,
    marks INT
);

-- Insert sample data
INSERT INTO Students VALUES 
(1, 'Alice', 'CSE', 85),
(2, 'Bob', 'CSE', 90),
(3, 'Charlie', 'ECE', 78),
(4, 'David', 'ECE', 88),
(5, 'Eva', 'MECH', 76),
(6, 'Frank', 'MECH', 82),
(7, 'Grace', 'CSE', 95);

-- 1. Find total marks of all students
SELECT SUM(marks) AS total_marks
FROM Students;

-- 2. Find average marks per department
SELECT department, AVG(marks) AS avg_marks
FROM Students
GROUP BY department;

-- 3. Count number of students in each department
SELECT department, COUNT(student_id) AS total_students
FROM Students
GROUP BY department;

-- 4. Find departments where average marks > 85
SELECT department, AVG(marks) AS avg_marks
FROM Students
GROUP BY department
HAVING AVG(marks) > 85;

-- 5. Find departments where at least one student's name starts with 'A'
SELECT department, COUNT(*) AS total_students
FROM Students
GROUP BY department
HAVING SUM(CASE WHEN name LIKE 'A%' THEN 1 ELSE 0 END) > 0;

-- 6. Find departments where students with names ending in 'a' have an average marks > 80
SELECT department, AVG(marks) AS avg_marks_with_a
FROM Students
WHERE name LIKE '%a'
GROUP BY department
HAVING AVG(marks) > 80;
