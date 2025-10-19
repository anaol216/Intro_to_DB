-- Ensure the correct database is selected before creating tables.
USE alx_book_store;

-- 1. Authors Table
-- Stores information about authors.
CREATE TABLE IF NOT EXISTS AUTHORS (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- 2. Customers Table
-- Stores information about customers.
CREATE TABLE IF NOT EXISTS CUSTOMERS (
    CUSTOMER_ID INT PRIMARY KEY,
    CUSTOMER_NAME VARCHAR(215) NOT NULL,
    EMAIL VARCHAR(215) UNIQUE NOT NULL,
    ADDRESS TEXT
);

-- 3. Books Table
-- Stores information about books (FK depends on Authors).
CREATE TABLE IF NOT EXISTS BOOKS (
    BOOK_ID INT PRIMARY KEY,
    TITLE VARCHAR(130) NOT NULL,
    AUTHOR_ID INT,
    PRICE DOUBLE NOT NULL,
    PUBLICATION_DATE DATE,
    FOREIGN KEY (AUTHOR_ID) REFERENCES AUTHORS(AUTHOR_ID)
);

-- 4. Orders Table
-- Stores information about orders (FK depends on Customers).
CREATE TABLE IF NOT EXISTS ORDERS (
    ORDER_ID INT PRIMARY KEY,
    CUSTOMER_ID INT,
    ORDER_DATE DATE NOT NULL,
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS(CUSTOMER_ID)
);

-- 5. Order_Details Table
-- Stores line items for each order (FK depends on Orders and Books).
CREATE TABLE IF NOT EXISTS ORDER_DETAILS (
    ORDERDETAILID INT PRIMARY KEY,
    ORDER_ID INT,
    BOOK_ID INT,
    QUANTITY DOUBLE NOT NULL,
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID),
    FOREIGN KEY (BOOK_ID) REFERENCES BOOKS(BOOK_ID)
);
