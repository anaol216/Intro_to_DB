-- task_6.sql
-- SQL script to insert multiple rows into the 'customers' table in the alx_book_store database.



use  alx_book_store;
INSERT INTO customer (customer_id, customer_name, email, address)
VALUES
(2, 'Blessing Malik', 'bmalik@sandtech.com', '124 Happiness  Ave.'),
(3, 'Obed Ehoneah', 'eobed@sandtech.com', '125 Happiness  Ave.'),
(4, 'Nehemial Kamolu', 'nkamolu@sandtech.com', '126 Happiness  Ave.');