from fastapi import APIRouter, Depends
from sqlmodel import Session

from app.db.session import get_session

router = APIRouter(prefix="/games")

@router.post("/new_game")
def start_new_game(db: Session = Depends(get_session)):
    print("HE")