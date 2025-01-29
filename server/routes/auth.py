import uuid
import bcrypt
from fastapi import HTTPException, Header
from fastapi.params import Depends
from database import get_db
from middleware.auth_middleware import auth_middleware
from models.user import User
from fastapi import APIRouter
from pydantic_schemas.user_create import UserCreate
from sqlalchemy.orm import Session
import jwt
from pydantic_schemas.user_login import UserLogin
from sqlalchemy.orm import joinedload

router = APIRouter()


@router.post('/signup', status_code=201)
def signup_user(user: UserCreate, db: Session = Depends(get_db)):
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

# login router


@router.post('/login')
def login_user(user: UserLogin, db: Session = Depends(get_db)):
    #    to retreive the user on the db if its  already existing
    user_db = db.query(User).filter(User.email == user.email).first()
    if not user_db:
        raise HTTPException(
            status_code=400, detail="User with this email does not exist")

    # checking the password
    is_match = bcrypt.checkpw(user.password.encode(), user_db.password)
    if not is_match:
        raise HTTPException(400, 'incorrect password')

    token = jwt.encode({'id': user_db.id}, 'password_key', algorithm='HS256')
    print("Generated token:", token)
    return {'token': token, 'user': user_db}
# to get the user data


@router.get('/')
def current_user_data(db: Session = Depends(get_db),
                      user_dict=Depends(auth_middleware)):
    user = db.query(User).filter(
        User.id == user_dict['uid']).options(joinedload(User.favorites)).first()
    if not user:
        raise HTTPException(404, 'User not found!')
    return user
