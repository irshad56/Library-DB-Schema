-- Create Database
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- Library Table
CREATE TABLE Library (
    LibraryID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Location VARCHAR(100)
);

-- Librarian Table
CREATE TABLE Librarian (
    LibrarianID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Contact VARCHAR(50),
    LibraryID INT,
    FOREIGN KEY (LibraryID) REFERENCES Library(LibraryID)
);

-- Book Table
CREATE TABLE Book (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Author VARCHAR(100),
    ISBN VARCHAR(50) UNIQUE,
    LibraryID INT,
    FOREIGN KEY (LibraryID) REFERENCES Library(LibraryID)
);

-- Customer Table
CREATE TABLE Customer (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15)
);

-- Rental Table (Transactions)
CREATE TABLE Rental (
    RentalID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT,
    CustomerID INT,
    LibrarianID INT,
    IssueDate DATE,
    ReturnDate DATE,
    Status ENUM('Issued','Returned') DEFAULT 'Issued',
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (LibrarianID) REFERENCES Librarian(LibrarianID)
);
