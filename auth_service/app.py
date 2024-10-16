from fastapi import FastAPI, Depends, HTTPException
import jwt
import datetime
from auth_service.model import User
from auth_service.db import get_db_connection

app = FastAPI()
SECRET_KEY = "mysecret"

# Authenticate user
@app.post("/auth")
def authenticate(user: User):
    conn = get_db_connection()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM users WHERE username = %s AND password = %s", (user.username, user.password))
    result = cursor.fetchone()
    conn.close()
    
    payload = {
        "username": user.username,
        "iat": datetime.datetime.now(),
        "exp": datetime.datetime.now() + datetime.timedelta(minutes=30)  # Token expiration
    }

    if result:
        token = jwt.encode(payload, SECRET_KEY, algorithm="HS256")
        return {"token": token}
    else:
        raise HTTPException(status_code=401, detail="Invalid username or password")
