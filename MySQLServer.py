# MySQLServer.py

import mysql.connector
from mysql.connector import errorcode

def create_alx_book_store_database():
    """
    Connects to MySQL and creates the alx_book_store database if it doesn't exist.
    """
    # Replace these credentials with your actual MySQL server details
    DB_HOST = "localhost"
    DB_USER = "root"
    DB_PASSWORD = "your_mysql_root_password"  # <-- CHANGE THIS

    DATABASE_NAME = "alx_book_store"
    
    cnx = None
    cursor = None

    try:
        # 1. Establish connection to the MySQL server
        cnx = mysql.connector.connect(
            host=DB_HOST,
            user=DB_USER,
            password=DB_PASSWORD
        )

        cursor = cnx.cursor()

        # 2. SQL command to create the database if it doesn't exist
        # This is the line that fulfills the requirement: "CREATE DATABASE IF NOT EXISTS alx_book_store"
        CREATE_DB_QUERY = f"CREATE DATABASE IF NOT EXISTS {DATABASE_NAME}"
        
        # 3. Execute the SQL command
        cursor.execute(CREATE_DB_QUERY)

        # 4. Print success message
        print(f"Database '{DATABASE_NAME}' created successfully!")

    except mysql.connector.Error as err:
        # Handle connection and other MySQL errors
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Error: Failed to connect to DB. Something is wrong with your username or password.")
        elif err.errno == errorcode.CR_CONN_HOST_ERROR:
            print(f"Error: Failed to connect to DB. Cannot connect to MySQL server on {DB_HOST}.")
        else:
            print(f"Error: Failed to connect to DB. {err}")
    finally:
        # 5. Ensure cleanup
        if cursor:
            cursor.close()
        if cnx and cnx.is_connected():
            cnx.close()

if __name__ == "__main__":
    create_alx_book_store_database()