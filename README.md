# 📚 Library Database Schema

## 📌 Overview
This project is part of the **Library Management Database** tasks.  
It covers **Task 1: Database Setup and Schema Design** and **Task 2: Data Insertion and Handling Nulls**.

---

## 🏗 Entities
- **Library**: Stores library details.
- **Librarian**: Manages books and rentals.
- **Book**: Stores book details.
- **Customer**: Users who borrow books.
- **Rental**: Tracks issue and return transactions.

---

## ⚡ Task 1: Schema
The SQL script [`schema.sql`](schema.sql) creates:
- Tables
- Primary & Foreign Keys
- Relationships

### 🖼 ER Diagram
[ER Diagram](ER-Diagram.pdf)

---

## ⚡ Task 2: Data Insertion & Handling Nulls
The SQL script [`task2.sql`](task2.sql) contains:
- **INSERT** statements with some `NULL` values for missing data
- **UPDATE** statements to fix missing/incorrect information
- **DELETE** statements using primary keys (safe mode friendly)
- **SELECT** statements to verify data after each operation

**Entities populated in Task 2:**
- Librarian
- Customer
- Book
- Rental

---

## 🚀 Tools Used
- MySQL Workbench (for schema, ER diagram, and queries)
- SQLiteStudio / DB Fiddle (optional, for running queries)
- GitHub (for version control & submission)

---

✅ Deliverables: 
- `schema.sql`  
- `ER-Diagram.pdf`  
- `task2.sql`
