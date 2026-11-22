from sqlmodel import Session, select

from app.models.game import Game


class GameRepository:
    def __init__(self, db: Session):
        self.db = db

    def start_new_game(self):
        init_values = [5 * [None]] * 6
        new_game = Game(table_values=init_values)
        self.db.add(new_game)
        self.db.commit()
        self.db.refresh(new_game)

    def get_all_games(self):
        statement = select(Game).order_by(Game.id)
        results = self.db.exec(statement).all()
        return results

    def get_game_by_id(self, id):
        statement = select(Game).where(Game.id == id)
        return self.db.exec(statement).one()

    def get_avaiable_fields(self, id):
        pass