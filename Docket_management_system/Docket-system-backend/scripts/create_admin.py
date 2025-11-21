# scripts/create_admin.py
# This script is used to create a new administrator user in the database.
# It prompts for a username and password, hashes the password, and inserts the new admin into the 'admins' table.

import os
from dotenv import load_dotenv
import mysql.connector
from passlib.hash import bcrypt

# Load environment variables from .env file
load_dotenv()

# Establish a database connection using credentials from environment variables.
conn = mysql.connector.connect(
    host=os.getenv("DB_HOST"),
    user=os.getenv("DB_USER"),
    password=os.getenv("DB_PASSWORD"),
    database=os.getenv("DB_NAME")
)
cur = conn.cursor()

# Prompt for admin username and password.
username = input("admin username: ")
pw = input("admin password (will be hashed): ")

# Hash the provided password using bcrypt for secure storage.
pw_hash = bcrypt.hash(pw)

# Insert the new admin's username and hashed password into the 'admins' table.
# Adapt column names to your admins table if they differ.
cur.execute("INSERT INTO admins (username, password_hash) VALUES (%s, %s)", (username, pw_hash))
conn.commit() # Commit the transaction to save changes to the database.
cur.close()
conn.close()

print("Admin created.")
