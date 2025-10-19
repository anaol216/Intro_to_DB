-- task_5.sql
-- SQL script to insert a single row into the 'customers' table in the alx_book_store database.

use alx_book_store;
INSERT INTO customer (customer_id, customer_name, email, address)
VALUES (1, 'Cole Baidoo', 'cbaidoo@sandtech.com', '123 Happiness Ave.');
