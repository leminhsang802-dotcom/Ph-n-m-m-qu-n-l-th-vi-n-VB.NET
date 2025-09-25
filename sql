CREATE DATABASE LibraryDB;
GO

USE LibraryDB;
GO

-- Bảng Users (Đăng nhập)
CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL UNIQUE,
    [Password] NVARCHAR(100) NOT NULL
);

-- Bảng Readers (Bạn đọc)
CREATE TABLE Readers (
    ReaderID INT IDENTITY(1,1) PRIMARY KEY,
    ReaderName NVARCHAR(100) NOT NULL,
    Phone NVARCHAR(20),
    Email NVARCHAR(100)
);

-- Bảng Books (Sách)
CREATE TABLE Books (
    BookID INT IDENTITY(1,1) PRIMARY KEY,
    BookTitle NVARCHAR(150) NOT NULL,
    Author NVARCHAR(100),
    Publisher NVARCHAR(100),
    Year INT,
    Quantity INT NOT NULL
);

-- Bảng Borrows (Phiếu mượn)
CREATE TABLE Borrows (
    BorrowID INT IDENTITY(1,1) PRIMARY KEY,
    ReaderID INT NOT NULL,
    BorrowDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (ReaderID) REFERENCES Readers(ReaderID)
);

-- Bảng BorrowDetails (Chi tiết mượn)
CREATE TABLE BorrowDetails (
    BorrowDetailID INT IDENTITY(1,1) PRIMARY KEY,
    BorrowID INT NOT NULL,
    BookID INT NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (BorrowID) REFERENCES Borrows(BorrowID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);
INSERT INTO [dbo].[Users]
           ([Username]
           ,[Password])
     VALUES
           ('admin'
           ,'admin')
GO
