-- alx_book_store.sql (REVISED)

-- 1. DATABASE CREATION
-- Create the database only if it doesn't already exist
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- Use the newly created database
USE alx_book_store;


-- 2. TABLE CREATION

-- Authors Table
-- Stores information about authors.
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- Books Table
-- Stores information about books available in the bookstore.
CREATE TABLE IF NOT EXISTS Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    -- Foreign Key constraint linking books to authors
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Customers Table
-- Stores information about customers.
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL UNIQUE,
    address TEXT
);

-- Orders Table
-- Stores information about orders placed by customers.
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    -- Foreign Key constraint linking orders to customers
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Order_Details Table
-- Stores information about the books included in each order.
CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE NOT NULL,
    -- Foreign Key constraint linking order details to orders
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    -- Foreign Key constraint linking order details to books
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);