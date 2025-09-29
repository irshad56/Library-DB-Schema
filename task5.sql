-- ==============================
-- Step 1: Create Tables
-- ==============================

-- Drop if already exists (to avoid errors when re-running)
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;

-- Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50)
);

-- Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Product VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- ==============================
-- Step 2: Insert Sample Data
-- ==============================

INSERT INTO Customers (CustomerID, Name, City) VALUES
(1, 'Alice', 'Delhi'),
(2, 'Bob', 'Mumbai'),
(3, 'Charlie', 'Bangalore'),
(4, 'David', 'Hyderabad');

INSERT INTO Orders (OrderID, CustomerID, Product) VALUES
(101, 1, 'Laptop'),
(102, 2, 'Mobile'),
(103, 1, 'Tablet'),
(104, 5, 'Camera');   -- CustomerID=5 does not exist

-- ==============================
-- Step 3: Different Joins
-- ==============================

-- 1. INNER JOIN: Matching rows only
SELECT Customers.CustomerID, Customers.Name, Orders.Product
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

-- 2. LEFT JOIN: All customers + matching orders
SELECT Customers.CustomerID, Customers.Name, Orders.Product
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

-- 3. RIGHT JOIN: All orders + matching customers
-- (✅ Works in MySQL, ❌ Not supported in SQLite)
SELECT Customers.CustomerID, Customers.Name, Orders.Product
FROM Customers
RIGHT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

-- 4. FULL OUTER JOIN: All customers + all orders
-- (✅ Works in MySQL, ❌ Not supported in SQLite directly)
SELECT Customers.CustomerID, Customers.Name, Orders.Product
FROM Customers
FULL OUTER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

-- ==============================
-- Step 4: Alternatives for SQLite
-- ==============================

-- Simulate RIGHT JOIN in SQLite (reverse LEFT JOIN)
SELECT Customers.CustomerID, Customers.Name, Orders.Product
FROM Orders
LEFT JOIN Customers
ON Customers.CustomerID = Orders.CustomerID;

-- Simulate FULL OUTER JOIN in SQLite using UNION
SELECT Customers.CustomerID, Customers.Name, Orders.Product
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
UNION
SELECT Customers.CustomerID, Customers.Name, Orders.Product
FROM Orders
LEFT JOIN Customers
ON Customers.CustomerID = Orders.CustomerID;
