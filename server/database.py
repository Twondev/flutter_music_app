from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker


DATABASE = 'postgresql://postgres:1234@localhost:5432/fluttermusicapp'
engine = create_engine(DATABASE)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
# access to the database
db = SessionLocal()
