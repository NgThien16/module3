-- --- STEP 1: CREATE THE DATABASE ---
-- (Optional: If you don't have a database yet)
CREATE DATABASE db_bookstore
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

-- --- STEP 2: USE THE DATABASE ---
USE db_bookstore;

-- --- STEP 3: CREATE THE TABLES ---

-- Table for storing Author information
CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    AuthorName VARCHAR(255) NOT NULL,
    Biography TEXT,
    BirthYear INT
);

-- Table for storing Publisher information
CREATE TABLE Publishers (
    PublisherID INT AUTO_INCREMENT PRIMARY KEY,
    PublisherName VARCHAR(255) NOT NULL UNIQUE,
    Address VARCHAR(500),
    Phone VARCHAR(20)
);

-- Table for book categories (e.g., Fiction, Science, History)
CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(255) NOT NULL UNIQUE
);

-- The main table for Books
CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(500) NOT NULL,
    Description TEXT,
    Price DECIMAL(13, 2) NOT NULL,        -- Selling price (e.g., 25.99)
    StockQuantity INT NOT NULL DEFAULT 0, -- Quantity in stock
    CoverImageURL VARCHAR(500),         -- Path to the cover image file
    PublicationYear INT,

    -- Foreign keys linking to other tables
    AuthorID INT,
    CategoryID INT,
    PublisherID INT,

    -- Create foreign key relationships
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID)
);

-- Table for user accounts (formerly 'KhachHang')
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    PasswordHash VARCHAR(255) NOT NULL, -- IMPORTANT: Store the HASHED password
    PhoneNumber VARCHAR(20) UNIQUE,
    ShippingAddress VARCHAR(500),
    
    -- Role column for permission (admin/user)
    -- ENUM is a good choice here to restrict values
    Role ENUM('user', 'admin') NOT NULL DEFAULT 'user' 
);

-- Table for Orders (Stores general info for each purchase)
CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,                          -- Foreign key linking to Users
    OrderDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    TotalPrice DECIMAL(13, 2) NOT NULL,
    Status VARCHAR(100) NOT NULL DEFAULT 'Processing', -- e.g., Processing, Shipped, Cancelled
    ShippingAddress VARCHAR(500) NOT NULL, -- Saved at time of order
    Notes TEXT,

    -- If a User account is deleted, keep the order history (SET NULL)
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE SET NULL
);

-- Table for Order Details (Stores which books are in which order)
-- This is the "Junction Table" for the Many-to-Many relationship 
-- between Orders and Books
CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT NOT NULL,
    BookID INT NOT NULL,
    Quantity INT NOT NULL,
    PriceAtPurchase DECIMAL(13, 2) NOT NULL, -- Price of the book at the time of purchase

    -- Ensures a book appears only once per order
    UNIQUE KEY (OrderID, BookID), 

    -- If an Order is deleted -> delete its related details
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE, 
    -- Do not allow deleting a Book if it has been ordered (RESTRICT)
    FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE RESTRICT 
);