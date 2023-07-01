[8:55 am, 01/07/2023] 5i0_DivyaSriPasupuleti: -- BOOKS TABLE
CREATE TABLE Books (
  BookID INT PRIMARY KEY,
  Title VARCHAR(100),
  Author VARCHAR(100),
  Publisher VARCHAR(100),
  PublicationYear INT,
  ISBN VARCHAR(20),
  Genre VARCHAR(50),
  Availability BOOLEAN
);

-- BORROWERS TABLE
CREATE TABLE Borrowers (
  BorrowerID INT PRIMARY KEY,
  Name VARCHAR(100),
  Address VARCHAR(100),
  PhoneNumber VARCHAR(20),
  Email VARCHAR(100)
);

-- LOANS TABLE
CREATE TABLE Loans (
  LoanID INT PRIMARY KEY,
  BookID INT,
  BorrowerID INT,
  DateBorrowed DATE,
  DueDate DATE,
  DateReturned DATE,
  FOREIGN KEY (BookID) REFERENCES Books(BookID),
  FOREIGN KEY (BorrowerID) REFERENCES Borrowers(BorrowerID)
);

-- RESERVATIONS TABLE
CREATE TABLE Reservations (
  ReservationID INT PRIMARY KEY,
  BookID INT,
  BorrowerID INT,
  DateReserved DATE,
  FOREIGN KEY (BookID) REFERENCES Books(BookID),
  FOREIGN KEY (BorrowerID) REFERENCES Borrowers(BorrowerID)
);
-- Get all available books:
SELECT * FROM Books WHERE Availability = 1;

-- Get all borrowed books:
SELECT Books.Title, Books.Author, Borrowers.Name, Loans.DateBorrowed, Loans.DueDate
FROM Books
INNER JOIN Loans ON Books.BookID = Loans.BookID
INNER JOIN Borrowers ON Loans.BorrowerID = Borrowers.BorrowerID;

-- Get all reserved books:
SELECT Books.Title, Books.Author, Borrowers.Name, Reservations.DateReserved, Reservations.DateNeeded
FROM Books
INNER JOIN Reservations ON Books.BookID = Reservations.BookID
INNER JOIN Borrowers 
ON Reservations.BorrowerID = Borrowers.BorrowerID;

-- Get all books borrowed by a specific borrower:
SELECT Books.Title, Books.Author, Loans.DateBorrowed, Loans.DueDate, Loans.DateReturned
FROM Books
INNER JOIN Loans ON Books.BookID = Loans.BookID
INNER JOIN Borrowers ON Loans.BorrowerID = Borrowers.BorrowerID
WHERE Borrowers.BorrowerID = Loans.BorrowerID;

-- Get all reservations made by a specific borrower:
SELECT Books.Title, Books.Author, Reservations.DateReserved, Reservations.DateNeeded, Reservations.Status
FROM Books
INNER JOIN Reservations ON Books.BookID = Reservations.BookID
INNER JOIN Borrowers ON Reservations.BorrowerID = Borrowers.BorrowerID
WHERE Borrowers.BorrowerID = Reservations.BorrowerID;
