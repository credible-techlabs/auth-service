import mysql.connector

# Database connection
def get_db_connection():
    return mysql.connector.connect(
        host="db-container",
        user="root",
        password="my-secret-pw",
        database="auth_db"
    )