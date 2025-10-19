-- task_4.sql
-- SQL script to print the full description (CREATE TABLE statement) 
-- of the 'BOOKS' table in the current database.


SELECT
    COLUMN_NAME,
    COLUMN_TYPE,
    IS_NULLABLE,
    COLUMN_KEY,
    COLUMN_DEFAULT,
    EXTRA
FROM
    INFORMATION_SCHEMA.COLUMNS
WHERE
    TABLE_SCHEMA = 'alx_book_store' AND TABLE_NAME = 'Books'
ORDER BY
    ORDINAL_POSITION;
