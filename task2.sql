-- Create database
CREATE DATABASE library_task2;

-- Select database
USE library_task2;

-- Create tables
CREATE TABLE Librarian (
    librarian_id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50)
);

CREATE TABLE Customer (
    customer_id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50),
    phone VARCHAR(15)
);

CREATE TABLE Book (
    book_id INTEGER PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(50),
    published_year INTEGER
);

CREATE TABLE Rental (
    rental_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    book_id INTEGER,
    rental_date DATE,
    return_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
);

-- Insert records (with some NULLs)
INSERT INTO Librarian VALUES (1, 'Emma Watson', 'emma@library.com');
INSERT INTO Librarian VALUES (2, 'Daniel Green', NULL); -- NULL email

INSERT INTO Customer VALUES (101, 'Alice Johnson', 'alice@gmail.com', '9876543210');
INSERT INTO Customer VALUES (102, 'Bob Smith', NULL, '9123456780'); -- NULL email
INSERT INTO Customer VALUES (103, 'Charlie Brown', 'charlie@gmail.com', NULL); -- NULL phone

INSERT INTO Book VALUES (201, 'Database Systems', 'C. J. Date', 2005);
INSERT INTO Book VALUES (202, 'Artificial Intelligence', 'Tom Mitchell', NULL); -- NULL year
INSERT INTO Book VALUES (203, 'Computer Networks', 'Andrew Tanenbaum', 2010);

INSERT INTO Rental VALUES (301, 101, 201, '2025-09-01', NULL); -- Not returned yet
INSERT INTO Rental VALUES (302, 102, 202, '2025-09-05', '2025-09-15');

-- Check data
SELECT * FROM Librarian;
SELECT * FROM Customer;
SELECT * FROM Book;
SELECT * FROM Rental;

-- Update records (fix missing data)
UPDATE Librarian SET email = 'daniel@library.com' WHERE librarian_id = 2;

UPDATE Customer SET email = 'bob@gmail.com' WHERE customer_id = 102;
UPDATE Customer SET phone = '9000000000' WHERE customer_id = 103;

UPDATE Book SET published_year = 1997 WHERE book_id = 202;

-- Check data again
SELECT * FROM Librarian;
SELECT * FROM Customer;
SELECT * FROM Book;

-- Delete attempts
DELETE FROM Rental WHERE rental_id >= 400;   -- no rows deleted
DELETE FROM Book WHERE book_id = 203;       -- success
DELETE FROM Customer WHERE customer_id = 103; -- success

-- Final data check
SELECT * FROM Librarian;
SELECT * FROM Customer;
SELECT * FROM Book;
SELECT * FROM Rental;
