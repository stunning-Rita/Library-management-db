# Library-management-db
# 📚 Library Management Database (MySQL)

## 📖 Project Overview
This project implements a **Library Management System** database in MySQL.  
It is designed to demonstrate **good database design principles** including:  
- Primary Keys & Foreign Keys  
- One-to-Many and Many-to-Many relationships  
- Constraints for data integrity  
- Sample data inserts  

The schema covers **Members**, **Books**, **Authors**, and **Loans**.

---

## 📂 Files
- `answers.sql` → Contains the full database schema and sample data.

---

## 🛠️ How to Run
1. Open **MySQL Workbench** (or any MySQL client).  
2. Copy the contents of `answers.sql`.  
3. Execute the script to create the database and populate it with sample data.  

This will create a database called **`LibraryDB`** with the following tables:  
- `Members` → Stores library members.  
- `Books` → Stores books and availability.  
- `Authors` → Stores author details.  
- `BookAuthors` → Links books with authors (Many-to-Many).  
- `Loans` → Tracks borrowed books and returns.  

---

## 🔑 Sample Queries

Here are some useful queries to test your database:

### 1. List all members
```sql
SELECT * FROM Members;
2. Find all books currently borrowed
SELECT M.Name, B.Title, L.LoanDate
FROM Loans L
JOIN Members M ON L.MemberID = M.MemberID
JOIN Books B ON L.BookID = B.BookID
WHERE L.ReturnDate IS NULL;

3. Show all authors and their books
SELECT A.AuthorName, B.Title
FROM Authors A
JOIN BookAuthors BA ON A.AuthorID = BA.AuthorID
JOIN Books B ON BA.BookID = B.BookID;


AUTHOR-- Rita Umulinga
For academic assignment submission 
