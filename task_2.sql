-- Ensure the correct database is selected before creating tables.
USE alx_book_store;

-- 1. Authors Table
-- Stores information about authors.
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- 2. Customers Table
-- Stores information about customers.
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL,
    address TEXT
);

-- 3. Books Table
-- Stores information about books (FK depends on Authors).
CREATE TABLE IF NOT EXISTS Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES AUTHORS(author_id)
);

-- 4. Orders Table
-- Stores information about orders (FK depends on Customers).
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- 5. Order_Details Table
-- Stores line items for each order (FK depends on Orders and Books).
CREATE TABLE IF NOT EXISTS ORDER_DETAILS (
    orderdetailid INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES ORDERS(order_id),
    FOREIGN KEY (book_id) REFERENCES BOOKS(book_id)
    FOREIGN KEY (order_id) REFERENCES Orders(order_id), 
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
