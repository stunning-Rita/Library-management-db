-- Create Database
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- Table: Members
CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    JoinDate DATE NOT NULL
);

-- Table: Books
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(150) NOT NULL,
    Genre VARCHAR(50),
    PublishedYear YEAR,
    CopiesAvailable INT DEFAULT 1
);

-- Table: Loans
CREATE TABLE Loans (
    LoanID INT AUTO_INCREMENT PRIMARY KEY,
    MemberID INT NOT NULL,
    BookID INT NOT NULL,
    LoanDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Optional: Table Authors
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    AuthorName VARCHAR(100) NOT NULL
);

-- Optional: BookAuthors for Many-to-Many
CREATE TABLE BookAuthors (
    BookID INT,
    AuthorID INT,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

---------------------------------------------------------
-- Insert Sample Data
---------------------------------------------------------

-- Members
INSERT INTO Members (Name, Email, JoinDate) VALUES
('Alice Johnson', 'alice.johnson@example.com', '2024-01-10'),
('Bob Smith', 'bob.smith@example.com', '2024-03-15'),
('Charlie Brown', 'charlie.brown@example.com', '2024-06-20');

-- Books
INSERT INTO Books (Title, Genre, PublishedYear, CopiesAvailable) VALUES
('Introduction to Databases', 'Education', 2020, 3),
('The Great Gatsby', 'Fiction', 1925, 2),
('Python Programming 101', 'Technology', 2022, 5);

-- Authors
INSERT INTO Authors (AuthorName) VALUES
('F. Scott Fitzgerald'),
('John Doe'),
('Jane Miller');

-- BookAuthors (linking Books and Authors)
INSERT INTO BookAuthors (BookID, AuthorID) VALUES
(2, 1), -- The Great Gatsby by Fitzgerald
(1, 2), -- Intro to Databases by John Doe
(3, 3); -- Python Programming 101 by Jane Miller

-- Loans
INSERT INTO Loans (MemberID, BookID, LoanDate, ReturnDate) VALUES
(1, 2, '2024-07-01', '2024-07-15'), -- Alice borrowed The Great Gatsby
(2, 1, '2024-07-05', NULL),         -- Bob borrowed Intro to Databases (not yet returned)
(3, 3, '2024-07-10', '2024-07-20'); -- Charlie borrowed Python Programming
