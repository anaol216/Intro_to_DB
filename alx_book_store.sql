-- alx_book_store.sql

-- 1. DATABASE CREATION
-- Drop the database if it already exists to ensure a clean start
DROP DATABASE IF EXISTS alx_book_store;

-- Create the database
CREATE DATABASE alx_book_store;

-- Use the newly created database
USE alx_book_store;


-- 2. TABLE CREATION

-- Authors Table
CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- Books Table
CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    -- Foreign Key constraint linking books to authors
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL UNIQUE, -- Email should likely be unique
    address TEXT
);

-- Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    -- Foreign Key constraint linking orders to customers
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Order_Details Table (Junction table for the many-to-many relationship between Orders and Books)
CREATE TABLE Order_Details (
    orderdetailid INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE NOT NULL,
    -- Foreign Key constraint linking order details to orders
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    -- Foreign Key constraint linking order details to books
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);