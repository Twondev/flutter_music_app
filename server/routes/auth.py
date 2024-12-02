import uuid
import bcrypt
from fastapi import HTTPException
from models.user import User
from fastapi import APIRouter
from pydantic_schemas.user_create import UserCreate
from database import db

router = APIRouter()


@router.post('/signup')
def signup_user(user: UserCreate):
    #    to retreive the user on the db if its  already existing
    user_db = db.query(User).filter(User.email == user.email).first()

    if user_db:
        raise HTTPException(status_code=400, detail="User already exists")

    hashed_pw = bcrypt.hashpw(user.password.encode(), bcrypt.gensalt(16))

    user_db = User(id=str(uuid.uuid4()), name=user.name,
                   email=user.email, password=hashed_pw)
    db.add(user_db)
    db.commit()
    db.refresh(user_db)
    return user_db
