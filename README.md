# 📚 Library Database Schema

## 📌 Overview
This project is part of the **Library Management Database** tasks.  
It currently covers:
- **Task 1: Database Setup and Schema Design**  
- **Task 2: Data Insertion and Handling Nulls**  
- **Task 3: Writing Basic SELECT Queries**  
- **Task 4: Aggregate Functions and Grouping**  
- **Task 5: SQL Joins (INNER, LEFT, RIGHT, FULL)**  

---

## 🏗 Entities
- **Library**: Stores library details.  
- **Librarian**: Manages books and rentals.  
- **Book**: Stores book details.  
- **Customer**: Users who borrow books.  
- **Rental**: Tracks issue and return transactions.  
- **Employee** (Task 3 example): Used to demonstrate SELECT queries.  
- **Students** (Task 4 example): Used to demonstrate aggregate functions.  
- **Customers & Orders** (Task 5 example): Used to demonstrate SQL joins.  

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

## ⚡ Task 3: Basic SELECT Queries
The SQL script [`task3.sql`](task3.sql) contains examples of:
- `SELECT *` and specific column selection  
- `WHERE` with `AND` / `OR`  
- `LIKE` with different patterns (`%`, `_`)  
- `BETWEEN` for ranges  
- `ORDER BY` for sorting results  
- `LIMIT` for top-N queries  

**Demo Table Used:** `employee` (for practicing queries)

---

## ⚡ Task 4: Aggregate Functions and Grouping
The SQL script [`task4.sql`](task4.sql) demonstrates:
- `SUM`, `AVG`, `COUNT` on numeric columns  
- `GROUP BY` to categorize results by department  
- `HAVING` to filter grouped results  
- Combination of `HAVING` and `LIKE` for advanced filtering  

**Demo Table Used:** `students` (for practicing aggregate queries)  

---

## ⚡ Task 5: SQL Joins
The SQL script [`task5.sql`](task5.sql) demonstrates:
- Creation of `Customers` and `Orders` tables  
- Sample data insertion (including orphan orders for join demonstration)  
- **INNER JOIN** → Matching rows only  
- **LEFT JOIN** → All customers + matching orders  
- **RIGHT JOIN** → All orders + matching customers  
- **FULL OUTER JOIN** → Implemented using `UNION` (since MySQL doesn’t support it directly)  

**Demo Tables Used:** `Customers` and `Orders`  

---

## 🚀 Tools Used
- MySQL Workbench (for schema, ER diagram, and queries)  
- SQLiteStudio / DB Fiddle (optional, for running queries)  
- GitHub (for version control & submission)  

---

✅ **Deliverables**:  
- `schema.sql`  
- `ER-Diagram.pdf`  
- `task2.sql`  
- `task3.sql`  
- `task4.sql`  
- `task5.sql`  
