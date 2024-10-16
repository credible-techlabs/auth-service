from pydantic import BaseModel

# Models
class User(BaseModel):
    username: str
    password: str