from sqlalchemy import TEXT, Column, ForeignKey
from models.base import Base
from sqlalchemy.orm import relationship


class Favorite(Base):
    __tablename__ = "favorites"

    id = Column(TEXT, primary_key=True)
    song_id = Column(TEXT, ForeignKey("songs.id"))
    user_id = Column(TEXT, ForeignKey("user.id"))

    song = relationship('Song')
    user = relationship('User', back_populates='favorites')
