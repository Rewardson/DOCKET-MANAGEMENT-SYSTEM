import os
import sys
import mysql.connector
from passlib.hash import bcrypt
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

# Add the project root to the python path for module imports
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

# Helper function to establish a database connection.
def get_db_connection():
    return mysql.connector.connect(
        host=os.getenv("DB_HOST", "localhost"),
        user=os.getenv("DB_USER", "root"),
        password=os.getenv("DB_PASSWORD", ""),
        database=os.getenv("DB_NAME", "docket_system"),
    )

# Function to hash existing plain-text admin passwords and update them in the database.
def hash_admin_passwords():
    conn = get_db_connection()
    cur = conn.cursor(dictionary=True)

    try:
        # Select admin IDs and their current plain-text passwords.
        cur.execute("SELECT admin_id, password FROM admins WHERE password IS NOT NULL")
        admins = cur.fetchall()

        # Iterate through each admin, hash their password, and update the database.
        for admin in admins:
            password_hash = bcrypt.hash(admin["password"])
            cur.execute("UPDATE admins SET password_hash = %s, password = NULL WHERE admin_id = %s", (password_hash, admin["admin_id"]))

        conn.commit() # Commit changes to the database.
        print(f"{len(admins)} admin passwords hashed successfully.")

    except Exception as e:
        conn.rollback() # Rollback changes if an error occurs.
        print(f"An error occurred: {e}")

    finally:
        cur.close()
        conn.close()

# Entry point for the script.
if __name__ == "__main__":
    hash_admin_passwords()
