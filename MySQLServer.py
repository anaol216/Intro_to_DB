# MySQLServer.py
import mysql.connector
from mysql.connector import errorcode

def create_alx_book_store_database():
    """
    Connects to MySQL and creates the alx_book_store database if it doesn't exist.
    """
    # Replace these credentials with your actual MySQL server details
    # NOTE: The host is typically 'localhost' and the password is your root password.
    DB_HOST = "localhost"
    DB_USER = "root"
    DB_PASSWORD = "your_mysql_root_password"  # <-- CHANGE THIS

    DATABASE_NAME = "alx_book_store"
    
    cnx = None  # Initialize connection variable
    cursor = None # Initialize cursor variable

    try:
        # Establish connection to the MySQL server (without specifying a database)
        cnx = mysql.connector.connect(
            host=DB_HOST,
            user=DB_USER,
            password=DB_PASSWORD
        )

        # Create a cursor object to execute SQL commands
        cursor = cnx.cursor()

        # SQL command to create the database if it doesn't exist
        # This prevents the script from failing if the database is already there.
        CREATE_DB_QUERY = f"CREATE DATABASE IF NOT EXISTS {DATABASE_NAME}"
        
        # Execute the SQL command
        cursor.execute(CREATE_DB_QUERY)

        # Check if the database was actually created (optional check for the print message)
        # Since we can't use SELECT/SHOW, we rely on the command's success.
        print(f"Database '{DATABASE_NAME}' created successfully!")

    except mysql.connector.Error as err:
        # Handle specific MySQL errors
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Error: Failed to connect to DB. Something is wrong with your username or password.")
        elif err.errno == errorcode.CR_CONN_HOST_ERROR:
            print(f"Error: Failed to connect to DB. Cannot connect to MySQL server on {DB_HOST}.")
        else:
            print(f"Error: Failed to connect to DB. {err}")
    finally:
        # Ensure the cursor and connection are closed in a finally block
        if cursor:
            cursor.close()
        if cnx and cnx.is_connected():
            cnx.close()
            # print("MySQL connection closed.") # Optional confirmation

if __name__ == "__main__":
    create_alx_book_store_database()