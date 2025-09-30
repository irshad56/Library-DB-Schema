-- ======================================
-- Task 6: Subqueries and Nested Queries
-- ======================================
use internship;
-- 1. Create Tables
DROP TABLE IF EXISTS Library;
DROP TABLE IF EXISTS Librarian;
DROP TABLE IF EXISTS Member;
DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Borrow;

CREATE TABLE Library (
    library_id INT PRIMARY KEY,
    name TEXT,
    location TEXT
);

CREATE TABLE Librarian (
    librarian_id INT PRIMARY KEY,
    name TEXT,
    library_id INT,
    FOREIGN KEY (library_id) REFERENCES Library(library_id)
);

CREATE TABLE Member (
    member_id INT PRIMARY KEY,
    name TEXT,
    library_id INT,
    FOREIGN KEY (library_id) REFERENCES Library(library_id)
);

CREATE TABLE Book (
    book_id INT PRIMARY KEY,
    title TEXT,
    category TEXT,
    price REAL,
    library_id INT,
    FOREIGN KEY (library_id) REFERENCES Library(library_id)
);

CREATE TABLE Borrow (
    borrow_id INT PRIMARY KEY,
    member_id INT,
    book_id INT,
    librarian_id INT,
    borrow_date DATE,
    FOREIGN KEY (member_id) REFERENCES Member(member_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (librarian_id) REFERENCES Librarian(librarian_id)
);

-- 2. Insert Sample Data
INSERT INTO Library VALUES (1, 'Central Library', 'Downtown');
INSERT INTO Library VALUES (2, 'Community Library', 'Uptown');

INSERT INTO Librarian VALUES (101, 'Alice', 1);
INSERT INTO Librarian VALUES (102, 'Bob', 2);

INSERT INTO Member VALUES (201, 'Irshad', 1);
INSERT INTO Member VALUES (202, 'Ravi', 1);
INSERT INTO Member VALUES (203, 'Sneha', 2);

INSERT INTO Book VALUES (301, 'DBMS Basics', 'CS', 400, 1);
INSERT INTO Book VALUES (302, 'AI Fundamentals', 'AI', 600, 1);
INSERT INTO Book VALUES (303, 'Python Programming', 'CS', 500, 2);
INSERT INTO Book VALUES (304, 'Data Science 101', 'AI', 700, 2);

INSERT INTO Borrow VALUES (401, 201, 301, 101, '2025-09-01');
INSERT INTO Borrow VALUES (402, 202, 302, 101, '2025-09-02');
INSERT INTO Borrow VALUES (403, 203, 303, 102, '2025-09-05');

-- ===============================
-- Subquery Examples
-- ===============================

-- 1. Scalar Subquery: Find book with highest price
SELECT title, price
FROM Book
WHERE price = (SELECT MAX(price) FROM Book);

-- 2. Subquery with IN: Find members who borrowed at least one book
SELECT name
FROM Member
WHERE member_id IN (SELECT member_id FROM Borrow);

-- 3. Subquery with EXISTS: Find librarians who issued at least one book
SELECT l.name
FROM Librarian l
WHERE EXISTS (
    SELECT 1
    FROM Borrow b
    WHERE b.librarian_id = l.librarian_id
);

-- 4. Scalar Subquery with = : Find books above average price
SELECT title, price
FROM Book
WHERE price > (SELECT AVG(price) FROM Book);

-- 5. Subquery in FROM: Find average price of books per category
SELECT category, AVG(price) AS avg_price
FROM (
    SELECT category, price
    FROM Book
) AS sub
GROUP BY category;
