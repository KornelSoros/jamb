from fastapi import APIRouter, Depends
from sqlmodel import Session

from app.db.session import get_session
from app.repositories.game_repository import GameRepository
from app.services.game_service import GameService

router = APIRouter(prefix="/games")

def get_service(db: Session = Depends(get_session)) -> GameService:
    return GameService(GameRepository(db))

@router.post("/new_game")
def start_new_game(service: GameService = Depends(get_service)):
    service.start_new_game()

@router.get("/all_games")
def get_all_games(service: GameService = Depends(get_service)):
    return service.get_all_games()

@router.get("/game/{id}")
def get_game_by_id(id: int, service: GameService = Depends(get_service)):
    return service.get_game_by_id(id)

@router.get("/game/{id}/avaiable_fields")
def get_avaiable_fields(id: int, service: GameService = Depends(get_service)):
    return service.get_avaiable_fields(id)